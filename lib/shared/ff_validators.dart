import 'package:form_field_validator/form_field_validator.dart';

class FFValidators {
  static final almostPhoneNumberValidator = PatternValidator(
      r'^(?:[+0])$|(?:[+0])[1-9]$|(?:[+0])[1-9][0-9]$|(?:[+0])[1-9]\d[0-9]{1,5}$',
      errorText: "Phone number not entered completely");
  static final phoneNumberValidator = PatternValidator(
      r'^(?:[+0])[1-9]\d[0-9]{5,14}$',
      errorText: "Phone number is not valid");
  static final stringValidator = PatternValidator(r'^.*[a-zA-Z].*',
      errorText: "Email not entered completely");
  static final emailValidator =
      EmailValidator(errorText: "Enter a valid email address");
}
