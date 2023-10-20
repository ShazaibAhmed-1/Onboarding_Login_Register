import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/Login/login.dart';
import 'package:login_page/Utils/app_colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // ignore: non_constant_identifier_names
  List OnBoarding = [
    {
      "image": "assets/images/screen1.png",
      "title": "Care Your Family",
      "description": "The Process can include educating now",
    },
    {
      "image": "assets/images/screen2.png",
      "title": "Act ahead of Time",
      "description": "No Holding Back",
    },
    {
      "image": "assets/images/screen3.png",
      "title": "On Ahead.......!!",
      "description": "See the World........!",
    },
  ];



  PageController pageController = PageController();

  void continueMethod() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MyLogin()),
        (Route<dynamic> route) => false);
  }

  int currentPage = 0;

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: continueMethod,
            child: const Text(
              "Skip",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: OnBoarding.length,
            onPageChanged: onChanged,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Image.asset(
                    OnBoarding[index]['image'],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    OnBoarding[index]['title'],
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    OnBoarding[index]['description'],
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: AppColors.white,
                    ),
                  ),
                ],
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              (currentPage == (OnBoarding.length - 1))
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.1,
                        right: 35,
                        left: 35,
                      ),
                      child: ElevatedButton(
                        onPressed: continueMethod,
                        child: const Text("Continue"),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        OnBoarding.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.1),
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              height: 10,
                              width: (index == currentPage) ? 25 : 10,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == currentPage)
                                      ? Colors.deepOrange
                                      : Colors.grey),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
