import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';
import 'package:itr_app/view/utils/drawer.dart';
import 'package:itr_app/view_model/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class SelectPerson extends StatefulWidget {
  const SelectPerson({super.key});

  @override
  State<SelectPerson> createState() => _SelectPersonState();
}

class _SelectPersonState extends State<SelectPerson> {
  @override
  Widget build(BuildContext context) {
    // print("1");
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Person"),
        actions: [Text("jlkj")],
      ),
      drawer: DrawerUi(),

      
      body: Consumer<ThemeChanger>(builder: (context, theme, _) {
        return Container(
          height: 300,
          width: 300,
          color: homePageContainerColor,
        );
      }),

    );
  }
}
