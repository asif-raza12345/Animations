import 'package:flutter/material.dart';

class Swicher extends StatefulWidget {
  const Swicher({super.key});

  @override
  State<Swicher> createState() => _SwicherState();
}

class _SwicherState extends State<Swicher> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  void _toggleEmoji() {
    setState(() {
      _crossFadeState = _crossFadeState == CrossFadeState.showFirst
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("AnimatedCrossFade"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              crossFadeState: _crossFadeState,
              duration: const Duration(seconds: 4),
              firstChild: CircleAvatar(
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo8ecjL5DItbUDCqR7LuHDKfXt6PzdaTESzA&s"),
                radius: 100,
              ),
              secondChild:
              CircleAvatar(
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2020/12/19/02/50/emoji-5843434_640.png"),
                radius: 100,
              )
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(120, 50)),
              onPressed: _toggleEmoji,
              child: const Text("Switch Emoji"),
            ),
          ],
        ),
      ),
    );
  }
}
