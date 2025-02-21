import 'package:flutter/material.dart';

class card extends StatefulWidget {
  const card({super.key});

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  void CardDetails(){
    setState((){
      crossFadeState =crossFadeState == CrossFadeState.showFirst
          ?CrossFadeState.showSecond:
      CrossFadeState.showFirst;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedCrossFade",style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
          crossFadeState: crossFadeState,
          duration: Duration(seconds: 2),
                firstChild:
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage("https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                              radius: 50,
                            ),
                            Text("More Details",style: TextStyle(
                              color: Colors.white
                            ),)
                          ],
                        ),
                      ),
                    ),
                secondChild:  Container(
                        height: 250,
                        width: 220,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage("https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                                radius: 70,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.drive_file_rename_outline,color: Colors.white,),
                                  Text("Asif Raza",style: TextStyle(
                                    color: Colors.white
                                  ),),
                            ],
                          ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone,color: Colors.white,),
                                  Text("+92305579960",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.mail,color: Colors.white,),
                                  Text("asifraza01156@gmail.com",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ],
                              ),



                                              ]
                                                ),
                        )

                  ),


        ),
            SizedBox(height: 
            20),
            ElevatedButton(onPressed: CardDetails, child: Text("MoreDetails"))
            ]
        ),
    )
    );
  }
}
