import 'package:flutter/material.dart';
import 'package:gates/styles/gates_theme.dart';
import 'package:provider/provider.dart';
import 'package:xplane_connect/xplane_connect.dart';

class PFD extends StatefulWidget {
  @override
  _PFDState createState() => _PFDState();
}

class _PFDState extends State<PFD> {
  final pdfBackgroundColor = Colors.black;

  // Speeds [03]
  double _windSpeed = 0;
  double _trueSpeed = 0;
  double _groundSpeedKt = 0;
  double _groundSpeedMph = 0;

  // Direction [17]
  double _totalPitch = 0;
  double _totalRoll = 0;
  double _heading = 0;  

  // Position [20]
  double _groundAltitude = 0;
  double _altitude = 0;

  // Auto pilot values [118]
  double _selectedSpeed = 0;
  double _selectedHeading = 0;
  double _selectedAltitude = 0;

  @override
  void didChangeDependencies() {
    
    final xPlaneData = Provider.of<XplaneConnectData>(context);
    // Speeds
    if (xPlaneData.outputData[3] != null) {
      setState(() {
        _windSpeed = xPlaneData.outputData[3][0];
        _trueSpeed = xPlaneData.outputData[3][2];
        _groundSpeedKt = xPlaneData.outputData[3][3];
      });
    }

    // Direction
    if (xPlaneData.outputData[17] != null) {
      setState(() {
        _totalPitch = xPlaneData.outputData[17][0];
        _totalRoll = xPlaneData.outputData[17][1];
        _heading = xPlaneData.outputData[17][3];
      });
    }
    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pdfBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: pdfBackgroundColor,
        title: Text('PFD'),
      ),
      body: Center(
        child: Stack(children: <Widget>[
          Text('Heading: $_heading °', style: titleText,),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              child: Container(
                width: 250,
                height: 300,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-(_totalRoll) / 360),
                  child: OverflowBox(
                    alignment: Alignment(0, -_totalPitch / 100),
                    maxWidth: 500,
                    maxHeight: 2000,
                    child: Image.asset('assets/img/horizon.bmp',
                        excludeFromSemantics: true,
                        fit: BoxFit.cover,
                        width: 500),
                  ),
                ),
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Image.asset('assets/img/wings.png'),
          )),
        ]),
      ),
    );
  }
}
