import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maritime/utilities/constants.dart';
import '../utilities/alert_enum.dart';

class CustomSnackBar {
  static const SnackPosition _snackPosition = SnackPosition.TOP;
  static const EdgeInsets _margin = EdgeInsets.symmetric(
    vertical: AppConstants.defaultPadding,
    horizontal: AppConstants.extraSmallPadding,
  );
  static const Duration _snackBarDuration = Duration(milliseconds: 1500);
  static const double _width = double.infinity;

  CustomSnackBar.showSuccessMessage(String message) {
    const AlertEnum alertEnum = AlertEnum.success;
    Get.snackbar(
      alertEnum.titleText,
      message,
      margin: _margin,
      snackPosition: _snackPosition,
      backgroundColor: alertEnum.backgroundColor,
      colorText: alertEnum.textColor,
      duration: _snackBarDuration,
      maxWidth: _width,
    );
  }

  CustomSnackBar.showErrorMessage(String? message) {
    const AlertEnum alertEnum = AlertEnum.danger;

    Get.snackbar(
      alertEnum.titleText,
      message??"",
      margin: _margin,
      snackPosition: _snackPosition,
      backgroundColor: alertEnum.backgroundColor,
      colorText: alertEnum.textColor,
      duration: _snackBarDuration,
      maxWidth: _width,
    );
  }
}