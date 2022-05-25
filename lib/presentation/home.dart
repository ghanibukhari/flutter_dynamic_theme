import 'package:dynamic_theme_test/core/bloc/theme_bloc.dart';
import 'package:dynamic_theme_test/data/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isThemeSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('THEME TEST')),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            child: Switch(
                value: _isThemeSwitch,
                onChanged: (val) {
                  _isThemeSwitch = val;
                  setState(() {});
                  if (_isThemeSwitch) {
                    BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeEvent(theme: AppTheme.darkTheme));
                  } else {
                    BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeEvent(theme: AppTheme.lightTheme));
                  }
                }),
          ),
          const SizedBox(height: 300),
          const Center(child: Text("Have a good day.")),
        ],
      ),
    );
  }
}
