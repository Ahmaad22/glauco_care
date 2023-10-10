import 'package:flutter/material.dart';

class GlobalFunctions {
  static void unFocusTextFieldsWhenClickOutSide(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}