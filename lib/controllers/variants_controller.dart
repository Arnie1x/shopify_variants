import 'package:get/get.dart';
import 'package:shopify_variants/controllers/product_controller.dart';
import 'package:shopify_variants/pages/options.dart';

class VariantsController extends GetxController {
  final Variants variantWidget;

  VariantsController(this.variantWidget);

  var productsController = Get.find<ProductController>();
  RxList<String> optionsList = <String>[].obs;
  RxList<String> variantsList = <String>[].obs;
  RxList<List<String>> optionsNestedList = <List<String>>[].obs;

  final _obj = 0.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  @override
  void onInit() {
    variantsList = updateVariants();
    super.onInit();
  }

  RxList<String> updateVariants() {
    optionsList = <String>[].obs;
    // variantsList = <String>[].obs;
    variantsList = variantWidget.variantsList;
    optionsNestedList = <List<String>>[].obs;

    print(variantWidget.id);
    var productOptions = productsController.products[variantWidget.id].options;

    if (productOptions == null) {
      return <String>[].obs;
    }

    for (var option in productOptions) {
      optionsNestedList.add(option.values.elementAt(0));
    }

    var firstOption = optionsNestedList.first;
    optionsNestedList.remove(firstOption);

    if (optionsNestedList.isEmpty) {
      optionsList = firstOption.obs;
      return optionsList;
    }
    optionsNestedList.refresh();

    for (var value in optionsNestedList) {
      optionsList.addAll(value);
    }
    optionsList.refresh();

    for (var firstOptionValue in firstOption) {
      for (var secondOptionValue in optionsList) {
        variantsList.add(
          '$firstOptionValue / $secondOptionValue',
        );
      }
    }
    variantsList.refresh();
    update();
    print(variantsList);
    return variantsList;
  }
}
