import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String ctegoryName;
  final String image;
  final VoidCallback? goToDetalisScreen;
  const CategoryCard(
      {super.key,
      required this.ctegoryName,
      required this.image,
      required this.goToDetalisScreen});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: goToDetalisScreen,
      child: Container(
          width: screenWidth - 40,
          height: screenHeight / 3 - 80,
          decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    image,
                  ),
                ),
                Text(
                  ctegoryName,
                  style: const TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                      letterSpacing: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
