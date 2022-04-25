import 'package:fireflutterui/shared/ff_textstyles.dart';
import 'package:flutter/cupertino.dart';

class PlainTexts {
  static Text codeNotReceived = Text.rich(
      TextSpan(text: "Didn't receive a code? ", children: [
        TextSpan(
          text: "Wait for 57 sec",
          style: FireFlutterTextStyles.poppinsSize12Weight400BlackOpacity60(
              withOpacity: false),
        ),
      ]),
      style: FireFlutterTextStyles.poppinsSize12Weight400BlackOpacity60());
  static Text registerPageTerms = Text.rich(TextSpan(
      text: "By signing up I agree to Zëdfi’s",
      children: [
        TextSpan(
          text: " Privact policy",
          style: FireFlutterTextStyles.poppinsSize12Weight400BlackOpacity60(
              withOpacity: false),
        ),
        TextSpan(
          text: " and ",
          style: FireFlutterTextStyles.poppinsSize12Weight400BlackOpacity60(),
        ),
        TextSpan(
          text: "Terms of use ",
          style: FireFlutterTextStyles.poppinsSize12Weight400BlackOpacity60(
              withOpacity: false),
        ),
        TextSpan(
          text: "and allow Zedfi to use your information for future ",
          style: FireFlutterTextStyles.poppinsSize12Weight400BlackOpacity60(),
        ),
        TextSpan(
          text: "Marketing purposes.",
          style: FireFlutterTextStyles.poppinsSize12Weight400BlackOpacity60(
              withOpacity: false),
        ),
      ],
      style: FireFlutterTextStyles.poppinsSize12Weight400BlackOpacity60()));
}
