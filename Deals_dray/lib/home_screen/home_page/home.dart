import 'package:flutter/material.dart';
import 'package:deals_dray/resources/resources.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.indigoColor,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(500),
                      // ),
                      color: Color.indigoColor,
                      child: Column(
                        children: [
                          Text(
                            "KYC Pending",
                            style:
                                TextStyle(color: Color.whiteColor, fontSize: 30),
                          ),
                          Text(
                            "You need to provide the reqiured",
                            style:
                                TextStyle(color: Color.whiteColor, fontSize: 20),
                          ),
                          Text(
                            "documents for your accounts activation",
                            style:
                                TextStyle(color: Color.whiteColor, fontSize: 20),
                          ),
                          Text(
                            "Click Here",
                            style: TextStyle(
                                color: Color.whiteColor,
                                decoration: TextDecoration.underline,
                                decorationColor: Color.whiteColor,
                                fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Color.indigoColor,
                        radius: 40,
                        child: Icon(
                          Icons.mobile_off,
                          size: 30,
                          color: Color.whiteColor,
                        )),
                    Text("Mobile")
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Color.greenColor,
                        radius: 40,
                        child: Icon(
                          Icons.laptop_chromebook_outlined,
                          size: 30,
                          color: Color.whiteColor,
                        )),
                    Text("Laptop")
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Color.pinkColor,
                        radius: 40,
                        child: Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: Color.whiteColor,
                        )),
                    Text("Camera")
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Color.orangeColor,
                        radius: 40,
                        child: Icon(
                          Icons.lightbulb_outlined,
                          size: 30,
                          color: Color.whiteColor,
                        )),
                    Text("Bulb")
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Container(
              height: 400,
              width: 400,
              color: Color.ramaGreenColor,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("EXCLUSIVE FOR YOU",style: TextStyle(color: Color.whiteColor,fontSize: 30),),
                      Icon(Icons.arrow_forward_outlined,color: Color.whiteColor,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Color.whiteColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("Images/mobile1.webp"),
                          const Text("Nokia 8.1(iron,64 GB",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
