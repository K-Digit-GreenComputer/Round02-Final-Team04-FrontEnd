import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/common/notice_page/notice_page.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_login_button.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_list.dart';
import 'package:village/view/pages/user/reservation_page/user_reservation_page.dart';
import 'package:village/view/pages/user/scrap_page/user_scrap_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool valNotify = true;

  onChangeFunction(bool newValue) {
    setState(() {
      valNotify = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "마이페이지",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              print("호스트화면");
            },
            child: const Text(
              "호스트페이지",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const MyPageLoginButton(),
            const Divider(height: 15, thickness: 2),
            const SizedBox(height: 20),
            MyPageList(
                title: "예약내역",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserReservationPage(),
                      ));
                }),
            const SizedBox(height: 30),
            MyPageList(
                title: "공지사항",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NoticePage(),
                      ));
                }),
            const SizedBox(height: 30),
            MyPageList(title: "자주 묻는 질문", press: () {}),
            const SizedBox(height: 30),
            MyPageList(
                title: "스크랩",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserScarpPage(),
                      ));
                }),
            const SizedBox(height: 30),
            MyPageList(title: "호스트신청", press: () {}),
            const SizedBox(height: 30),
            NotificationOption("알림 설정", valNotify, onChangeFunction),
            const SizedBox(height: 30),
            MyPageList(title: "현재 버전", press: () {}),
            const SizedBox(height: 30),
            MyPageList(title: "로그아웃", press: () {}),
          ],
        ),
      ),
    );
  }

  Widget NotificationOption(String title, bool value, Function onChangeMethod) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: mblack_text,
        ),
        Transform.scale(
          scale: 0.7,
          child: SizedBox(
            height: 20,
            width: 40,
            child: CupertinoSwitch(
              activeColor: kPrimaryColor,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}