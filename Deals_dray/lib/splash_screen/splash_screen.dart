import 'package:deals_dray/login_screen/login_screen_view/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:deals_dray/resources/resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.whiteColor,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
              height: 800,
              width: 600,
              child: Image.asset("Images/frontphoto1.png")),
        ],
      ),
    );
  }
}

