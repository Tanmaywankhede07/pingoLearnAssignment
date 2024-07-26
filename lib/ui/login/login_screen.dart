import 'package:flutter/material.dart';
import 'package:pingolearn/extension/extention%20function.dart';
import 'package:pingolearn/res/AppColors.dart';
import 'package:pingolearn/res/text_style.dart';
import 'package:pingolearn/ui/homepage/home_screen.dart';
import 'package:pingolearn/ui/signup/signup_screen.dart';
import 'package:pingolearn/utils/Dialogs.dart';
import 'package:pingolearn/utils/widget_util.dart';
import 'package:pingolearn/widgets/pingo_learn_button.dart';
import 'package:provider/provider.dart';
import 'package:pingolearn/providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(50),
            Text('e-shop', style: AppTextStyles.style22px.w800.withColor(AppColors.colorPrimary)),
            Spacer(),
            inputContainer(
              hinttxt: 'Email',
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter your email')));
                }
                final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                if (!emailRegex.hasMatch(value.toString())) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a valid email address')));
                }
                return null;
              },
            ),
            verticalSpace(14),
            inputContainer(hinttxt: 'Password', controller: _passwordController),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PingoLearnButton(text: 'Login').onClick(() {
                  if (_emailController.text != '' && _passwordController.text != '')
                    _signIn(context, _emailController, _passwordController);
                  else
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a valid email address')));
                }),
                verticalSpace(15),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'New here?', style: AppTextStyles.style14px.w500.withColor(AppColors.black)),
                      TextSpan(text: 'Signup', style: AppTextStyles.style14px.w800.withColor(AppColors.colorPrimary)),
                    ],
                  ),
                ).onClick(() => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()))),
              ],
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }

  Widget inputContainer({required String hinttxt, required TextEditingController controller, String? Function(String?)? validator}) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        controller: controller,
        validator: validator, // Apply validator function
        decoration: InputDecoration(
          hintText: hinttxt,
          hintStyle: AppTextStyles.style14px.w500.withColor(AppColors.black),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Future<void> _signIn(BuildContext context, TextEditingController emailController, TextEditingController passwordController) async {
    Dialogs.showLoader(context, "Please wait...");
    try {
      await Provider.of<AuthProvider>(context, listen: false).signIn(
        emailController.text,
        passwordController.text,
      );
      await Dialogs.hideLoader(context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    } catch (e) {
      await Dialogs.hideLoader(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    }
  }
}
