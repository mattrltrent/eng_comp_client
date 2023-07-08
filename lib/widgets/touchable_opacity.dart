import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TouchableOpacity extends StatefulWidget {
  const TouchableOpacity({
    this.tappable = true,
    required this.child,
    required this.onTap,
    this.tooltip,
    this.fadeSplashOut = true,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final bool fadeSplashOut;
  final Function onTap;
  final bool tappable;
  final String? tooltip;

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation anim;

  @override
  void initState() {
    animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0), reverseDuration: const Duration(milliseconds: 400));
    anim = CurvedAnimation(parent: animController, curve: Curves.linear, reverseCurve: Curves.linear);
    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  void startAnim() async {
    animController.forward().then((value) {
      if (widget.fadeSplashOut) animController.reverse();
    });
    animController.addListener(() {
      setState(() {});
    });
  }

  void reverseAnim() {
    animController.reverse();
    animController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.tappable
        ? GestureDetector(
            onTapDown: (_) => setState(() {
              animController.forward();
              animController.addListener(() {
                setState(() {});
              });
            }),
            onTapCancel: () => setState(() {
              animController.reverse();
              animController.addListener(() {
                setState(() {});
              });
            }),
            onTap: () {
              widget.onTap();
              HapticFeedback.lightImpact();
              startAnim();
            },
            child: Opacity(
              opacity: -anim.value * 0.65 + 1,
              child: widget.child,
            ),
          )
        : widget.child;
  }
}
