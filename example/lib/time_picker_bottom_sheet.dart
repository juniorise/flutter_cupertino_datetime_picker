import 'package:flutter/material.dart';

import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

class TimePickerBottomSheet extends StatefulWidget {
  const TimePickerBottomSheet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimePickerBottomSheetState();
}

const String minDateTime = '2010-05-12 10:47:00';
const String maxDateTime = '2021-11-25 22:45:10';
const String initDateTime = '2019-05-17 18:13:15';

class _TimePickerBottomSheetState extends State<TimePickerBottomSheet> {
  String _format = 'HH:mm';
  final TextEditingController _formatCtrl = TextEditingController();

  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
    _dateTime = DateTime.parse(initDateTime);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle hintTextStyle = Theme.of(context).textTheme.subtitle1!.apply(color: Color(0xFF999999));
    return Scaffold(
      appBar: AppBar(title: Text('TimePicker Bottom Sheet')),
      body: Container(
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

            // show custom title widget
            Row(
              children: <Widget>[
                Text('show custom title', style: hintTextStyle),
                Checkbox(value: true, onChanged: (value) {}),
              ],
            ),

            // custom title height
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Text('custom title height:', style: hintTextStyle),
                  ),
                  Text('56.0', style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            ),

            // date format input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Formatter',
                hintText: 'HH:mm:ss / H-m / H时.m分',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) => _format = value,
            ),

            // selected time
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Selected Time:', style: Theme.of(context).textTheme.subtitle1),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                        '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}',
                        style: Theme.of(context).textTheme.headline6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTimePicker,
        tooltip: 'Show TimePicker',
        child: Icon(Icons.access_time),
      ),
    );
  }

  /// Display time picker.
  void _showTimePicker() {
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.parse(minDateTime),
      maxDateTime: DateTime.parse(maxDateTime),
      initialDateTime: DateTime.parse(initDateTime),
      dateFormat: _format,
      pickerMode: DateTimePickerMode.time, // show TimePicker
      pickerTheme: DateTimePickerTheme(
        title: Container(
          decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
          width: double.infinity,
          height: 56.0,
          alignment: Alignment.center,
          child: Text(
            'custom Title',
            style: TextStyle(color: Colors.green, fontSize: 24.0),
          ),
        ),
        titleHeight: 56.0,
      ),
      onCancel: () {
        debugPrint('onCancel');
      },
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }
}
