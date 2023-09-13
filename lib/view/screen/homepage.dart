import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/select_person.dart';
import 'package:itr_app/view/utils/drawer.dart';
import 'package:itr_app/view/utils/floating_action_button.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;

    return Scaffold(
      floatingActionButton:const CustomFAB(),
      drawer: const DrawerUi(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: blueGradient
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      AppBar(
                        title:Consumer<ApiProvider>(
                          builder: (context,apiProvider, _){
                            final userProfile = apiProvider.userProfile;
                           return Text('Welcome, ${userProfile?.name ?? "Guest"}!',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18));
                          },
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 20,),
                      Image.asset(homePageImage(themeMode),height: MediaQuery.of(context).size.height *0.3,width: MediaQuery.of(context).size.width *0.8,),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SizedBox(
                  height: MediaQuery.of(context).size.height *0.15
                ),
                Container(
                    width: MediaQuery.of(context).size.width *
                        0.9,
                    height: 265,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 22.0, top: 15, bottom: 15),
                          child: Text(
                            "File Your Income Tax Return",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                        HomePageListTile(
                          title: "Start Income Tax\nFilling",
                          image: "assets/images/startFillingImage.png",
                          icon: Icon(Icons.navigate_next),
                          price: "₹599",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HomePageListTile(
                            title: "How It Works",
                            image: "assets/images/questionMark.png",
                            icon: Icon(Icons.navigate_next)),
                      ],
                    )),

              ],
            ),
          ),

        ],
      ),
    );
  }
}




class HomePageListTile extends StatelessWidget {
  const HomePageListTile({
    super.key,
    required this.title,
    required this.image,
    required this.icon,
    this.price = "0",
  });

  final String title;
  final String image;
  final Icon icon;
  final String price;

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            color: homePageContainerColor(themeMode),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.75),
                blurRadius: 1,
                offset: const Offset(0,0), // changes position of shadow
              ),
            ]),
        child: Center(
          child: ListTile(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectPerson()));
            },
            title: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            leading: Image.asset(image),
            trailing: price != "0"
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("₹599",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 16),),
                      icon,
                    ],
                  )
                : icon,
          ),
        ),
      ),
    );
  }
}




