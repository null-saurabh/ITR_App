import 'package:flutter/material.dart';
import 'package:itr_app/view/screen/homepage.dart';
import 'package:itr_app/view/screen/login_page.dart';
import 'package:itr_app/view_model/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class DrawerUi extends StatelessWidget {
  const DrawerUi({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 160,
            child: DrawerHeader(
              decoration: BoxDecoration(
                // color: Colors.white,
                color: Theme.of(context).colorScheme.primary,
                border: Border(
                  bottom: BorderSide(width: 2.5, color: const Color(0xFF1B7FDB).withOpacity(0.2)),
                ),
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 25.0,
                    child: Image.asset("assets/images/usercircle.png",height: 40,width: 40,),
                  ),
                  const SizedBox(width: 10), // Provide some spacing
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('John Doe', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                      Text('+91 9876543210', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          DrawerListTile(title:"Persons", icon: Icons.groups_outlined,onTap:(){ Navigator.push(
              context, MaterialPageRoute(builder: (context) => const HomePage())); }),
          const DrawerListTile(title:"Payment History", icon: Icons.history),
          const SizedBox(height: 20),
          const DrawerListTile(title:"Dark Mode", icon: Icons.dark_mode_outlined,widgetName: "Switch",),
          const DrawerListTile(title:"Terms & Conditions", icon: Icons.privacy_tip_outlined),
          const DrawerListTile(title:"FAQs", icon: Icons.question_answer_outlined),
          const DrawerListTile(title:"Rate Us", icon: Icons.star_border_outlined),
          const SizedBox(height: 20),
          const DrawerListTile(title:"Logout", icon: Icons.logout,color: Colors.red,),

        ],
      ),
    );
  }
}





class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final String widgetName;
  final VoidCallback? onTap;

  const DrawerListTile({
    super.key,
    required this.icon,
    required this.title,
    this.color = Colors.blue,
    this.widgetName = "Arrow",
    this.onTap
  });



  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,color: color,),
      title: Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
      trailing: widgetName == "Arrow"
      ? const Icon(Icons.arrow_forward_ios,)
      : Consumer<ThemeChanger>(builder: (context, theme, _) {
        return Switch(
          value: theme.themeMode == ThemeMode.dark,
          onChanged: (newValue) {
            theme.setTheme(newValue);
          },
        );
      }),
      onTap: onTap,
    );
  }
}


