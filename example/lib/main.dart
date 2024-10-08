import 'package:flutter/material.dart';
import 'package:jhijri/jHijri.dart';
import 'package:jhijri_picker/jhijri_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JHijriPicker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: MediaQuery.withClampedTextScaling(
    minScaleFactor:
         1.25,
    child: HomePage()
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JHijriDatePicker"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton.extended(
              heroTag: "4",
              onPressed: () async {
                final dateTime = await showGlobalDatePicker(
                    context: context, pickerType: PickerType.JNormal);
                if (dateTime != null) {
                  debugPrint(dateTime.toString());
                }
              },
              tooltip: 'Normal Date',
              icon: const Icon(Icons.date_range_outlined),
              label: Text("Normal"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton.extended(
              heroTag: "3",
              onPressed: () async {
                final dateTime = await showGlobalDatePicker(
                  context: context,
                  startDate: JDateModel(
                      jhijri: JHijri(
                    fYear: 1442,
                    fMonth: 12,
                    fDay: 10,
                  )),
                  selectedDate: JDateModel(jhijri: JHijri.now()),
                  endDate: JDateModel(
                      jhijri: JHijri(
                    fDay: 25,
                    fMonth: 1,
                    fYear: 1460,
                  )),
                  pickerMode: DatePickerMode.day,
                  pickerTheme: Theme.of(context),
                  textDirection: TextDirection.rtl,
                  //locale: const Locale("ar", "SA"),
                  okButtonText: "حفظ",
                  cancelButtonText: "عودة",
                  onOk: (value) {
                    debugPrint(value.toString());
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                  primaryColor: Colors.blue,
                  calendarTextColor: Colors.white,
                  backgroundColor: Colors.black,
                  borderRadius: const Radius.circular(10),
                  buttonTextColor: Colors.white,
                  headerTitle: const Center(
                    child: Text(
                      "التقويم الهجري",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
                if (dateTime != null) {
                  debugPrint(dateTime.toString());
                }
              },
              tooltip: 'Hijri Date',
              icon: const Icon(Icons.date_range_outlined),
              label: Text("Hijri"),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(
            child: JGlobalDatePicker(
              specialDates: [
                "6/6",
                "29/10"
              ],
              showGregorianDate: true,
              showHijriDate: true,
              showHijriMonth: true,
              showGregorianMonth: false,
              // gregorianDayTextStyle: TextStyle(color: Colors.black),
              // hijriDayTextStyle: TextStyle(color: Colors.cyan),

              widgetType: WidgetType.JContainer,
              pickerType: PickerType.JHijri,
              buttons: const SizedBox(),
              primaryColor: Colors.red,
              calendarTextColor: Colors.black,
              backgroundColor: Colors.transparent,
              borderRadius: const Radius.circular(10),
              startDate: JDateModel(dateTime: DateTime.parse("1984-12-24")),
              selectedDate: JDateModel(dateTime: DateTime.now()),
              endDate: JDateModel(dateTime: DateTime.parse("2030-09-20")),

              pickerMode: DatePickerMode.day,
              pickerTheme: Theme.of(context),
              textDirection: TextDirection.rtl,
              onChange: (val) {

              },
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
