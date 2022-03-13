import 'package:flutter/material.dart';

// 薬詳細ページ
class MedicineDetailPage extends StatelessWidget {
  const MedicineDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("お薬アラーム編集")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.medical_services),
                ),
                Text(
                  "お薬 A",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 60.0),
              child: AlertList(),
            ),
          ),
        ],
      ),
    );
  }
}

class AlertList extends StatefulWidget {
  const AlertList({Key? key}) : super(key: key);

  @override
  _AlertListState createState() => _AlertListState();
}

class _AlertListState extends State<AlertList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // TODO: 使いやすく
        itemCount: 11,
        itemBuilder: (context, i) {
          if (i == 10) {
            return ListTile(
              leading: const Icon(Icons.add_circle),
            );
          }
          if (i.isOdd) return const Divider();

          return ListTile(

            leading: const Icon(Icons.alarm),
            title: Text(
              "アラーム ${i ~/ 2 + 1}",
            ),
            onTap: () => {
              // TODO: 値を渡す
              Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineDetailPage()))
            },
            trailing: const Icon(Icons.remove_circle),
          );
        });
  }
}
