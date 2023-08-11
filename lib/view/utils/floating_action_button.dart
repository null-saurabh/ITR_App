import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';


class CustomFAB extends StatefulWidget {
  const CustomFAB({super.key});

  @override
  State<CustomFAB> createState() => _CustomFABState();
}

class _CustomFABState extends State<CustomFAB> {
  bool isOpen = false;

  Widget fabWithLabel(String icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
          const SizedBox(width: 10),
          FloatingActionButton(
            mini: true,
            onPressed: onTap,
            backgroundColor: Colors.blue,
            child: Image.asset(icon,color: Colors.white,height: 25,width: 25,),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        if (isOpen) ...[
          fabWithLabel("assets/images/phone.png", "Call us", () {}),
          const SizedBox(height: 10),
          fabWithLabel("assets/images/whatsapp.png", "WhatsApp", () {}),
          const SizedBox(height: 10),
        ],
        FloatingActionButton(
          onPressed: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          backgroundColor: isOpen ? Colors.white : Colors.blue,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: isOpen
                ? Icon(Icons.close_outlined , size: 40,color: Colors.blue, key: UniqueKey())
                : Image.asset("assets/images/headset.png",key: UniqueKey(),height: 36,width: 36,),
          ),
        ),
      ],
    );
  }
}
