import 'package:flutter/material.dart';
import 'package:gates/models/infoItem_model.dart';
import 'package:gates/pages/about.dart';
import 'package:gates/pages/info/how_to_use.dart';
import 'package:gates/styles/gates_theme.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secundaryBackground,
        title: Text('Information'),
        
      ),
      backgroundColor: principalBackground,
      body: ListView.builder(
        itemCount: infoItemList.length,
        itemBuilder: (BuildContext context, int index) {
          return infoWidget(infoItemList[index], context);
        },
      ),
    );
  }

  Widget infoWidget(InfoItem item, BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => item.pageWidget));
        },
        child: ListTile(
          leading: Icon(
            item.icon,
            color: Colors.blue[300],
          ),
          title: Text(item.displayText, style: statsText,),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
      Divider()
    ]);
  }
}

List<InfoItem> infoItemList = [
  InfoItem('How to use?', HowToUse(), Icons.help),
  InfoItem('About Gates for X-Plane', AboutPage(), Icons.airplanemode_active),
];
