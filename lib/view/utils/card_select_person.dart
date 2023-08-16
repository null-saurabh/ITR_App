import 'dart:math';
import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';
import 'package:itr_app/view/utils/select_person_extension.dart';

class SelectPersonCard extends StatefulWidget {
  const SelectPersonCard({
    super.key,
  });

  @override
  State<SelectPersonCard> createState() => _SelectPersonCardState();
}

class _SelectPersonCardState extends State<SelectPersonCard> with AutomaticKeepAliveClientMixin{
  int quarterTurns = 1;
  bool showExtensions = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      elevation: 5,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15.0, left: 15, right: 20, bottom: 15),
        child: Container(
          // height: 110,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Text("JS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("John Smith",
                          style: TextStyle(
                              color: selectPersonPageTitleColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Container(
                    width: 108,
                    height: 36,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff3291E9)),
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xff3291E9).withOpacity(0.12)),
                    child: Center(
                        child: Text(
                      "Start Filling",
                      style: TextStyle(
                          color: Color(0xff5AB0FF),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text("Pan Card no: ",
                      style: TextStyle(
                          color: selectPersonPageSubtitleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  Text("SDFI343K34",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: selectPersonPageTitleColor)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Phone no: ",
                          style: TextStyle(
                              color: selectPersonPageSubtitleColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      Text("9876543210",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: selectPersonPageTitleColor)),
                    ],
                  ),
                  RotatedBox(
                      quarterTurns: quarterTurns,
                      child: GestureDetector(
                        child: Icon(Icons.navigate_next),
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
                        return SelectPersonCardExtension();
                      }),]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}