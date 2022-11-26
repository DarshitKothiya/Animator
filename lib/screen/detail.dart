import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class detailPage extends StatefulWidget {
  const detailPage({Key? key}) : super(key: key);

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> with TickerProviderStateMixin {

  late AnimationController animationController;
  late Animation rotationAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();

    rotationAnimation = Tween(begin: 0, end: 2 * pi).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var res = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1524334228333-0f6db392f8a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZGFyayUyMHNwYWNlfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
              fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white54),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Transform.rotate(
              angle: rotationAnimation.value,
              child: Hero(
                tag: res['tag'],
                child: Image.asset(
                  res['image'],
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white54,
                border: Border.all(color: Colors.black,width: 2)
              ),
              child: Text('${res['name']}', style: GoogleFonts.balooBhai2(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500),),
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white54,
                  border: Border.all(color: Colors.black,width: 2)
              ),
              child: Text('Orbit Period : ${res['orbit']}', style: GoogleFonts.balooBhai2(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500),),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 240,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white54,
                border: Border.all(color: Colors.black,width: 2)
              ),
              child: Text('${res['detail']}',textAlign: TextAlign.left ,style: GoogleFonts.habibi(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      ),
    );
  }
}
