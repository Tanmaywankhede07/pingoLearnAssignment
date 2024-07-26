import 'package:flutter/material.dart';
import 'package:pingolearn/extension/extention%20function.dart';
import 'package:pingolearn/res/AppColors.dart';
import 'package:pingolearn/res/text_style.dart';

Widget verticalSpace(double height) => SizedBox(
      height: height,
    );

Widget horizontalSpace(double height) => SizedBox(
      width: height,
    );


Widget placeHolderWidget(double width, double height) => Container(
      width: width,
      height: height,
      child: Placeholder(),
    );

Center CenterText({String text = "No Data", TextStyle? textStyle}) =>
    Center(child: Text(text, style: textStyle ?? AppTextStyles.style14px.w500.withColor(AppColors.black)));
