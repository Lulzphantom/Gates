import 'package:flutter/material.dart';
import 'package:gates/instruments/instruments.dart';
import 'package:gates/styles/gates_theme.dart';

class InstrumentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: instrumentList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(children: <Widget>[
            Material(
              color: principalBackground,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              instrumentList[index].intrumentWidget));
                },
                child: ListTile(
                  isThreeLine: true,
                  leading: FlutterLogo(
                    size: 50.0,
                  ),
                  title: Text(
                    instrumentList[index].title,
                    style: instrumentTitle,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        instrumentList[index].description,
                        style: instrumentDescript,
                      ),
                      Text('Required index: ${instrumentList[index].requiredIndex}', style: instrumentDescript,),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
            ),
            Divider()
          ]);
        },
      ),
    );
  }
}
