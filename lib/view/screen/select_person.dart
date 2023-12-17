import 'package:flutter/material.dart';
import 'package:itr_app/model/api_model.dart';
import 'package:itr_app/view/utils/bottom_navigation_button.dart';
import 'package:itr_app/view/utils/bottomsheet_add_person.dart';
import 'package:itr_app/view/utils/card_select_person.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

class SelectPerson extends StatelessWidget {
  const SelectPerson({super.key});

  @override
  Widget build(BuildContext context) {
    // final scaffoldKey = GlobalKey<ScaffoldState>();
    // final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Select Tax Payer"),
      ),
      bottomNavigationBar: BottomNavigationButton(
        text: "Add New Person",
        icon: Icons.add_circle_outline,
        elevation: false,
        onTap: () => showAddPersonBottomSheet(context),
      ),
      body: Consumer<ApiProvider>(
        builder: (ctx, apiProvider, _) {
          return FutureBuilder<List<Person>>(
            future: apiProvider.getPersons(),
            builder: (contexts, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.grey,));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Person Data Available.'));
              } else {
                final persons = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemCount: persons.length,
                    itemBuilder: (contexts, index) {
                      return SelectPersonCard(
                        name: persons[index].name,
                        id: persons[index].id,
                        phoneNumber: persons[index].phoneNumber,
                        contextMain: context
                      );
                    },
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

