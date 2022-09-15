import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DataTableDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class DataTableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Table Demo",
          style: TextStyle(fontSize: 40, color: Colors.cyanAccent),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            color: Colors.tealAccent,
            child: const Text(
              "Student Data",
              style: TextStyle(
                  fontSize: 35,
                  backgroundColor: Colors.white24,
                  color: Colors.blue),
            ),
          ),
          DataTable(
            dividerThickness: 10,
            dataRowColor:
                MaterialStateColor.resolveWith((states) => Colors.teal),
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.cyan),
            headingRowHeight: 60,
            dataTextStyle: const TextStyle(fontSize: 20, color: Colors.red),
            headingTextStyle: const TextStyle(fontSize: 20, color: Colors.redAccent),
            border: TableBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            columns: const <DataColumn>[
              DataColumn(label: Text("Roll No:")),
              DataColumn(label: Text("NAME")),
              DataColumn(label: Text("AGE")),
              DataColumn(label: Text("COURSE")),
            ],
            rows: const <DataRow>[
              DataRow(cells: <DataCell>[
                DataCell(Text("1")),
                DataCell(Text("Rahul")),
                DataCell(Text("36")),
                DataCell(Text("Flutter")),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("2")),
                DataCell(Text("Arjun")),
                DataCell(Text("30")),
                DataCell(Text("java")),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("3")),
                DataCell(Text("Sunil")),
                DataCell(Text("32")),
                DataCell(Text("Android")),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text("4")),
                DataCell(Text("Santhosh")),
                DataCell(Text("34")),
                DataCell(Text("Dart")),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
