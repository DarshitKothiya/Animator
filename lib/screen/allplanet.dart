import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../modal.dart';

class planetPage extends StatefulWidget {
  const planetPage({Key? key}) : super(key: key);

  @override
  State<planetPage> createState() => _planetPageState();
}

class _planetPageState extends State<planetPage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    sizeAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutSine,
      ),
    );

    animationController.addListener(() {
      setState(() {});
    });

    animationController.addStatusListener((status) {
      if(animationController.isCompleted){
        animationController.reverse();
      }else if(animationController.isDismissed){
        animationController.forward();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/p-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                const Icon(
                  Icons.menu_rounded,
                  size: 27,
                  color: Colors.white,
                ),
                const Spacer(),
                Container(
                  height: 37,
                  width: 37,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/premium-vector/man-profile-cartoon_18591-58482.jpg?w=2000'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 50),
            Text('Space Gallery',
                style: GoogleFonts.habibi(
                  textStyle: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
            const SizedBox(height: 90),
            SizedBox(
              height: 390,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 450,
                  viewportFraction: 0.72,
                  enlargeCenterPage: true,
                ),
                items: Modal.planet.map((e) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 60),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.elliptical(100, 70),
                                topRight: Radius.elliptical(100, 70),
                                bottomLeft: Radius.elliptical(100, 70),
                                bottomRight: Radius.elliptical(100, 70),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(top: 60),
                              padding: EdgeInsets.all(10),
                              height: 75,
                              child: Text(
                                e['detail'],
                                style: GoogleFonts.gabriela(),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              AnimatedBuilder(
                                animation: animationController,
                                builder: (context, _) {
                                  return Transform.scale(
                                    scale: sizeAnimation.value,
                                    child: SizedBox(
                                      height: 160,
                                      child: Hero(
                                        tag: e['tag'],
                                        child: Image.asset(
                                          e['image'],
                                          height: e['size'],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 5),
                              Text(
                                e['name'],
                                style: GoogleFonts.balooBhai2(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              const SizedBox(height: 85),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'detail_page', arguments: e);
                                },
                                child: Container(
                                  height: 55,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.teal.withOpacity(0.4),
                                      border: Border.all(color: Colors.black)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'More',
                                        style: GoogleFonts.ubuntu(fontSize: 18),
                                      ),
                                      const Icon(
                                          Icons.arrow_forward_ios_rounded)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
