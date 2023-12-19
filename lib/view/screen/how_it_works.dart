import 'package:flutter/material.dart';
import 'package:itr_app/view/utils/horizontal_line.dart';

class HowItWorks extends StatelessWidget {
  const HowItWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .secondary,
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .tertiary,
        title: const Text("How It Works"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Row(
                children: [
                  CircleAvatar(radius: 12, child: Text("1"),),
                  SizedBox(width: 10,),
                  Text("Login", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HorizontalLine(length: 100,),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xff3291E9)
                                .withOpacity(0.6)),
                            color: const Color(0xff3291E9).withOpacity(0.12)
                        ),
                        child: const Center(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "Create an account or log in with your phone number to get started."),
                        )),
                      ),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  CircleAvatar(radius: 12, child: Text("2"),),
                  SizedBox(width: 10,),
                  Text("Upload Documents", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HorizontalLine(length: 100,),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xff3291E9)
                                .withOpacity(0.6)),
                            color: const Color(0xff3291E9).withOpacity(0.12)
                        ),
                        child: const Center(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "Upload the required documents securely. Our platform ensures the confidentiality of your information."),
                        )),
                      ),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  CircleAvatar(radius: 12, child: Text("3"),),
                  SizedBox(width: 10,),
                  Text("Make Payment", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HorizontalLine(length: 100,),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xff3291E9)
                                .withOpacity(0.6)),
                            color: const Color(0xff3291E9).withOpacity(0.12)
                        ),
                        child: const Center(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "Complete the payment for the platform fees securely through our integrated payment system."),
                        )),
                      ),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  CircleAvatar(radius: 12, child: Text("4"),),
                  SizedBox(width: 10,),
                  Text("ITR Filing", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HorizontalLine(length: 100,),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xff3291E9)
                                .withOpacity(0.6)),
                            color: const Color(0xff3291E9).withOpacity(0.12)
                        ),
                        child: const Center(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "Sit back and relax! Your agent will file your Income Tax Return on your behalf, ensuring accuracy and compliance."),
                        )),
                      ),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  CircleAvatar(radius: 12, child: Text("5"),),
                  SizedBox(width: 10,),
                  Text("E Verification", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xff3291E9)
                                .withOpacity(0.6)),
                            color: const Color(0xff3291E9).withOpacity(0.12)
                        ),
                        child: const Center(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "Your ITr Filing will be e-verified once filed."),
                        )),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Have questions or need assistance? Contact our support team.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(const MaterialApp(
//     home: HowItWorks(),
//   ));
// }
