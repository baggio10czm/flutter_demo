import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DateFormatPage extends StatefulWidget {
  @override
  _DateFormatPageState createState() => _DateFormatPageState();
}

class _DateFormatPageState extends State<DateFormatPage> {

  DateTime _nowDate = DateTime.now();
  var _nowTime = TimeOfDay(hour: 12, minute: 30);
   _showDatePicker() async {
    // showDatePicker(
    //     context: content,
    //     initialDate: date,
    //     firstDate: DateTime(1985),
    //     lastDate: DateTime(2025)
    // ).then(onValue){
    //   print(onValue);
    // };
    var result = await showDatePicker(
        context: context,
        initialDate: _nowDate,
        firstDate: DateTime(1985),
        lastDate: DateTime(2025));

    setState(() {
      // 加个判断防止点取消赋空值，会报错
      if(result != null){
        this._nowDate = result;
      }
    });
  }

  _showTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: _nowTime);

    setState(() {
      if(result != null){
        // 加个判断防止点取消赋空值，会报错
        this._nowTime = result;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(_nowDate);
    print(_nowDate.millisecondsSinceEpoch);
    print(DateTime.fromMillisecondsSinceEpoch(1567589232100));
    print(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日期'),
      ),
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
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: _showTimePicker,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('选择时间：' + this._nowTime.format(context)),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
