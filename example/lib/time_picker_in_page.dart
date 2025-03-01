import 'package:flutter/material.dart';

import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

///
/// @author dylan wu
/// @since 2019-05-10
class TimePickerInPage extends StatefulWidget {
  const TimePickerInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimePickerInPageState();
}

const String minDateTime = '2010-05-12 05:15:20';
const String maxDateTime = '2021-11-25 22:45:10';
const String initDateTime = '2019-05-17 18:13:15';
const String dateFormat = 'HH时:mm分:s';

class _TimePickerInPageState extends State<TimePickerInPage> {
  DateTime? _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.parse(initDateTime);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle hintTextStyle = Theme.of(context).textTheme.subtitle1!.apply(color: Color(0xFF999999));
    return Scaffold(
      appBar: AppBar(title: Text("TimePicker In Page")),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // min datetime hint
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 115.0,
                    child: Text('min DateTime:', style: hintTextStyle),
                  ),
                  Text(minDateTime.substring(11), style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            ),

            // max datetime hint
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 115.0,
                    child: Text('max DateTime:', style: hintTextStyle),
                  ),
                  Text(maxDateTime.substring(11), style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            ),

            // init datetime hint
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 115.0,
                    child: Text('init DateTime:', style: hintTextStyle),
                  ),
                  Text(initDateTime.substring(11), style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            ),

            // date format
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 115.0,
                    child: Text('Date Format:', style: hintTextStyle),
                  ),
                  Text(dateFormat, style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            ),

            // date format input field
            Container(
              margin: EdgeInsets.only(top: 8.0, bottom: 40.0),
              child: DateTimePickerWidget(
                minDateTime: DateTime.parse(minDateTime),
                maxDateTime: DateTime.parse(maxDateTime),
                initDateTime: DateTime.parse(initDateTime),
                dateFormat: dateFormat,
                minuteDivider: 15,
                pickerTheme: DateTimePickerTheme(showTitle: false, backgroundColor: Color(0xFFe1bee7)),
                onChange: (dateTime, selectedIndex) {
                  setState(() {
                    _dateTime = dateTime;
                  });
                },
              ),
            ),

            // selected time
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Selected Time:', style: Theme.of(context).textTheme.subtitle1),
                Container(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    _dateTime != null
                        ? '${_dateTime!.hour.toString().padLeft(2, '0')}:${_dateTime!.minute.toString().padLeft(2, '0')}:${_dateTime!.second.toString().padLeft(2, '0')}'
                        : '',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
