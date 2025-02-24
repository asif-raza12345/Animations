import 'package:anmations_controll/animations/SinglTickerProvider/Benten.dart';
import 'package:flutter/material.dart';

class Transitionscale extends StatefulWidget {
  const Transitionscale({super.key});

  @override
  State<Transitionscale> createState() => _TransitionscaleState();
}

class _TransitionscaleState extends State<Transitionscale> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleanimation;

  @override
  void initState() {
    setState(() {
      _animationController = AnimationController(vsync: this,
        duration: Duration(seconds: 1),
      )..addStatusListener(
          (status){
            if(status == _animationController.isCompleted){
              _animationController.reverse();
            }else if(status == _animationController.isDismissed){
              _animationController.forward();
            }
          }
      );
      _scaleanimation = Tween<double>(begin: 1,end: 2).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  void _Benten(){
    setState(() {
_animationController.repeat();
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            ScaleTransition(
                scale: _scaleanimation,
              child:Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIK0WR0hp4qqKK5aRnRGv-UkSrIgqyBWM1Qbakidwu0cBgvE7y9peCWX8HD3HrzVwskwE&usqp=CAU"
                      )
                  )
                ),
              )
              ),
            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: _Benten, child: Text("press")
            )
          ],
        ),
      ),
    );
  }
}
