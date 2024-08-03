import 'package:flutter/material.dart';
import 'package:ui_design/common/widgets/custom_indicator.dart';
import 'package:ui_design/features/nav_bar/home/screen/home_page.dart';


class SplashScreenn extends StatefulWidget {
  const SplashScreenn({Key? key}) : super(key: key);

  @override
  State<SplashScreenn> createState() => _SplashScreennState();
}

class _SplashScreennState extends State<SplashScreenn> {
  @override
  void initState()  {
    // TODO: implement initState

    super.initState();
  }



  navigateToHome()async{

    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));

    });

  }

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies

   await Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));

    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }
}
