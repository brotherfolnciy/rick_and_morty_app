part of 'widgets_part.dart';

class WaveAnimator extends StatefulWidget {
  const WaveAnimator({
    super.key,
    this.multiply = 1,
    this.duration,
    required this.child,
  });

  final double multiply;
  final Duration? duration;
  final Widget child;

  @override
  State<WaveAnimator> createState() => _WaveAnimatorState();
}

class _WaveAnimatorState extends State<WaveAnimator> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? Duration(milliseconds: 1000),
    );

    animation = Tween<double>(
      begin: -.2 * widget.multiply,
      end: .2 * widget.multiply,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutQuad,
      ),
    );

    animationController.addListener(() {
      setState(() {
        if (animationController.isCompleted) {
          animationController.reverse();
        }
        if (animationController.isDismissed) {
          animationController.forward();
        }
      });
    });

    animationController.forward();
  }

  static Matrix4 _pmat(num pv) {
    return Matrix4(
      1.0,
      0.0,
      0.0,
      0.0,
      0.0,
      1.0,
      0.0,
      0.0,
      0.0,
      0.0,
      1.0,
      pv * 0.001,
      0.0,
      0.0,
      0.0,
      1.0,
    );
  }

  Matrix4 perspective = _pmat(1.0);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Transform(
          transform: perspective.scaled(1.0, -1.0, 1.0)
            ..rotateX(pi + animation.value * animation.value * 3)
            ..rotateY(0.0)
            ..rotateZ(0.0),
          child: Transform.translate(
            offset: Offset(0, animation.value * animation.value * 350),
            child: Transform.rotate(
              angle: animation.value,
              child: Image.asset('assets/images/ufo.png'),
            ),
          ),
        );
      },
    );
  }
}
