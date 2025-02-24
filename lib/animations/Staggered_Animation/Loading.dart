import 'dart:math';

import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;



  late Animation <double> _rotationAnimation;
  late Animation <double> _widthAnimation;
  late Animation <double> _heightAnimation;
  late Animation <double> _fadeAnimation;




  @override
  void initState() {
    // TODO: implement initState
    _animationController =AnimationController(vsync: this,
      duration: Duration(seconds: 1)

    )..addListener(
        ()=>
      setState(() {

      })
    );

    _rotationAnimation  = Tween<double>(begin: 0.0, end: 2*pi).animate(CurvedAnimation(parent: _animationController, curve: Interval(0, 0.25)));

    _widthAnimation = Tween<double>(begin: 0.0, end: 300).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.25,0.50)));

    _heightAnimation = Tween<double>(begin: 0.0, end: 300).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.50, 0.75)));

    _fadeAnimation =Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.75, 1.0)));

    super.initState();
  }


@override
  void dispose() {
  // TODO: implement dispose
  _animationController.dispose();
  super.dispose();
}
void Menu(){
    setState(() {
      if(_animationController.isCompleted){
        _animationController.reverse();
      }else{
        _animationController.forward();
      }
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Stack(
            children: [
              Container(
                color: Colors.blueAccent,
                height: _heightAnimation.value,
                width: _widthAnimation.value,
                child: Opacity(
                   opacity: (_fadeAnimation.value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor:Colors.brown,
                              radius: 50,
                              child: Icon(Icons.person,color: Colors.white,size: 50,),
                            ),
                            Text("Asif Raza,",style: TextStyle(
                              color: Colors.white
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Transform.rotate(
                  angle: _rotationAnimation.value,
                child: IconButton(onPressed: Menu, icon: Icon(Icons.menu))
              )
            ],
          )
        ],
      ),
    ]
    )
    );
  }
}

