import 'package:flutter/material.dart';
import 'package:pac/controller/controllers.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final int seccion;
  const SectionTitle({Key? key, required this.title, required this.seccion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          InkWell(
            onTap: () {
              productController.searchTextEditController.clear();
              productController.searchVal.value = '';
              if (seccion == 1) {
                productController.getProducts();
              }
              dashboardController.updateIndex(seccion);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              width: 100,
              height: 40,
              child: const Text(
                "Ver más",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
