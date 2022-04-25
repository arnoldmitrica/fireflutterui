import 'package:fireflutterui/fireflutterui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../ViewModels/catalogviewmodel.dart';

enum TextFieldCase {
  empty,
  phoneNumber,
  email,
  incorrect,
  almostEmail,
  almostPhoneNumber,
}

class FireFlutterTextFields {
  static TextField phoneNumberOrEmail = const TextField(
    decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.greyTextFieldBorder),
            borderRadius: BorderRadius.all(Radius.circular(8)))),
  );
  static PinTheme ffPinTheme = const PinTheme(
      width: 47,
      height: 69,
      textStyle: TextStyle(fontSize: 38),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: AppColors.greyTextFieldBorder, width: 1),
              left: BorderSide(color: AppColors.greyTextFieldBorder, width: 1),
              right: BorderSide(color: AppColors.greyTextFieldBorder, width: 1),
              bottom:
                  BorderSide(color: AppColors.greyTextFieldBorder, width: 1)),
          borderRadius: BorderRadius.all(Radius.circular(8))));
}

class FFPhoneNumberOrEmailTextField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final String? preffixIconStringAsset;
  final String hintText;
  final ChangeNotifierProvider<FireFlutterTextFieldModel> myprovider;
  const FFPhoneNumberOrEmailTextField(
      {required this.controller,
      required this.myprovider,
      required this.hintText,
      this.preffixIconStringAsset,
      Key? key})
      : super(key: key);

  @override
  ConsumerState<FFPhoneNumberOrEmailTextField> createState() =>
      _FFPhoneNumberOrEmailTextFieldState();
}

class _FFPhoneNumberOrEmailTextFieldState
    extends ConsumerState<FFPhoneNumberOrEmailTextField> {
  bool isFocused = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prefixCountry =
        ref.watch(widget.myprovider.select((value) => value.prefixCountry));
    final textFieldCase =
        ref.watch(widget.myprovider.select((value) => value.textFieldCase));
    return Container(
      height: 69,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: AppColors.greyTextFieldBorder, width: 1),
              left: BorderSide(color: AppColors.greyTextFieldBorder, width: 1),
              right: BorderSide(color: AppColors.greyTextFieldBorder, width: 1),
              bottom:
                  BorderSide(color: AppColors.greyTextFieldBorder, width: 1)),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
          padding: textFieldCase == TextFieldCase.almostEmail ||
                  textFieldCase == TextFieldCase.incorrect ||
                  textFieldCase == TextFieldCase.email
              ? const EdgeInsets.only(left: 16)
              : const EdgeInsets.only(left: 0),
          child: Focus(
            onFocusChange: (hasFocus) {
              if (hasFocus != isFocused) {
                setState(() {
                  isFocused = hasFocus;
                });
              }
            },
            child: TextField(
              onChanged: ref.read(widget.myprovider).newValueInTextField,
              controller: widget.controller,
              style: FireFlutterTextStyles.poppinsSize18Weight500Black(
                  withOpacity: false, height: 0.8),
              decoration: InputDecoration(
                labelText: textFieldCase == TextFieldCase.almostPhoneNumber ||
                        textFieldCase == TextFieldCase.phoneNumber
                    ? "Phone number"
                    : textFieldCase == TextFieldCase.empty
                        ? "Phone number or Email"
                        : "Email",
                labelStyle: FireFlutterTextStyles.poppinsSize18Weight500Black(
                    height: 0.8,
                    withOpacity: isFocused
                        ? true
                        : widget.controller.value.text.isNotEmpty
                            ? true
                            : false),
                prefixIcon: widget.controller.value.text.isEmpty ||
                        textFieldCase == TextFieldCase.almostPhoneNumber ||
                        textFieldCase == TextFieldCase.phoneNumber
                    ? UnconstrainedBox(
                        alignment: const Alignment(0.3, -0.1),
                        child: prefixCountry.elementAt(1) == "unknownmap2"
                            ? SizedBox(
                                height: 12,
                                width: 16,
                                child: Image.asset(
                                  'assets/icons/unknownmap2.png',
                                ),
                              )
                            : Image.asset(
                                'icons/flags/png/${prefixCountry.elementAt(1)}.png',
                                package: 'country_icons',
                                height: 12,
                                width: 16,
                              ),
                      )
                    : null,
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}
