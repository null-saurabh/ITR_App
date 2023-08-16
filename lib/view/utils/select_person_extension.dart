import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';

class SelectPersonCardExtension extends StatelessWidget {
  final bool paymentStatus;
  const SelectPersonCardExtension({
    required this.paymentStatus,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardExtensionColor,
      elevation: 5,

      child: Padding(
        padding: const EdgeInsets.only(top: 15.0,left: 15,right: 20,bottom: 15),
        child: Container(
          height: 100,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("2022-23",style: TextStyle(color: selectPersonPageTitleColor,fontSize: 17,fontWeight: FontWeight.w600)),
                  Container(
                    width: 99,
                    height: 36,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff3291E9)),
                        borderRadius: BorderRadius.circular(25),
                        // color:  Color(0xff3291E9).withOpacity(0.12)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/verify.png",width: 16,height: 16,),
                        Text("E-verified",style: TextStyle(color:  Color(0xff5AB0FF),fontWeight: FontWeight.w500,fontSize: 12),),
                      ],
                    ),)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date",style: TextStyle(color: selectPersonPageSubtitleColor,fontSize: 14,fontWeight: FontWeight.w400)),
                      SizedBox(height: 5),
                      Text("12 Oct 2023",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: selectPersonPageTitleColor)),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment Status",style: TextStyle(color: selectPersonPageSubtitleColor,fontSize: 14,fontWeight: FontWeight.w400)),
                          SizedBox(height: 5),
                          paymentStatus
                          ?Text("Success",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff39AD3E)))
                              :Text("Fail",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.red))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
