import 'package:flutter/material.dart';
import 'package:gates/principal_page.dart';
import 'package:provider/provider.dart';
import 'package:xplane_connect/xplane_connect.dart';

void main() => runApp(GatesApp());

class GatesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<XplaneConnectData>.value(
      value: XplaneConnect(49001).stream,
      updateShouldNotify: (_, __) => true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gates',
        home: PrincipalPage(),
      ),
    );
  }
}
