import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var dashboardImage = 'https://home.bt.com/images/sleep-better-be-happier-upgrade-your-bedroom-with-these-smart-home-gadgets-136430842205602601-181107135444.jpg';
var lightGrey = Color(0xFF414350);
var lightBlue = Color(0xFF5157c2);

void main() async => runApp(SmartHomePage());

class SmartHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SmartHome',
      debugShowCheckedModeBanner: false,// To remove debug flag from top right corner
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Kitchen"),
          ),
          backgroundColor: Color(0xFF32323e),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 24.0,
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  child: Image.network(dashboardImage, fit: BoxFit.cover),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 1,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    children: <Widget>[
                      ListItemGenerator('LED', FontAwesomeIcons.lightbulb, Colors.blue,
                          'Turn off', 0.0, [lightBlue, Colors.purple]),
                      ListItemGenerator('AC', Icons.ac_unit, lightGrey, 'Turn on', 0.0,
                          [lightBlue, Colors.purple]),
                      ListItemGenerator('Current power', FontAwesomeIcons.powerOff,
                          lightGrey, '1.2 kW', 0.0, [lightBlue, Colors.purple]),
                      ListItemGenerator(
                          'Refrigerator',
                          FontAwesomeIcons.elementor,
                          lightGrey,
                          'Turn on',
                          160.0,
                          [lightBlue, Colors.purple]),
                      ListItemGenerator(
                          'Water Purifier',
                          FontAwesomeIcons.water,
                          lightGrey,
                          'Turn on',
                          42.0,
                          [lightBlue, Colors.purple]),
                      ListItemGenerator(
                          'Kitchen Lamp',
                          FontAwesomeIcons.lightbulb,
                          Colors.blue,
                          '72%',
                          160.0,
                          [Colors.white, Colors.white]),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class ListItemGenerator extends StatelessWidget {
  final name;
  final icon;
  final color;
  final type;
  final progress;
  final colors;

  ListItemGenerator(
      this.name, this.icon, this.color, this.type, this.progress, this.colors);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.0,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        icon,
                        color: color,
                      ),
                      SizedBox(
                        width: 18.0,
                      ),
                      Text(
                        type,
                        style: TextStyle(
                          color: color,
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: color, fontSize: 16.0, letterSpacing: 1),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ));
  }
}
