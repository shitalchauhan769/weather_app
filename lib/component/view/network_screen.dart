import 'package:flutter/material.dart';
class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  decoration:  const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff9572da),
                        Color(0xffd3a0eb),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                ),
                const Center(child: Image(image: AssetImage("assets/image/network.png"),width: 150,height: 150,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}