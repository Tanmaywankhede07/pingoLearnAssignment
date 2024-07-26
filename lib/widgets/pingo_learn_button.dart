import 'package:flutter/material.dart';
import 'package:pingolearn/extension/extention%20function.dart';
import 'package:pingolearn/res/AppColors.dart';
import 'package:pingolearn/res/strings.dart';
import 'package:pingolearn/res/text_style.dart';
import 'package:pingolearn/utils/utility.dart';

class PingoLearnButton extends StatelessWidget {
  final String? text;

  const PingoLearnButton({this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50.0,
        width: Utility.screenWidth(context) * 0.60,
        decoration: const BoxDecoration(
          color: AppColors.colorPrimary,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color:  Color(0xFFE6E8E6),
              spreadRadius: 2.0,
              blurRadius: 8.0,
              offset: Offset(2, 5),
            ),
          ],
        ),
        child:
        Center(child: Text(text ?? Strings.nullText, style: AppTextStyles.style16px.w700.withColor(AppColors.white), textAlign: TextAlign.center)),
      ),
    );
  }
}
