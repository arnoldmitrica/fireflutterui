import 'dart:math';

import 'package:fireflutterui/fireflutterui.dart';
import 'package:fireflutterui/shared/ff_constants.dart';
import 'package:fireflutterui/shared/ff_textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

mixin defaultUnknown {
  List<String> prefixCountry = ["+", "unknownmap2"];
  TextFieldCase textFieldCase = TextFieldCase.empty;
  TextEditingController textController = TextEditingController();
}

abstract class FireFlutterTextFieldModel extends ChangeNotifier {
  late List<String> prefixCountry;
  late TextFieldCase textFieldCase;
  late TextEditingController textController;
  void newValueInTextField(String value);
}

class CatalogViewModel extends ChangeNotifier
    with defaultUnknown
    implements FireFlutterTextFieldModel {
  TextFieldCase validateCase(String value) {
    if (value.isEmpty) return TextFieldCase.empty;
    if (FFValidators.emailValidator.isValid(value)) return TextFieldCase.email;
    if (FFValidators.phoneNumberValidator.isValid(value)) {
      return TextFieldCase.phoneNumber;
    }
    if (FFValidators.almostPhoneNumberValidator.isValid(value)) {
      return TextFieldCase.almostPhoneNumber;
    }
    return TextFieldCase.incorrect;
  }

  @override
  void newValueInTextField(String value) {
    // TODO: implement newValueInTextField
    print(value.contains(r'^.*[a-zA-Z].*'));
    final newCaseState = validateCase(value);
    if (newCaseState == TextFieldCase.almostPhoneNumber ||
        textFieldCase == TextFieldCase.phoneNumber && value.length >= 2) {
      final valueToBeSearched = value.substring(0, min(value.length, 5));
      if (valueToBeSearched.characters.elementAt(0) == '+' &&
          valueToBeSearched.length >= 2) {
        var copiedValue = valueToBeSearched;
        while (copiedValue.length >= 2) {
          final countryCodeSearched = FFUtils.countryCodes[copiedValue];
          if (countryCodeSearched != null) {
            prefixCountry = [copiedValue, countryCodeSearched];
            notifyListeners();
          }
          copiedValue = copiedValue.substring(0, copiedValue.length - 1);
        }
      }
    }
    if (newCaseState != textFieldCase) {
      textFieldCase = newCaseState;
      notifyListeners();
    }
  }
}
