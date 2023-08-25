import 'dart:math';
import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/upload_document_page.dart';
import 'package:itr_app/view/utils/select_person_extension.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

class SelectPersonCard extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String id;
  const SelectPersonCard({
    required this.name,
    required this.id,
    required this.phoneNumber,
    super.key,
  });

  @override
  State<SelectPersonCard> createState() => _SelectPersonCardState();
}

class _SelectPersonCardState extends State<SelectPersonCard> {
  int quarterTurns = 1;
  bool showExtensions = false;
  List<bool> paymentStatusList = [true, false, false];

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    return GestureDetector(
      onTap: () {
        setState(() {
          quarterTurns = (quarterTurns == 1) ? 3 : 1;
          showExtensions = !showExtensions;
        });
      },
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        elevation: 5,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15.0, left: 15, right: 15, bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        child: const Text("JS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(widget.name,
                          style: TextStyle(
                              color: selectPersonPageTitleColor(themeMode),
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UploadDocument(personId: widget.id)));
                        },
                        child: Container(
                          width: 108,
                          height: 36,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff3291E9)),
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xff3291E9).withOpacity(0.12)),
                          child: const Center(
                              child: Text(
                            "Start Filling",
                            style: TextStyle(
                                color: Color(0xff5AB0FF),
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          )),
                        ),
                      ),
                      // PopupMenuButton<String>(
                      //   icon: const Icon(Icons.more_vert),
                      //   onSelected: (String result) async{
                      //     if (result == 'option1') {
                      //       // Perform action for option 1
                      //     } else if (result == 'Delete') {
                      //       print("a");
                      //       try {
                      //         await Provider.of<ApiProvider>(context, listen: false).deletePerson(widget.id);
                      //       } catch (error) {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //             const SnackBar(content: Text('Failed to delete Person'))
                      //         );}
                      //     }
                      //   },
                      //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      //     const PopupMenuItem<String>(
                      //       value: 'Edit',
                      //       child: Text('Edit'),
                      //     ),
                      //     const PopupMenuItem<String>(
                      //       value: 'Delete',
                      //       child: Text('Delete'),
                      //     ),
                      //   ],
                      // )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text("User Id: ",
                      style: TextStyle(
                          color: selectPersonPageSubtitleColor(themeMode),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  Text(widget.id,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: selectPersonPageTitleColor(themeMode))),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Phone no: ",
                          style: TextStyle(
                              color: selectPersonPageSubtitleColor(themeMode),
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      Text(widget.phoneNumber,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: selectPersonPageTitleColor(themeMode))),
                    ],
                  ),
                  Row(children: [
                    IconButton(
                        onPressed: () async {
                          try {
                            await Provider.of<ApiProvider>(context,
                                    listen: false)
                                .deletePerson(widget.id);
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Failed to delete Person')));
                          }
                        },
                        icon: const Icon(Icons.delete_forever)),
                    RotatedBox(
                        quarterTurns: quarterTurns,
                        child: GestureDetector(
                          child: const Icon(Icons.navigate_next, size: 26),
                          onTap: () {
                            setState(() {
                              quarterTurns = (quarterTurns == 1) ? 3 : 1;
                              showExtensions = !showExtensions;
                            });
                          },
                        )),
                  ]),
                ],
              ),
              Visibility(
                visible: showExtensions,
                child: Column(children: [
                  ...List.generate(2, (index) {
                    return SelectPersonCardExtension(
                      paymentStatus: paymentStatusList[index],
                    );
                  })
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
