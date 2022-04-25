import 'package:fireflutterui/shared/ff_appcolors.dart';
import 'package:fireflutterui/shared/ff_textstyles.dart';
import 'package:flutter/material.dart';

class FFTextButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  const FFTextButton(
      {required this.onPressed, required this.buttonText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        height: 51,
        width: size.width > 327 ? 327 : size.width,
        child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
                backgroundColor: MaterialStateProperty.all(AppColors.lime)),
            child: Text(
              buttonText,
              style: FireFlutterTextStyles.poppinsSize18Weight500Black(),
            )));
  }
}
