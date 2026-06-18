import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(  
      child: LoadingAnimationWidget.discreteCircle(color: Colors.blue, size: 200),
    );
  }
}
