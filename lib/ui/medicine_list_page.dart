import 'package:flutter/material.dart';

import 'medicine_detail_page.dart';
import 'medicine_new_page.dart';

class MedicineListPage extends StatelessWidget {
  const MedicineListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("お薬一覧")),
      persistentFooterButtons: [
        Center(
          child: ElevatedButton(
            child: const Text("薬を登録する"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineNewPage()));
            },
          ),
        ),
      ],
      body: MedicineList(),
    );
  }
}

class MedicineList extends StatefulWidget {
  const MedicineList({Key? key}) : super(key: key);

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isEven) return const Divider();

      return ListTile(
        leading: const Icon(Icons.medical_services),
        title: Text(
          "お薬 ${i ~/ 2 + 1}",
        ),
        onTap: () => {
          // TODO: 値を渡す
          Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineDetailPage()))
        },
        trailing: const Icon(Icons.delete_forever),
      );
    });
  }
}
