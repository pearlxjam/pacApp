import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:pac/controller/dashboard_controller.dart';
import 'package:pac/theme/background.dart';
import 'package:pac/view/category/category_screen.dart';
import 'package:pac/view/home/home_screen.dart';
import 'package:pac/view/product/product_screen.dart';

import '../account/account_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: Stack(children: [
            const Background(),
            IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomeScreen(),
                ProductScreen(),
                CategoryScreen(),
                AccountScreen()
              ],
            ),
          ]),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 56, 194, 0.4),
            // border: Border(
            //   top: BorderSide(
            //       color: Theme.of(context).colorScheme.secondary, width: 0.7),
            // ),
          ),
          child: SnakeNavigationBar.color(
            backgroundColor: const Color.fromRGBO(0, 56, 194, 0.3),
            shadowColor: const Color.fromRGBO(0, 56, 194, 1),
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.indicator,
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            snakeViewColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            elevation: 50,
            currentIndex: controller.tabIndex,
            onTap: (val) {
              controller.updateIndex(val);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Descuentos'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu), label: 'Categorías'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Mi cuenta')
            ],
          ),
        ),
      ),
    );
  }
}
