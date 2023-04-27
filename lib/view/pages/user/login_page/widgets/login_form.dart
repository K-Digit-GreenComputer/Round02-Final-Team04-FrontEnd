import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';

class LoginForm extends StatelessWidget {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordToggle = true;

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formfield,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 17),
                labelText: "이메일",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                hintText: "abcd@email.com"),
            validator: (value) {
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!);
              if (value.isEmpty) {
                return "이메일을 입력해주세요.";
              } else if (!emailValid) {
                return "이메일 형식에 맞게 입력해주세요.";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: passwordController,
              obscureText: passwordToggle,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                labelText: "비밀번호",
                border: const OutlineInputBorder(),
                hintText: "8자 이상의 비밀번호",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    passwordToggle = !passwordToggle;
                  },
                  child: Icon(
                      passwordToggle ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "비밀번호를 입력해주세요.";
                } else if (passwordController.text.length < 8) {
                  return "비밀번호는 8자 이상입니다.";
                }
                return null;
              }),
          const SizedBox(height: 45),
          InkWell(
            onTap: () {
              if (_formfield.currentState!.validate()) {
                print("로그인 성공");
                emailController.clear();
                passwordController.clear();
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
              child: const Center(
                child: Text(
                  "로그인",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
