import 'dart:io';

import 'package:demo_innt/innt_vendor/view/users/qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../innt_delivery/Controllers/controller.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  GetxControllers controller = Get.put(GetxControllers());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passwordObscured = true;
  bool confirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.to(() => const QrScreen());
                },
                icon: const Icon(
                  Icons.qr_code_2_outlined,
                  color: Colors.black,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 60,
              ),
              GetBuilder<GetxControllers>(
                builder: (GetxControllers controller) {
                  return GestureDetector(
                    onTap: () {
                      controller.imageFile;
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: controller.imageFile == null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: FileImage(
                                  File(controller.imageFile.toString())))
                          : CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: const NetworkImage(
                                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                  scale: 10),
                            ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: h / 60,
              ),
              TextFormField(
                controller: firstNameController,
                /* validator: (value) {
                                        if (value!.length < 10) {
                                          return "Invalid email address";
                                        } else {
                                          return null;
                                        }
                                      },*/
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "First Name",
                    labelText: "First Name",
                    labelStyle: const TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: h / 40,
              ),
              TextFormField(
                controller: lastNameController,
                /* validator: (value) {
                                        if (value!.length < 10) {
                                          return "Invalid email address";
                                        } else {
                                          return null;
                                        }
                                      },*/
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Last Name",
                    labelText: "Last Name",
                    labelStyle: const TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: h / 40,
              ),
              TextFormField(
                controller: mobileController,
                /* validator: (value) {
                                        if (value!.length < 10) {
                                          return "Invalid email address";
                                        } else {
                                          return null;
                                        }
                                      },*/
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Mobile Number",
                    labelText: "Mobile Number",
                    labelStyle: const TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: h / 40,
              ),
              TextFormField(
                controller: emailController,
                /* validator: (value) {
                                        if (value!.length < 10) {
                                          return "Invalid email address";
                                        } else {
                                          return null;
                                        }
                                      },*/
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Email",
                    labelText: "Email",
                    labelStyle: const TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: h / 40,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.length < 6) {
                    return "Wrong password";
                  } else {
                    return null;
                  }
                },
                obscureText: passwordObscured,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordObscured = !passwordObscured;
                          });
                        },
                        icon: Icon(
                          passwordObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        )),
                    hintText: "Password",
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.black)),
                controller: passwordController,
              ),
              SizedBox(
                height: h / 40,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    onPressed: () {
                      // Get.to(() => EmailLoginScreen());
                    },
                    child: const Text(
                      'Update Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Ember_Bold"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
