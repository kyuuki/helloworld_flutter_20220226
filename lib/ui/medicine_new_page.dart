import 'package:flutter/material.dart';

class MedicineNewPage extends StatelessWidget {
  const MedicineNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("お薬登録")),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                enabled: true,
                maxLength: 80,
                obscureText: false,
                maxLines:1,
                decoration: InputDecoration(
                  icon: Icon(Icons.medical_services),
                  hintText: '薬の名前を入力してください',
                  labelText: 'お薬名',
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).selectedRowColor),
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text("キャンセルする"),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  ElevatedButton(
                    child: Text("保存する"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}