import 'package:url_launcher/url_launcher.dart';

void launchWhatsapp() async {
  var number = "+919667289127";
  var whatsappAndroid =Uri.parse("whatsapp://send?phone=$number&text=Hello!");
  if (!await launchUrl(whatsappAndroid)) {
    throw Exception('Could not launch $whatsappAndroid');
  }
}

void makingPhoneCall() async {
  var url = Uri.parse("tel:+919667289127");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}