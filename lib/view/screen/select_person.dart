import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';
import 'package:itr_app/view/utils/card_select_person.dart';
import 'package:itr_app/view/utils/drawer.dart';
import 'package:itr_app/view/utils/bottomsheet_add_person.dart';
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
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Select Person"),
      ),
      drawer: const DrawerUi(),
      bottomNavigationBar: BottomButton(),
      body: Consumer<ThemeChanger>(builder: (context, theme, _) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0,left: 15,right: 15),
          child: ListView.builder(itemCount: 10,itemBuilder: (context,index){
            return SelectPersonCard();
          }),
        );
      }),

    );
  }
}






class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration:  BoxDecoration(color:Theme.of(context).colorScheme.primary,boxShadow: [BoxShadow(blurRadius: 1,color: Colors.grey)]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(onPressed: () => showAddPersonBottomSheet(context),style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),child: Ink(
            decoration: BoxDecoration(
              gradient: blueGradient,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(
                maxWidth: double.infinity,
                minHeight: 50.0,
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline,size: 28,),
                  SizedBox(width: 10,),
                  Text("Add New Person",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),

                ],
              ),
            ),
          ),),
        ));
  }
}
