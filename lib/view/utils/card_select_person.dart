import 'dart:math';
import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/upload_document_page.dart';
import 'package:itr_app/view/utils/select_person_extension.dart';

class SelectPersonCard extends StatefulWidget {
  const  SelectPersonCard({
    super.key,
  });

  @override
  State<SelectPersonCard> createState() => _SelectPersonCardState();
}

class _SelectPersonCardState extends State<SelectPersonCard> with AutomaticKeepAliveClientMixin{
  int quarterTurns = 1;
  bool showExtensions = false;
  List<bool> paymentStatusList = [true, false, false];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
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
              const EdgeInsets.only(top: 15.0, left: 15, right: 20, bottom: 15),
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
                      Text("John Smith",
                          style: TextStyle(
                              color: selectPersonPageTitleColor(themeMode),
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UploadDocument()));},
                    child: Container(
                      width: 108,
                      height: 36,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff3291E9)),
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
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text("Pan Card no: ",
                      style: TextStyle(
                          color: selectPersonPageSubtitleColor(themeMode),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  Text("SDFI343K34",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: selectPersonPageTitleColor(themeMode))),
                ],
              ),
              const SizedBox(
                height: 10,
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
                      Text("9876543210",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: selectPersonPageTitleColor(themeMode))),
                    ],
                  ),
                  RotatedBox(
                      quarterTurns: quarterTurns,
                      child: GestureDetector(
                        child: const Icon(Icons.navigate_next,size: 26),
                        onTap: () {
                          setState(() {
                            quarterTurns = (quarterTurns == 1) ? 3 : 1;
                            showExtensions = !showExtensions;
                          });
                        },
                      )),
                ],
              ),
              Visibility(
                visible: showExtensions,
                child: Column(
                  children:[
                    ...List.generate(2, (index) {
                        return SelectPersonCardExtension(paymentStatus: paymentStatusList[index],);
                      })
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
