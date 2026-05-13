import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import 'mechine_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MachineListScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,

        decoration: const BoxDecoration(
         color: Colors.white
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset("assets/bg_remove.png", height: 30.h,width: 80.w,fit: BoxFit.fill,),
              ),

              SizedBox(height: 2.h),

              Text(
                "Live Doff Dashboard",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              SizedBox(height: 1.h),

              Text(
                "Smart Textile Machine Monitoring",
                style: TextStyle(color: Colors.black54, fontSize: 15.sp),
              ),

              SizedBox(height: 5.h),

              SizedBox(
                width: 15.w,
                height: 15.h,
                child: Lottie.asset("assets/loading.json"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
