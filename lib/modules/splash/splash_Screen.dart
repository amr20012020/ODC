import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/shared/components/constants.dart';

class Splach extends StatefulWidget {
  const Splach({Key? key}) : super(key: key);

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateHome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image(
            image: AssetImage(
              'assets/images/logo.png',
            ),
          ),
        ),
      ),
    );
  }


  void navigateHome()async{
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget!));
  }
}
