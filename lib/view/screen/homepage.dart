import 'package:flutter/material.dart';
import 'package:itr_app/view_model/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Changer")
      ),
      body: Column(
        children: [
          Consumer<ThemeChanger>(
              builder: (context, theme,_) {
                return Switch(value: theme.themeMode == ThemeMode.dark,onChanged: (newValue){theme.setTheme(newValue);},);
              }),
          Text("This is it"),

        ],
      ),
    );
  }
}
