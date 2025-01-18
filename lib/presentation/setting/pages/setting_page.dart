import 'dart:developer';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:movie_app/common/helper/message/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/core/configs/theme/app_colors.dart';
import 'package:movie_app/presentation/auth/pages/sign_in.dart';
import 'package:movie_app/presentation/setting/bloc/setting_cubit.dart';
import 'package:movie_app/presentation/setting/bloc/setting_state.dart';
import 'package:movie_app/presentation/setting/widgets/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final SettingCubit _settingCubit = SettingCubit();
  String? userId;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final id = sharedPreferences.getString('id');
    if (id != null) {
      setState(() {
        userId = id;
      });
      _settingCubit.getUserData(userId!);
    } else {
      print("No user ID found in SharedPreferences");
    }
  }

  Future<void> _showFeedbackModal(BuildContext context) async {
    final TextEditingController subjectController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Gửi phản hồi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: subjectController,
                decoration: const InputDecoration(
                  labelText: "Tiêu đề",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: messageController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "Nội dung phản hồi",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final Email email = Email(
                      body: messageController.text,
                      subject: subjectController.text,
                      recipients: ['nekotestmail1@gmail.com'],
                      isHTML: false,
                    );

                    try {
                      await FlutterEmailSender.send(email);
                      Navigator.pop(context); // Close modal
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Phản hồi đã được gửi thành công!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } catch (e) {
                      log(e.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Lỗi khi gửi phản hồi: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text("Gửi phản hồi"),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showTotalModal(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            "Thông tin ứng dụng",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Tên ứng dụng: Movie App",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "Phiên bản: 1.0.0",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "Nhà phát triển: Neko Dev ",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: "Chân thành cảm ơn ",
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: "kkphim.vip",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse("https://kkphim.vip"));
                        },
                    ),
                    const TextSpan(
                      text:
                          " đã cung cấp các API hữu ích giúp ứng dụng được hoàn thành. Để biết thêm chi tiết vui lòng truy cập: ",
                      style: const TextStyle(fontSize: 16),
                    ),
                    TextSpan(
                      text: "https://kkphim.vip",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse("https://kkphim.vip"));
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Đóng modal
                },
                child: const Text("Đóng"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _settingCubit,
      child: BlocListener<SettingCubit, SettingState>(
        listener: (context, state) {
          if (state is SettingLoaded) {
            // Reload data after a successful update
            _settingCubit.getUserData(userId!);
          }
        },
        child: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            if (state is SettingLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SettingError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is SettingLoaded) {
              print(state.setting.data.email);
              print(state.setting.data.image);

              return Scaffold(
                appBar: const BasicAppbar(
                  hideBack: false,
                  title: Text("Cài đặt"),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      _textTitle("Tài khoản"),
                      _accountButton(context, state),
                      const SizedBox(height: 30),
                      _textTitle("Hỗ trợ"),
                      GestureDetector(
                          onTap: () => _showFeedbackModal(context),
                          child: _supportButton("Trung tâm hỗ trợ", context)),
                      const SizedBox(height: 10),
                      GestureDetector(
                          onTap: () => _showTotalModal(context),
                          child: _supportButton("Về ứng dụng", context)),
                      const SizedBox(height: 40),
                      _logoutButton(context),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _accountButton(BuildContext context, SettingLoaded state) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.secondBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: state.setting.data.image!.isEmpty
                      ? const NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png")
                      : FileImage(File(state.setting.data.image!))
                          as ImageProvider,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                state.setting.data.email,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              AppNavigator.push(
                context,
                Profile(
                  email: state.setting.data.email,
                  image: state.setting.data.image!,
                  password: state.setting.data.password,
                  userId: userId!,
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _textTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget _supportButton(String text, BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.secondBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Bạn muốn đăng xuất 😢'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Từ chối'),
                  ),
                  TextButton(
                    onPressed: () async {
                      Future.delayed(Duration(seconds: 2));
                      DisplayMessage.successMessage(
                          "Đăng xuất thành công", context);
                      AppNavigator.pushAndRemove(context, SignInPage());
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
          print('Selected: Logout');
        },
        child: Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: const Center(
            child: Text(
              "Đăng xuất",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
