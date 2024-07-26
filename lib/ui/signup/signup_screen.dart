import 'package:flutter/material.dart';
import 'package:pingolearn/extension/extention%20function.dart';
import 'package:pingolearn/res/AppColors.dart';
import 'package:pingolearn/res/text_style.dart';
import 'package:pingolearn/ui/homepage/home_screen.dart';
import 'package:pingolearn/utils/Dialogs.dart';
import 'package:pingolearn/utils/widget_util.dart';
import 'package:pingolearn/widgets/pingo_learn_button.dart';
import 'package:provider/provider.dart';
import 'package:pingolearn/providers/auth_provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
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
            inputContainer(hinttxt: 'Name', controller: _nameController),
            verticalSpace(14),
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
                const PingoLearnButton(text: 'Signup').onClick(() => _signUp(context, _nameController, _emailController, _passwordController)),
                verticalSpace(15),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Already have an account?', style: AppTextStyles.style14px.w500.withColor(AppColors.black)),
                      TextSpan(text: 'Login', style: AppTextStyles.style14px.w800.withColor(AppColors.colorPrimary)),
                    ],
                  ),
                ).onClick(() => Navigator.pop(context))
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

  Future<void> _signUp(BuildContext context, TextEditingController nameController, TextEditingController emailController, TextEditingController passwordController) async {
    Dialogs.showLoader(context, "Please wait...");
    try {
      await Provider.of<AuthProvider>(context, listen: false).signUp(
        nameController.text,
        emailController.text,
        passwordController.text,
      );
      await Dialogs.hideLoader(context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    } catch (e) {
      await Dialogs.hideLoader(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up failed: $e')));
    }
  }
}
