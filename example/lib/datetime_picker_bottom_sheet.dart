import 'package:flutter/material.dart';

import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

class DateTimePickerBottomSheet extends StatefulWidget {
  const DateTimePickerBottomSheet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateTimePickerBottomSheetState();
}

const String minDateTime = '2010-05-15 09:23:10';
const String maxDateTime = '2019-06-03 21:11:00';
const String initDateTime = '2019-05-16 09:00:00';

class _DateTimePickerBottomSheetState extends State<DateTimePickerBottomSheet> {
  bool? _showTitle = true;

  String _format = 'yyyy-M月-d日  H时:m分:s';
  final TextEditingController _formatCtrl = TextEditingController();

  DateTimePickerLocale? _locale = DateTimePickerLocale.zhCn;
  final List<DateTimePickerLocale> _locales = DateTimePickerLocale.values;

  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
    _dateTime = DateTime.parse(initDateTime);
  }

  /// Display time picker.
  void _showDateTimePicker() {
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.parse(minDateTime),
      maxDateTime: DateTime.parse(maxDateTime),
      initialDateTime: _dateTime,
      dateFormat: _format,
      locale: _locale!,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle!,
      ),
      pickerMode: DateTimePickerMode.datetime, // show TimePicker
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

  @override
  Widget build(BuildContext context) {
    List<Widget> radios = [];
    for (DateTimePickerLocale locale in _locales) {
      radios.add(Container(
        margin: EdgeInsets.only(right: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Radio(
                value: locale,
                groupValue: _locale,
                onChanged: (dynamic value) {
                  setState(() {
                    _locale = value;
                  });
                }),
            Text(locale.toString().substring(locale.toString().indexOf('.') + 1)),
          ],
        ),
      ));
    }

    TextStyle hintTextStyle = Theme.of(context).textTheme.subtitle1!.apply(color: Color(0xFF999999));
    return Scaffold(
      appBar: AppBar(title: Text('DateTimePicker Bottom Sheet')),
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
                  Text(minDateTime, style: Theme.of(context).textTheme.subtitle1),
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
                  Text(maxDateTime, style: Theme.of(context).textTheme.subtitle1),
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
                  Text(initDateTime, style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            ),

            // show title widget checkbox
            Container(
              height: 30.0,
              margin: EdgeInsets.only(top: 16.0),
              child: Row(
                children: <Widget>[
                  Text('show title actions', style: TextStyle(fontSize: 16.0)),
                  Checkbox(
                      value: _showTitle,
                      onChanged: (value) {
                        setState(() {
                          _showTitle = value;
                        });
                      })
                ],
              ),
            ),

            // date format input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Date Format: ',
                hintText: 'yyyyMMdd HH:mm:ss / H:m / H时:m分',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) => _format = value,
            ),

            // locale check radio group
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Text('Locale: '), Wrap(direction: Axis.horizontal, children: radios)],
              ),
            ),

            // selected date time
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Selected DateTime:', style: Theme.of(context).textTheme.subtitle1),
                  Container(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      '${_dateTime.year}-${_dateTime.month.toString().padLeft(2, '0')}-${_dateTime.day.toString().padLeft(2, '0')} ${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // display DateTimePicker floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: _showDateTimePicker,
        tooltip: 'Show DateTimePicker',
        child: Icon(Icons.access_time),
      ),
    );
  }
}
