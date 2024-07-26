import 'package:pingolearn/res/text_style.dart';
import 'package:pingolearn/utils/widget_util.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn/extension/extention%20function.dart';
import 'package:pingolearn/res/AppColors.dart';

class Dialogs {
  static ProgressDialog? pd;

  static ProgressDialog? _dialog;

  static void showLoader(BuildContext context, String description) {
    // print(context.toString() + 'nameeeeeeeeeeee');
    _dialog = ProgressDialog(context,
        type: ProgressDialogType.normal,
        isDismissible: false,
        customBody: Container(
          height: 65.0,
          child: Row(
            children: [
              horizontalSpace(20.0),
              Container(width: 24.0, height: 24.0, child: CircularProgressIndicator()),
              horizontalSpace(20.0),
              Expanded(
                child: Text('$description', style: AppTextStyles.style14px.w500, overflow: TextOverflow.ellipsis),
              ),
              AnimatedCloseButton(),
            ],
          ),
        ));
    _dialog?.show();

    // Future.delayed(Duration(seconds: 7), () {
    //   if (_dialog.isShowing()) {
    //     _dialog.hide();
    //   }
    // });
  }

  static Future<Object> hideLoader(BuildContext context) async {
    // Navigator.pop(context);

    await Future.delayed(Duration(milliseconds: 400));

    if (_dialog != null) {
      _dialog?.hide().then((value) {
        if (_dialog?.isShowing() ?? true) {
          _dialog?.hide();
        }
      });
    }

    await Future.delayed(Duration(milliseconds: 400));
    return Future(() => true);
  }
}

class AnimatedCloseButton extends StatefulWidget {
  const AnimatedCloseButton({Key? key}) : super(key: key);

  @override
  State<AnimatedCloseButton> createState() => _AnimatedCloseButtonState();
}

class _AnimatedCloseButtonState extends State<AnimatedCloseButton> {
  bool show = false;

  @override
  void initState() {
    super.initState();
    timer();
  }

  Future<void> timer() async {
    await Future.delayed(Duration(seconds: 5));
    show = true;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: show
          ? Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 10.0, left: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorPrimary,
              ),
              child: Icon(Icons.close, size: 24.0, color: AppColors.white,),
            ).onClick(() => Navigator.pop(context))
          : Container(),
    );
  }
}

abstract class ClickInterface {
  void onClick();
}

/*
AlertDialog(
backgroundColor: AppColors.colorPrimary,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(10))),
contentPadding: EdgeInsets.all(0),
titlePadding: EdgeInsets.all(0),
title: Container(
width: Utility.screenWidth(context),
height: 50,
decoration: BoxDecoration(
borderRadius: BorderRadius.only(
topLeft: Radius.circular(10), topRight: Radius.circular(10)),
color: AppColors.colorPrimary,
),
alignment: Alignment.center,
child: Text(title,
style: TextStyle(
color: AppColors.white,
fontFamily: kFontFamily,
fontWeight: FontWeight.bold,
fontSize: 18)),
),
content: Stack(
children: <Widget>[
Container(
color: AppColors.white,
margin: EdgeInsets.only(bottom: 50),
child: SingleChildScrollView(
child: Container(
width: Utility.screenWidth(context),
padding: EdgeInsets.all(10),
),
),
),
Positioned(
bottom: 0,
left: 0,
right: 0,
child: InkWell(
child: Container(
width: Utility.screenWidth(context),
height: 50,
decoration: BoxDecoration(
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(10),
bottomRight: Radius.circular(10)),
color: AppColors.colorPrimary,
),
alignment: Alignment.center,
child: Text(
"Close",
style: TextStyle(
color: AppColors.white,
fontFamily: kFontFamily,
fontWeight: FontWeight.bold,
fontSize: 18),
),
),
onTap: () {
Navigator.pop(context);
listener.onClick();
},
),
),
],
),
)*/
