import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoginView'),
          centerTitle: true,
        ),
        body: Form(
          key: formkey,
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Correct name';
                } else {
                  return null;
                }
              },
            ),
          ]),
        ));
  }
}
