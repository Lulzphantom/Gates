import 'package:flutter/material.dart';
import 'package:gates/styles/gates_theme.dart';
import 'package:provider/provider.dart';
import 'package:xplane_connect/xplane_connect.dart';
import 'package:get_ip/get_ip.dart';

class PrincipalInfo extends StatefulWidget {  
  @override
  _PrincipalInfoState createState() => _PrincipalInfoState();
}

class _PrincipalInfoState extends State<PrincipalInfo> {

  String _deviceIp = '0.0.0.0';

  @override
  void initState() {
    super.initState();
    GetIp.ipAddress.then((value) => setState(() => _deviceIp = value))
      .catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {

    final xPlaneData = Provider.of<XplaneConnectData>(context); 

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: xPlaneData != null ?  <Widget>[
        Text('IP: $_deviceIp Port: ${xPlaneData.port}', style: statsText),
        Text(xPlaneData.connectionIsRunning ? '¡Connected with XPlane!' : 'Waiting for XPlane ...', style: statsText,),
      ] : <Widget>[Text('Starting UDP service...')],
    );
  }
}