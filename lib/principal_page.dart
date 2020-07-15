import 'package:flutter/material.dart';
import 'package:gates/pages/info.dart';
import 'package:gates/styles/gates_theme.dart';
import 'package:gates/widgets/instrument_list.dart';
import 'package:gates/widgets/principal_info.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: principalBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: principalBackground,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoPage()));
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/img/gates_logo.png',
                    width: 300,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'For X-Plane',
                    style: titleText,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(principalBorderSize)),
                  child: Container(
                    width: double.infinity,
                    color: secundaryBackground,
                    child: PrincipalInfo(),
                  ))),
          Expanded(
              flex: 4,
              child: Container(
                color: secundaryBackground,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(principalBorderSize)),
                  child: Container(
                    color: principalBackground,
                    child: InstrumentList(),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
