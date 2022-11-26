import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    ),
  );
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation boxHeightAnimation;
  late Animation boxWidthAnimation;
  late Animation boxColorAnimation;

  Color myfemaleboxcolor = const Color(0xff1d1e33);
  Color mymaleboxcolor = const Color(0xff1d1e33);
  Color myfemaleiconcolor = Colors.white;
  Color mymaleiconcolor = Colors.white;
  BorderRadius myfemaleboxradius = BorderRadius.circular(10);
  BorderRadius mymaleboxradius = BorderRadius.circular(10);
  double heightsliderval = 0;
  int Weight = 0;
  int Age = 0;
  Color bottomboxcolor = const Color(0xff1d1e33);
  BorderRadius bottomboxradius = BorderRadius.circular(10);
  double bmianswer = 0;
  double heightinmeter = 0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..forward();

    boxHeightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 60), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 60, end: 60), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 60, end: 60), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 60, end: 190), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 190, end: 190), weight: 1),
    ]).animate(animationController);

    boxWidthAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 60), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 60, end: 60), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 60, end: 100), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 100, end: 150), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 150, end: 150), weight: 1),
    ]).animate(animationController);

    boxColorAnimation = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.white), weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.white), weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.white54),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white54, end: myfemaleboxcolor),
          weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: myfemaleboxcolor, end: myfemaleboxcolor),
          weight: 1),
    ]).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: const Color(0xff090e21),
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color(0xff090e21),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (mymaleiconcolor == Colors.white) {
                              myfemaleiconcolor =
                                  (myfemaleiconcolor == Colors.white)
                                      ? Colors.pink
                                      : Colors.white;
                              myfemaleboxcolor =
                                  (myfemaleboxcolor == const Color(0xff1d1e33))
                                      ? const Color(0xff3b3c4d)
                                      : const Color(0xff1d1e33);
                              myfemaleboxradius = (myfemaleboxradius ==
                                      BorderRadius.circular(10))
                                  ? BorderRadius.circular(20)
                                  : BorderRadius.circular(10);
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: boxHeightAnimation.value,
                          width: boxWidthAnimation.value,
                          decoration: BoxDecoration(
                            color: (animationController.isCompleted)
                                ? myfemaleboxcolor
                                : boxColorAnimation.value,
                            borderRadius: myfemaleboxradius,
                          ),
                          child: (animationController.isCompleted)
                              ? Column(
                                  children: [
                                    Icon(
                                      Icons.female_sharp,
                                      size: 140,
                                      color: myfemaleiconcolor,
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(
                                          color: myfemaleiconcolor,
                                          fontSize: 25),
                                    )
                                  ],
                                )
                              : Container(),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              if (myfemaleiconcolor == Colors.white) {
                                mymaleiconcolor =
                                    (mymaleiconcolor == Colors.white)
                                        ? Colors.pink
                                        : Colors.white;
                                mymaleboxcolor =
                                    (mymaleboxcolor == const Color(0xff1d1e33))
                                        ? const Color(0xff3b3c4d)
                                        : const Color(0xff1d1e33);
                                mymaleboxradius = (mymaleboxradius ==
                                        BorderRadius.circular(10))
                                    ? BorderRadius.circular(20)
                                    : BorderRadius.circular(10);
                              }
                            },
                          );
                        },
                        child: Container(
                          height: boxHeightAnimation.value,
                          width: boxWidthAnimation.value,
                          decoration: BoxDecoration(
                            color: (animationController.isCompleted)
                                ? myfemaleboxcolor
                                : boxColorAnimation.value,
                            borderRadius: mymaleboxradius,
                          ),
                          child: (animationController.isCompleted)
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.male_sharp,
                                      size: 140,
                                      color: mymaleiconcolor,
                                    ),
                                    Text(
                                      "Male",
                                      style: TextStyle(
                                          color: mymaleiconcolor, fontSize: 25),
                                    )
                                  ],
                                )
                              : Container(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 2000),
                    builder: (context, double size, _) {
                      return Transform.scale(
                        scale: size,
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff1d1e33),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              const Text(
                                "HEIGHT",
                                style: TextStyle(
                                    color: Colors.white24, fontSize: 20),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${heightsliderval.toInt()}",
                                    style: const TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    " cm",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white24),
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                              Slider(
                                min: 0,
                                max: 250,
                                value: heightsliderval,
                                label: "${heightsliderval.toInt()}",
                                divisions: 250,
                                onChanged: (val) {
                                  setState(() {
                                    heightsliderval = val;
                                  });
                                },
                                activeColor: const Color(0xfff5c1d1),
                                inactiveColor: const Color(0xff555555),
                                thumbColor: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: boxHeightAnimation.value + 20,
                        width: boxWidthAnimation.value,
                        decoration: BoxDecoration(
                          color: (animationController.isCompleted)
                              ? bottomboxcolor
                              : boxColorAnimation.value,
                          borderRadius: bottomboxradius,
                        ),
                        child: (animationController.isCompleted)
                            ? Column(
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Weight",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(height: 17),
                                  Text(
                                    "$Weight",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 60),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (Weight > 0) {
                                              Weight--;
                                            }
                                          });
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff4c4f5e)),
                                            child: const Icon(
                                              Icons.remove,
                                              size: 45,
                                              color: Colors.white,
                                            )),
                                      ),
                                      const SizedBox(width: 15),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Weight++;
                                          });
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff6e6f7a)),
                                            child: const Icon(
                                              Icons.add,
                                              size: 45,
                                              color: Color(0xfff67fa4),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              )
                            : Container(),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        alignment: Alignment.center,
                        height: boxHeightAnimation.value + 20,
                        width: boxWidthAnimation.value,
                        decoration: BoxDecoration(
                          color: (animationController.isCompleted)
                              ? bottomboxcolor
                              : boxColorAnimation.value,
                          borderRadius: bottomboxradius,
                        ),
                        child: (animationController.isCompleted)
                            ? Column(
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Age",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(height: 17),
                                  Text(
                                    "$Age",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 60),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (Age > 0) {
                                              Age--;
                                            }
                                          });
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff4c4f5e)),
                                            child: const Icon(
                                              Icons.remove,
                                              size: 45,
                                              color: Colors.white,
                                            )),
                                      ),
                                      const SizedBox(width: 15),
                                      GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              Age++;
                                            },
                                          );
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff6e6f7a)),
                                            child: const Icon(
                                              Icons.add,
                                              size: 45,
                                              color: Color(0xfff67fa4),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TweenAnimationBuilder(
                tween: Tween(begin: Offset(0, 100), end: Offset(0,0)),
                duration: const Duration(milliseconds: 2000),
                builder: (context, align, _) {
                  return Transform.translate(
                    offset: align,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          heightinmeter = heightsliderval / 100;
                          bmianswer = Weight / (heightinmeter * heightinmeter);
                          print(bmianswer);
                        });
                      },
                      onDoubleTap: () {
                        setState(
                          () {
                            myfemaleboxcolor = const Color(0xff1d1e33);
                            mymaleboxcolor = const Color(0xff1d1e33);
                            myfemaleiconcolor = Colors.white;
                            mymaleiconcolor = Colors.white;
                            myfemaleboxradius = BorderRadius.circular(10);
                            mymaleboxradius = BorderRadius.circular(10);
                            heightsliderval = 0;
                            Weight = 0;
                            Age = 0;
                            bottomboxcolor = const Color(0xff1d1e33);
                            bottomboxradius = BorderRadius.circular(10);
                            bmianswer = 0;
                            heightinmeter = 0;
                          },
                        );
                      },
                      child: Ink(
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: const Text(
                            "Calculate",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
