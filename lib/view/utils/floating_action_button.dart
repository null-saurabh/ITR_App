// import 'package:flutter/material.dart';
// import 'package:itr_app/model/theme.colors.dart';
//
//
// class CustomFAB extends StatefulWidget {
//   const CustomFAB({super.key});
//
//   @override
//   State<CustomFAB> createState() => _CustomFABState();
// }
//
// class _CustomFABState extends State<CustomFAB> {
//   bool isOpen = false;
//
//   Widget fabWithLabel(String icon, String label, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(label,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
//           const SizedBox(width: 10),
//           FloatingActionButton(
//             mini: true,
//             onPressed: onTap,
//             backgroundColor: Colors.blue,
//             child: Image.asset(icon,color: Colors.white,height: 25,width: 25,),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: <Widget>[
//         if (isOpen) ...[
//           fabWithLabel("assets/images/phone.png", "Call us", () {}),
//           const SizedBox(height: 10),
//           fabWithLabel("assets/images/whatsapp.png", "WhatsApp", () {}),
//           const SizedBox(height: 10),
//         ],
//         FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               isOpen = !isOpen;
//             });
//           },
//           backgroundColor: isOpen ? Colors.white : Colors.blue,
//           child: AnimatedSwitcher(
//             duration: const Duration(milliseconds: 250),
//             child: isOpen
//                 ? Icon(Icons.close_outlined , size: 40,color: Colors.blue, key: UniqueKey())
//                 : Image.asset("assets/images/headset.png",key: UniqueKey(),height: 36,width: 36,),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:itr_app/view/utils/lauch_whatsapp_or_call.dart';

class CustomFAB extends StatefulWidget {
  const CustomFAB({super.key});

  @override
  State<CustomFAB> createState() => _CustomFABState();
}

class _CustomFABState extends State<CustomFAB> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.close,
      activeIcon: Icons.close_outlined,
      buttonSize:const Size(56,56),
      visible: true,
      closeManually: false,
      renderOverlay: true,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
      onClose: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: isOpen?Theme.of(context).colorScheme.primary:Colors.blue,
      foregroundColor: Colors.blue,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: Image.asset("assets/images/whatsapp.png", height: 25, width: 25),
          backgroundColor: Colors.blue,
          onTap:launchWhatsapp,
          label: 'WhatsApp',
          labelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0,color: Colors.black),
          labelBackgroundColor: Colors.white,
        ),
        SpeedDialChild(
          child: Image.asset("assets/images/phone.png", height: 25, width: 25),
          backgroundColor: Colors.blue,
          onTap: makingPhoneCall,
          label: 'Call us',
          labelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0,color: Colors.black),
          labelBackgroundColor: Colors.white,
        ),

      ],
      child: Image.asset('assets/images/headset.png', height: 30, width: 30),
    );
  }
}

