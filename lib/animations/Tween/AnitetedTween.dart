import 'package:flutter/material.dart';

class Anitetedtween extends StatefulWidget {
  const Anitetedtween({super.key});

  @override
  State<Anitetedtween> createState() => _AnitetedtweenState();
}

class _AnitetedtweenState extends State<Anitetedtween> {
  double end = 1;
  void _Tweenit(){
    setState(() {
      if(end == 1){
        end ==0;
      }else{
        end = 1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Tween<double> tween = Tween(begin: 0.0 , end: end);
    return Scaffold(
      appBar: AppBar(
        title: Text("TweenAnimations"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child:Column(
          children: [
            TweenAnimationBuilder(
                tween: tween,
                duration: Duration(seconds: 1),
                builder: (context, value ,child) => Opacity(
                    opacity: value,
                  child: child,
                ),
              child: Container(
                height: 200,
                width: 300,
                  color: Colors.blue,
              ),
            ),
            ElevatedButton(
                onPressed: _Tweenit,
                child: Text("press it"))
          ],
        ),
      ),
    );
  }
}
