/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));

    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const iconSize = 32.0;
  var changeAppBarColor = Colors.white;
  var changeAppBarTextColor = Colors.white;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      changeStatuBar(Colors.white);
      changeAppBarColor = Colors.white;
      changeAppBarTextColor = Colors.black;
    } else if (index == 1) {
      changeStatuBar(Colors.green);
      changeAppBarColor = Colors.green;
    } else if (index == 2) {
      changeStatuBar(Colors.orange);
      changeAppBarColor = Colors.orange;
    } else if (index == 3) {
      changeStatuBar(Colors.pink);
      changeAppBarColor = Colors.pink;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample',
            style: TextStyle(color: Colors.black)),
        backgroundColor: changeAppBarColor, //Colors.white, // status bar color
        brightness: Brightness.light, // status bar brightness
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              size: iconSize,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.home,
              size: iconSize,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.business,
              size: iconSize,
              color: Colors.green,
            ),
            icon: Icon(
              Icons.business,
              size: iconSize,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.school,
              size: iconSize,
              color: Colors.orange,
            ),
            icon: Icon(
              Icons.school,
              size: iconSize,
            ),
            label: 'School',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.settings,
              size: iconSize,
              color: Colors.pink,
            ),
            icon: Icon(
              Icons.settings,
              size: iconSize,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        selectedFontSize: 15.0,
        unselectedFontSize: 15.0,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void changeStatuBar(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarBrightness: Brightness.dark,
    ));
  }
}
