import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';
import 'package:itr_app/view/utils/drawer.dart';
import 'package:itr_app/view/utils/floating_action_button.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFAB(),
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
                        title: const Text("Welcome, John",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(height: 20,),
                      Image.asset("assets/images/mainimage.png",height: MediaQuery.of(context).size.height *0.3,width: MediaQuery.of(context).size.width *0.8,),
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
                const SizedBox(
                  height: 200,
                ),
                Container(
                    width: MediaQuery.of(context).size.width *
                        0.9,
                    height: 265,
                    decoration: BoxDecoration(
                      color: homePageContainerColor,
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
                          image: "assets/images/startFillingImage.jpg",
                          icon: Icon(Icons.navigate_next),
                          price: "₹599",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HomePageListTile(
                            title: "How It Works",
                            image: "assets/images/questionMark.jpg",
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
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                // spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0,0), // changes position of shadow
              ),
            ]),
        child: Center(
          child: ListTile(
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







// Consumer<ThemeChanger>(builder: (context, theme, _) {
// return Switch(
// value: theme.themeMode == ThemeMode.dark,
// onChanged: (newValue) {
// theme.setTheme(newValue);
// },
// );
// }),
