import 'package:flutter/material.dart';
import 'package:gd_datetime_picker/gd_datetime_picker.dart';
import 'package:gd_datetime_picker/i18n_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dateTime = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = DateTime.now();
    dateTime = '${now.year}-${now.month}-${now.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Text('时间是: $dateTime'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  使用Builder来确保context是Navigator的后代
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(2018, 3, 5, 12, 0),
              maxTime: DateTime(2019, 6, 7, 12, 0), onChanged: (date) {
            print('change $date');
          }, onConfirm: (date) {
            print('confirm $date');
            setState(() {
              dateTime = '${date.year}-${date.month}-${date.day}';
            });
          }, currentTime: DateTime.now(), locale: LocaleType.zh);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
