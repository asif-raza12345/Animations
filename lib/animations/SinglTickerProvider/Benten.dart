import 'package:flutter/material.dart';

class Benten extends StatefulWidget{
   Benten({super.key});

  @override
  State<Benten> createState() => _BentenState();
}

late AnimationController _animationController;
late Animation <double> _animation;

class _BentenState extends State<Benten> with SingleTickerProviderStateMixin {

  void initState() {
    setState(() {
      _animationController = AnimationController(vsync: this,
          duration: Duration(seconds: 2)
      )..addStatusListener(
          (ststus){
            if(ststus== _animationController.isCompleted){
            _animationController.reverse();
            }else{
              _animationController.forward();
            }
          }
      );
      _animation =
          Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    });
  }

  void _Benten() {
    setState(() {
      // _animationController.forward();
      _animationController.repeat();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: RotationTransition(
                turns: _animation,
                child: Column(
                  children: [
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                   CircleAvatar(
                     radius: 50,
                     backgroundColor: Colors.blueAccent,
                   ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                    )
                  ],
                ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.yellow,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.brown,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.green,
                        )
                      ],
                    ),
          ]
      ),
            ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: _Benten,
                child: Text("start")
            )

          ],
        ),
      ),
    );
  }
}