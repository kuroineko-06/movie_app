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
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
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
                height: 40,
              ),
              _signInButton(context),
              const SizedBox(
                height: 10,
              ),
              _signUpText(context),
              const SizedBox(
                height: 50,
              ),
            ],
          )),
    );
  }

  Widget _signInText() {
    return const Text(
      "Đăng nhập",
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
      obscureText: _isPasswordHidden,
      decoration: InputDecoration(
        hintText: 'Mật khẩu',
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _togglePasswordView,
        ),
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return ReactiveButton(
        title: 'Đăng nhập',
        activeColor: AppColors.primary,
        height: 45,
        onPressed: () async {
          final result = await sl<SigninUseCase>().call(
            params: SigninReqParams(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );

          result.fold(
            (failure) {
              DisplayMessage.errorMessage(failure.toString(), context);
            },
            (userData) async {
              try {
                final user = userData['user'];
                final id = user['_id'];

                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('id', id ?? '');

                print("ID: $id");

                AppNavigator.pushAndRemove(
                  context,
                  const HomePage(), // Pass full user data
                );
                DisplayMessage.successMessage("Đăng nhập thành công", context);
              } catch (error) {
                print("Error saving data to SharedPreferences: $error");
              }
            },
          );
        },
        onSuccess: () {
          AppNavigator.pushAndRemove(
            context,
            const HomePage(),
          );
        },
        onFailure: (error) {});
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Bạn chưa có tài khoản? "),
      TextSpan(
          style: const TextStyle(
            color: Colors.blue,
          ),
          text: 'Đăng kí ngay',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SignUpPage());
            })
    ]));
  }
}
