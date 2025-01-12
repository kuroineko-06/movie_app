import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/message/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/theme/app_colors.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/domain/auth/usecase/signup.dart';
import 'package:movie_app/presentation/auth/pages/sign_in.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signUpText(),
              const SizedBox(
                height: 30,
              ),
              _emailField(),
              const SizedBox(
                height: 20,
              ),
              _passwordField(),
              const SizedBox(
                height: 50,
              ),
              _signInButton(context),
              const SizedBox(
                height: 10,
              ),
              _signInText(context),
            ],
          )),
    );
  }

  Widget _signUpText() {
    return const Text(
      "Sign Up",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signInButton(BuildContext context) {
    return ReactiveButton(
        title: 'Sign Up',
        activeColor: AppColors.primary,
        height: 45,
        onPressed: () async => sl<SignupUseCase>().call(
            params: SignupReqParams(
                email: _emailController.text,
                password: _passwordController.text)),
        onSuccess: () {},
        onFailure: (error) {
          DisplayMessage.errorMessage(error, context);
        });
  }

  Widget _signInText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Do you have account? "),
      TextSpan(
          style: const TextStyle(
            color: Colors.blue,
          ),
          text: 'Sign In',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SignInPage());
            })
    ]));
  }
}
