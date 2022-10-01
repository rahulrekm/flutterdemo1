import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Play_Pause_Anim(),
  ));
}

class Play_Pause_Anim extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Play_Pause_Anim_State();

}

class _Play_Pause_Anim_State extends State with SingleTickerProviderStateMixin{

  late AnimationController _animationController;

  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play Pause Animation"),
      ),
      body: Center(
        child: GestureDetector(onTap: (){
          changeIcon();
        },
          child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: _animationController,
          size: 200,color: Colors.blue,
          ),
        ),
      ),
    );
  }

  void changeIcon() {
    setState(() {
      isAnimated = !isAnimated;
      isAnimated ? _animationController.forward() : _animationController.reverse();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();

  }
}