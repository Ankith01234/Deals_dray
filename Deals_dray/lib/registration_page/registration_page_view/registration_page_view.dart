import 'package:deals_dray/common_widget/common_widget.dart';
import 'package:deals_dray/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:deals_dray/resources/resources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationPageView extends ConsumerStatefulWidget {
  const RegistrationPageView({super.key});

  @override
  RegistrationPageViewState createState() => RegistrationPageViewState();
}

class RegistrationPageViewState extends ConsumerState<RegistrationPageView> {
  @override
  Widget build(BuildContext context) {
    bool isHidden = true;
    CommonWidget commonWidget = CommonWidget();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController referralCodeController = TextEditingController();
    final registerListener=ref.watch(registerProvider);
    return Scaffold(
      backgroundColor: Color.whiteColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          registerListener.registerData(emailController.text, passwordController.text, context);
        },
        backgroundColor: Color.redColor,
        foregroundColor: Color.whiteColor,
        child: const Icon(Icons.arrow_forward_outlined),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(child: Image.asset("Images/dealsdray.jpeg")),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 130),
                      child: Text(
                        "Let's Begin!",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "Please enter your credentials to proceed",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            commonWidget.myTextField(emailController, "Your Email"),
            //commonWidget.myTextField(controller, hintText),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextField(
                obscureText: isHidden,
                decoration: InputDecoration(
                  labelText: 'Create Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        isHidden ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                  ),
                ),
              ),
            ),
            commonWidget.myTextField(
                referralCodeController, "Referral Code (Optional)"),
          ],
        ),
      ),
    );
  }
}
