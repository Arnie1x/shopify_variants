# Variants Application with Flutter

This repository contains the code for a Variants Application developed using Flutter and GetX. The application allows users to manage product options and automatically generates variants based on the selected options.

An application to the project can be installed in the Releases tab.

## Project Highlights

### Product Class

To efficiently manage all product options, a dedicated `Product` class has been implemented. This class not only stores the product details but also encapsulates the product options.

### Option Processing

When a new option is created, the application processes variants in real-time. The logic follows these principles:

- If there is only one option, the option values are considered as variants.
- If there are multiple options, the application intelligently generates variants by combining all possible product values from different options.

## Dart Packages Used

The primary package used for this project is [GetX](https://pub.dev/packages/get). GetX is a powerful package that seamlessly handles state management, route management, and dependency management in Flutter applications.
When using GetX, there is no need to use Stateful Widgets as GetX will render faster with Stateless Widgets and it's powerful state management.

## Project Structure

The project is organized with a clear structure to enhance readability and maintainability. Key directories include:

- **lib:** Contains the main application code.
  - **controllers:** Contains the different controllers that are used by the application.
  - **models:** : Contains the `Product` Model 
  - **pages:** : Contains our main UI
  - **widgets:** : Contains the diffeent Flutter widgets that are used by the application.

## How to Run the Application

Follow these steps to run the Variants Application:

1. Clone the repository to your local machine.
2. Ensure you have Flutter and Dart installed.
3. Navigate to the project directory.
4. Run `flutter pub get` to install dependencies.
5. Launch the application using `flutter run`.

## Additional Notes

- Using a `Product` Class allows for adding multiple products easily while each product still maintains their own respective options and variants.
