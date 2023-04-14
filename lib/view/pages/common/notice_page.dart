import 'package:flutter/material.dart';
import 'package:village/dummy/notice.dart';
import 'package:village/view/widgets/common/notice_card.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("공지사항", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, index) => NoticeCard(notice: notices[index]),
      ),
    );
  }
}