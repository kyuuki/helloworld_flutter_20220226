import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
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
  List<String> alerms = ["10:00", "13:00", "17:00"];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // TODO: 使いやすく
      itemCount: alerms.length + 1,
      itemBuilder: (context, i) {
        // 最後の追加ボタン
        if (i == alerms.length) {
          return ListTile(
            leading: const Icon(Icons.add_circle),
            onTap: () async {
              var alerm = await openDialog(context);  // TODO: オブジェクトでやり取り
              setState(() {
                alerms.add(alerm);
              });
            },
          );
        }

        return ListTile(
          leading: const Icon(Icons.alarm),
          title: Text(
            alerms[i],
          ),
          trailing: const Icon(Icons.remove_circle),
        );
      },
      separatorBuilder: (context, i) {
        return const Divider();
      },
    );
  }
}

// https://www.youtube.com/watch?v=D6icsXS8NeA
Future openDialog(BuildContext context) {
  var _hourController = TextEditingController();
  var _minuteController = TextEditingController();
  bool flag = false;

  return showDialog<String>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
          title: const Text("アラーム追加"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(labelText: "時"),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r"^([01]?[0-9]|2[0-3])$"))
                        ],
                        controller: _hourController,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        ":",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(labelText: "分"),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r"^[0-5]?[0-9]$"))
                        ],
                        controller: _minuteController,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 18.0,
                ),
                CheckboxListTile(
                  title: const Text('月'),
                  value: flag,
                  onChanged: (bool? e) {
                    setState(() {
                      flag = e!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('火'),
                  value: flag,
                  onChanged: (e) => {},
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('水'),
                  value: flag,
                  onChanged: (e) => {},
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('木'),
                  value: flag,
                  onChanged: (e) => {},
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('金'),
                  value: flag,
                  onChanged: (e) => {},
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('土'),
                  value: flag,
                  onChanged: (e) => {},
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('日'),
                  value: flag,
                  onChanged: (e) => {},
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("キャンセル"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("追加"),
              onPressed: () {
                Navigator.pop(context, "${_hourController.text}:${_minuteController.text}");
              },
            ),
          ]),
    ),
  );
}
