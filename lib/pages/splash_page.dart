import 'package:flutter/material.dart';
import 'package:learn_firebase_auth/pages/login_page.dart';
import 'package:learn_firebase_auth/pages/register_page.dart';
import 'package:learn_firebase_auth/pages/welcome_page.dart';

class SplashPages extends StatefulWidget {
  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _SplashPagesState();
}

class _SplashPagesState extends State<SplashPages>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<Offset> _animationIcons;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = Tween(end: 1.0, begin: .0).animate(_controller);
    _animationIcons =
        Tween(end: const Offset(0.0, 0.0), begin: const Offset(0.0, 0.5))
            .animate(_controller);
    _controller.forward();
    stack();
    super.initState();
  }

  Future<void> stack() async {
    return await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const WelcomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff171A21),
        bottom: PreferredSize(
          preferredSize: const Size(4, 4),
          child: FadeTransition(
            opacity: _animation,
            child: SlideTransition(
              position: _animationIcons,
              child: Image.asset(
                "assets/images/img_2.png",
                width: 120,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xff171A21),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _animation,
              child: Image.asset(
                "assets/images/img.png",
                width: 300,
              ),
            ),
            FadeTransition(
              opacity: _animation,
              child: Image.asset(
                "assets/images/img_1.png",
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
