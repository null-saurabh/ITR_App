import 'package:flutter/material.dart';
import 'package:itr_app/view/screen/login_page.dart';
import 'package:itr_app/view/screen/payment_history.dart';
import 'package:itr_app/view/screen/select_person.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:itr_app/view_model/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class DrawerUi extends StatelessWidget {
  const DrawerUi({super.key});

  void _handleLogout(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    apiProvider.logout();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false,
    );
  }

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
                  const SizedBox(width: 10),
                  Consumer<ApiProvider>(
                      builder: (context, apiProvider, _){
                        final userProfile = apiProvider.userProfile;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Welcome, ${userProfile?.name ?? "Guest"}!', style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                            Text(userProfile?.phoneNumber ?? "", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                          ],
                        );
                      }
                  )
                ],
              ),
            ),
          ),
          DrawerListTile(title:"Persons", icon: Icons.groups_outlined,onTap:(){ Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SelectPerson())); }),
           DrawerListTile(title:"Payment History", icon: Icons.history,onTap:(){ Navigator.push(
               context, MaterialPageRoute(builder: (context) => const PaymentHistoryScreen())); }),
          const SizedBox(height: 20),
          const DrawerListTile(title:"Dark Mode", icon: Icons.dark_mode_outlined,widgetName: "Switch",),
          const DrawerListTile(title:"Terms & Conditions", icon: Icons.privacy_tip_outlined),
          const DrawerListTile(title:"FAQs", icon: Icons.question_answer_outlined),
          const DrawerListTile(title:"Rate Us", icon: Icons.star_border_outlined),
          const SizedBox(height: 20),
          DrawerListTile(title:"Logout", icon: Icons.logout,color: Colors.red,onTap:()=> _handleLogout(context)),

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
            theme.toggleTheme(newValue);
          },
        );
      }),
      onTap: onTap,
    );
  }
}


