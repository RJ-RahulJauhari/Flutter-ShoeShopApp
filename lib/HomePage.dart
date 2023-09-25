import 'package:flutter/material.dart';
import 'package:shoe_shop_app/CartPage.dart';
import 'package:shoe_shop_app/ProductList.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
int currentPage = 0;


class _HomePageState extends State<HomePage> {

  List<Widget> pages = [
    ProductList(),
    CartPage()
  ];

  @override
  Widget build(BuildContext context) {

    const border = OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.black,
            width: 1,
            style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
    );


    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "")
        ],
      ),
    );
  }
}
