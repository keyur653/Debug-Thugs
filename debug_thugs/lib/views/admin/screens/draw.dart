import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:debug_thugs/views/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/theme/theme_notifier.dart';
import '../../utils/theme/theme_shared_pref.dart';
import 'civil.dart';
// import 'package:play_on/screens/login_page.dart';
// import 'package:play_on/screens/profile_screen.dart';
// import 'package:play_on/pages/registration_page.dart';
// import 'package:play_on/welcome_screen.dart';

class Draw extends StatefulWidget {
  static const String _title = 'Student Database ';

  @override
  State<Draw> createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  String id = "/drawer";
  var _darkTheme = true;
  final Future<SharedPreferences> _preference = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return MaterialApp(
      title: Draw._title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student Database'),
          backgroundColor: Color.fromARGB(255, 4, 16, 91),
        ),
        body: CivilList(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.brush_outlined),
                title: const Text('Theme'),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                trailing: DayNightSwitcher(
                  isDarkModeEnabled: _darkTheme,
                  onStateChanged: (val) {
                    setState(() {
                      _darkTheme = val;
                    });
                    onThemeChanged(val, themeNotifier);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log out'),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                onTap: () async {
                  final _auth = FirebaseAuth.instance;
                  await _auth.signOut();
                  try {
                    final preference = await _preference;
                    await preference.remove('username');
                    await preference.remove('foundedclass');
                  } catch (e) {
                    print(e);
                  }
                  await SystemNavigator.pop();
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.profile_circled),
                title: const Text('Profile'),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
