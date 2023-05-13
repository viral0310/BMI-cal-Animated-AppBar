import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  double height = 100;
  String barTitle = "BMI calculator";
  String bmiResult = "";
  CustomAppBar(this.height, this.barTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: height,
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(80)),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/vector.png"),
                  fit: BoxFit.cover,
                  opacity: 0.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    barTitle,
                    style: TextStyle(
                      color: Colors.white, //Color(0xff1d1e33),
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      shadows: [
                        BoxShadow(
                            offset: Offset(3, 3),
                            color: Color(0xff1d1e33),
                            blurRadius: 3.0)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
