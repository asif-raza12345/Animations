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
    double Screenheight = MediaQuery.of(context).size.height;
    double Screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
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
                  Container(
                    height: Screenheight * 0.20,
                    width: Screenwidth *0.20,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: Colors.yellow
                      )
                    ),
                  ),
                        Container(
                          height: Screenheight * 0.20,
                          width: Screenwidth *0.20,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2,
                                  color: Colors.yellow
                              )
                          ),
                        ),
                  ],
                ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: Screenheight * 0.20,
                          width: Screenwidth *0.20,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2,
                                  color: Colors.yellow
                              )
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Screenheight * 0.20,
                          width: Screenwidth *0.20,
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2,
                                  color: Colors.yellow
                              )
                          ),
                        ),
                        Container(
                          height: Screenheight * 0.20,
                          width: Screenwidth *0.20,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2,
                                  color: Colors.yellow
                              )
                          ),
                        ),
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