import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/common/helper/message/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/presentation/setting/bloc/setting_cubit.dart';
import 'package:movie_app/presentation/setting/pages/setting_page.dart';
import 'package:permission_handler/permission_handler.dart';

class Profile extends StatefulWidget {
  final String email, password, image, userId;

  const Profile({
    super.key,
    required this.email,
    required this.password,
    required this.image,
    required this.userId,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  File? _selectedImage;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.email);
    passwordController = TextEditingController(text: widget.password);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final cameraStatus = await Permission.camera.request();
    final storageStatus = await Permission.storage.request();

    if (cameraStatus.isGranted && storageStatus.isGranted) {
      // Your image picking logic here
    } else {
      print("Permissions not granted");
    }
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Chụp ảnh"),
                onTap: () async {
                  final pickedFile = await _imagePicker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedFile != null) {
                    setState(() {
                      _selectedImage = File(pickedFile.path);
                    });
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Chọn ảnh từ thư viện"),
                onTap: () async {
                  final pickedFile = await _imagePicker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile != null) {
                    setState(() {
                      _selectedImage = File(pickedFile.path);
                    });
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
        title: Text("Chỉnh sửa thông tin"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: _selectedImage != null
                        ? FileImage(File(_selectedImage!
                            .path)) // Make sure _selectedImage is a File object
                        : (widget.image.isEmpty
                            ? const NetworkImage(
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png")
                            : FileImage(File(widget
                                .image))), // This assumes widget.image is a valid path
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                enabled: false,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    final image = _selectedImage?.path ?? widget.image;

                    context.read<SettingCubit>().editUserData(
                          id: widget.userId, // Replace with the actual user ID
                          email: email,
                          password: password,
                          image: image,
                        );

                    print("Email: $email");
                    print("Password: $password");
                    print("Selected Image: $image");

                    DisplayMessage.successMessage("Lưu thành công", context);
                    AppNavigator.push(context, SettingPage());
                  },
                  child: const Text("Lưu thay đổi"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
