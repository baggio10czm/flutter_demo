import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:amap_location/amap_location.dart';

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  double longitude=0;
  double latitude=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getDevice();
    this._getLocation();
  }

  _getDevice() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}');  // SM-G955N
    print('Running on ${androidInfo.host}');  // ubuntu
    print('Running on ${androidInfo.androidId}');  // d8cb8a1db9394802
  }

  _getLocation() async{
    // 启动一下
    await AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters  ));
    // 获取地理位置
    var result = await AMapLocationClient.getLocation(true);
    print('经度：${result.longitude}');
    print('纬度：${result.latitude}');

    setState(() {
      this.longitude = result.longitude;
      this.latitude = result.latitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设备信息和高德定位')),
      body: Center(
        child: Text('经度：$longitude,纬度：$latitude'),
      ),
    );
  }
}
