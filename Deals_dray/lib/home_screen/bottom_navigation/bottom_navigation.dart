import 'package:deals_dray/home_screen/home_page/home.dart';
import 'package:flutter/material.dart';
import 'package:deals_dray/resources/resources.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Type in your text",
              fillColor: Color.greyColor,
              suffixIcon: const Icon(Icons.search),
              prefixIcon: IconButton(
                icon: const Icon(Icons.telegram),
                onPressed: () {},
                color: Color.redColor,
              )),
        ),
        actions: const [
          Icon(Icons.notifications_none),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: "Deals"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Color.redColor,
        unselectedItemColor: Color.greyColor,
        onTap: onTapped,
      ),
      body: PageView(
        controller: pageController,
        children: const [
          HomeScreenView(),
          Center(
            child: Text("Category"),
          ),
          Center(
            child: Text("Deals"),
          ),
          Center(
            child: Text("Cart"),
          ),
          Center(
            child: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
