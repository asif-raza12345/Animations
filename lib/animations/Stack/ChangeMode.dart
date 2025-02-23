import 'package:flutter/material.dart';

class Changemode extends StatefulWidget {
  const Changemode({super.key});

  @override
  State<Changemode> createState() => _ChangemodeState();
}
CrossFadeState _crossFadeState = CrossFadeState.showFirst;
double right = 0;
double top = 50;
double left = 50;
class _ChangemodeState extends State<Changemode> {

  void NightMode(){
    setState(() {
      _crossFadeState = _crossFadeState == CrossFadeState.showFirst ?CrossFadeState.showSecond:CrossFadeState.showFirst;
      for(left=50; left<=500; left++){
        left +=30;
      }
      for(right=30; right<=350; right++){
      right +=30;
      }
    });
  }
  void LightMode(){
    setState(() {
      _crossFadeState = _crossFadeState == CrossFadeState.showFirst ?CrossFadeState.showSecond:CrossFadeState.showFirst;
      for(left=500; left>=50; left--){
        left -=30;
      }
      for(right=350; right>=-20; right--){
        right -=50;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double Screenheight = MediaQuery.of(context).size.height;
    double Screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedCrossFade(
          crossFadeState: _crossFadeState,
          duration: Duration(seconds: 3),
        firstChild: Flexible(
            flex: 100,
            child:Stack(
              children: [
                Expanded(
                  child: Container(
                    width:Screenwidth * 1,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                    height:  Screenheight * 0.80,
                    width:Screenwidth * 1,
                    color: Colors.blue,
                  ),

                ),
                AnimatedPositioned(
                  top: top,
                  left:left,
                  duration: Duration(seconds: 1),
                  child: Icon(Icons.sunny,color:Colors.yellow,size: Screenheight * 0.10,),
                ),
                AnimatedPositioned(
                    bottom: 50,
                    left:50,
                    duration: Duration(milliseconds: 200),
                    child: ElevatedButton(onPressed: NightMode, child:
                    Text("Night")
                    )
                ),
              ],
            )
        ),
        secondChild: Flexible(
            flex: 100,
            child:Stack(
              children: [
                Expanded(
                  child: Container(
                    width:Screenwidth * 1,
                    color: Colors.blueAccent,
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                    height:  Screenheight * 0.80,
                    width:Screenwidth * 1,
                    color: Colors.black,
                  ),

                ),
                AnimatedPositioned(
                  top: 50,
                  right:right,
                  duration: Duration(seconds: 1),
                  child: Icon(Icons.dark_mode_outlined,color:Colors.white,size: Screenheight * 0.10,),
                ),
                AnimatedPositioned(
                    bottom: 50,
                    left:50,
                    duration: Duration(seconds: 1),
                    child: ElevatedButton(onPressed: LightMode, child:
                    Text("Day")
                    )
                ),
              ],
            )
        ),
      )
    );
  }
}
