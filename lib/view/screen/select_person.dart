import 'package:flutter/material.dart';
import 'package:itr_app/view/utils/bottom_navigation_button.dart';
import 'package:itr_app/view/utils/bottomsheet_add_person.dart';
import 'package:itr_app/view/utils/card_select_person.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Select Person"),
      ),
      bottomNavigationBar: BottomNavigationButton(text: "Add New Person",icon: Icons.add_circle_outline,elevation: true,onTap: () => showAddPersonBottomSheet(context)),
      body: Consumer<ThemeChanger>(builder: (context, theme, _) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return SelectPersonCard();
              }),
        );
      }),
    );
  }
}



