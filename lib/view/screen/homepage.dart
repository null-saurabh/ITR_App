import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/how_it_works.dart';
import 'package:itr_app/view/screen/pending_itr.dart';
import 'package:itr_app/view/screen/select_person.dart';
import 'package:itr_app/view/utils/drawer.dart';
import 'package:itr_app/view/utils/floating_action_button.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    Provider.of<ApiProvider>(context, listen: false).updateOrdersForDashboard();
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
                  decoration: BoxDecoration(gradient: blueGradient),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      AppBar(
                        title: Consumer<ApiProvider>(
                          builder: (context, apiProvider, _) {
                            final userProfile = apiProvider.userProfile;
                            return Text(
                                'Welcome, ${userProfile?.name ?? "Guest"}!',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18));
                          },
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        homePageImage(themeMode),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                // if(Provider.of<ApiProvider>(context).ordersForDashboard != null &&  Provider.of<ApiProvider>(context).ordersForDashboard!.isNotEmpty)
                // TextButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const PendingItr()));
                //     },
                //     child: const Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text(
                //           "Pending ITRs ",
                //           style:
                //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //         ),
                //         Icon(Icons.arrow_forward_rounded)
                //       ],
                //     )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 375,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 22.0, top: 15, bottom: 15),
                          child: Text(
                            "File Your Income Tax Return",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                        Consumer<ApiProvider>(
                          builder: (context, apiProvider, _) {
                            if (apiProvider.ordersForDashboard != null &&
                                apiProvider.ordersForDashboard!.isNotEmpty) {
                              return HomePageListTile(
                                title: "Pending ITRs",
                                image: "assets/images/startFillingImage.png",
                                icon: Icon(
                                  Icons.navigate_next,
                                  color: greyAndWhiteColor(themeMode),
                                ),
                                price: apiProvider.ordersForDashboard!.length
                                    .toString(),
                                navigateToPage: const PendingItr(),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        HomePageListTile(
                          title: "Start Income Tax\nFilling",
                          image: "assets/images/startFillingImage.png",
                          icon: Icon(
                            Icons.navigate_next,
                            color: greyAndWhiteColor(themeMode),
                          ),
                          price: "₹599",
                          navigateToPage: const SelectPerson(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        HomePageListTile(
                          title: "How It Works",
                          image: "assets/images/questionMark.png",
                          icon: Icon(Icons.navigate_next,
                              color: greyAndWhiteColor(themeMode)),
                          navigateToPage: const HowItWorks(),
                        ),
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
  const HomePageListTile(
      {super.key,
      required this.title,
      required this.image,
      required this.icon,
      this.price,
      required this.navigateToPage});

  final String title;
  final String image;
  final Icon icon;
  final String? price;
  final Widget navigateToPage;

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: Container(
        height: title == "Pending ITRs" ? 60 : 90,
        decoration: BoxDecoration(
            color: homePageContainerColor(themeMode),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.75),
                blurRadius: 1,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ]),
        child: Center(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => navigateToPage,
                ),
              );
            },
            title: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            leading: title == "Pending ITRs"
                ? const Icon(
                    Icons.watch_later,
                    color: Color(0xFF5AB0FF),
                    size: 28,
                  )
                : Image.asset(image),
            trailing: price != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title == "Pending ITRs")
                        Container(
                          height: 31,
                          width: 31,
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              price!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      else
                        Text(
                          price!,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
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

// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => const PendingItr(),
// ),
// );
// },
