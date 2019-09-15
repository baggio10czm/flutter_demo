import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DateThird extends StatefulWidget {
  @override
  _DateThirdState createState() => _DateThirdState();
}


const String MIN_DATETIME = '2010-05-12';
const String MAX_DATETIME = '2021-11-25';
const String INIT_DATETIME = '2019-09-09';

// 时间选择范围： 03点 —— 22点
const String MIN_TIME = '2010-05-12 03:05:20';
const String MAX_TIME = '2021-11-25 22:55:10';
const String INIT_TIME = '2019-05-17 18:13:15';

class _DateThirdState extends State<DateThird> {

  String _timeFormat = 'H时:mm分';
  DateTime _nowTime;

  DateTime _nowDate;
  bool _showTitle = true;

  DateTimePickerLocale _locale = DateTimePickerLocale.zh_cn;
  List<DateTimePickerLocale> _locales = DateTimePickerLocale.values;

  String _format = 'yyyy-MMMM-dd';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nowDate = DateTime.parse(INIT_DATETIME);
    _nowTime = DateTime.parse(INIT_TIME);
  }

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
        confirm: Text('确定', style: TextStyle(color: Colors.red)),
        cancel: Text('取消', style: TextStyle(color: Colors.cyan)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: _nowDate,
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- 关闭 -----"),
      onCancel: () => print('取消'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          _nowDate = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _nowDate = dateTime;
        });
      },
    );
  }

  void _showTimePicker() {
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.parse(MIN_TIME),
      maxDateTime: DateTime.parse(MAX_TIME),
      initialDateTime: DateTime.parse(INIT_TIME),
      dateFormat: _timeFormat,
      pickerMode: DateTimePickerMode.time, // show TimePicker
      pickerTheme: DateTimePickerTheme(
      showTitle: true,
        //title: Container(
        //  decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
        //  width: double.infinity,
        //  height: 56.0,
        //  alignment: Alignment.center,
        //  child: Text(
        //    '选择时间',
        //    style: TextStyle(color: Colors.green, fontSize: 18.0),
        //  ),
        //),
        //titleHeight: 56.0,
        confirm: Text('确定', style: TextStyle(color: Colors.red)),
        cancel: Text('取消', style: TextStyle(color: Colors.cyan)),
      ),
      onCancel: () {
        debugPrint('onCancel');
      },
      onChange: (dateTime, List<int> index) {
        setState(() {
          _nowTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _nowTime = dateTime;
        });
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第三方日期插件')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: _showDatePicker,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('选择日期：' + formatDate(this._nowDate, [yyyy, '-', mm, '-', dd])),
                Icon(Icons.arrow_drop_down)
              ],
            )
          ),
          InkWell(
            onTap: _showTimePicker,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text('${_nowTime.hour.toString().padLeft(2, '0')}:${_nowTime.minute.toString().padLeft(2, '0')}',
    style: Theme.of(context).textTheme.title),
                Icon(Icons.arrow_drop_down)
              ],
            )
          )
        ],
      ),
    );
  }
}
