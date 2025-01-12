import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/message/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/theme/app_colors.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/domain/auth/usecase/signin.dart';
import 'package:movie_app/presentation/auth/pages/sign_up.dart';
import 'package:movie_app/presentation/home/pages/home_page.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signInText(),
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
              _signUpText(context),
            ],
          )),
    );
  }

  Widget _signInText() {
    return const Text(
      "Sign In",
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
        title: 'Sign In',
        activeColor: AppColors.primary,
        height: 45,
        onPressed: () async => sl<SigninUseCase>().call(
            params: SigninReqParams(
                email: _emailController.text,
                password: _passwordController.text)),
        onSuccess: () {
          AppNavigator.pushAndRemove(context, const HomePage());
        },
        onFailure: (error) {
          DisplayMessage.errorMessage(error, context);
        });
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Don't you have account? "),
      TextSpan(
          style: const TextStyle(
            color: Colors.blue,
          ),
          text: 'Sign Up',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SignUpPage());
            })
    ]));
  }
}
