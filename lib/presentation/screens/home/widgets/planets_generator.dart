part of 'widgets_part.dart';

class PlanetsGenerator extends StatefulWidget {
  const PlanetsGenerator({
    super.key,
    required this.onTap,
    required this.count,
    this.topPadding = 0,
  });

  final Function(PlanetShape) onTap;
  final int count;
  final double topPadding;

  @override
  State<PlanetsGenerator> createState() => _PlanetsGeneratorState();
}

class _PlanetsGeneratorState extends State<PlanetsGenerator> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CanvasTouchDetector(
        gesturesToOverride: [
          GestureType.onTapDown,
        ],
        builder: (context) {
          return CustomPaint(
            painter: PlanetsPainter(
              context,
              count: widget.count,
              onTap: (circle) {
                widget.onTap(circle);
              },
              orientation: context.isDesktop ? Axis.horizontal : Axis.vertical,
              topPadding: widget.topPadding,
            ),
          );
        },
      ),
    );
  }
}

final List<PlanetShape> _shapes = [];

bool wasPainted = false;

class PlanetsPainter extends CustomPainter {
  PlanetsPainter(
    this.context, {
    required this.onTap,
    required this.count,
    this.topPadding = 0,
    this.orientation = Axis.vertical,
  });

  final double topPadding;

  final Function(PlanetShape) onTap;
  final int count;
  final Axis orientation;

  final BuildContext context;

  final Random random = Random();

  void createPlanet(Canvas canvas, Size size) {
    PlanetShape planetShape = PlanetShape();
    bool circleSafeToDraw = false;

    for (var i = 0; i < createPlanetsAttemps; i++) {
      planetShape
        ..radius = planetsMinRaidus
        ..center = Point(
          random.nextDouble() * size.width,
          random.nextDouble() * size.height + topPadding,
        );

      if (doesHaveCollision(planetShape, size)) {
        continue;
      } else {
        circleSafeToDraw = true;
        break;
      }
    }

    if (!circleSafeToDraw) {
      return;
    }

    for (var i = planetsMinRaidus; i < planetsMaxRaidus; i++) {
      planetShape.radius = i;
      if (doesHaveCollision(planetShape, size)) {
        planetShape.radius--;
        break;
      }
    }

    final colorSeed = Random().nextInt(255);

    planetShape.color = getColorFromSeed(colorSeed);

    planetShape.index = _shapes.length;

    _shapes.add(planetShape);
  }

  bool doesHaveCollision(PlanetShape circle, Size size) {
    for (var i = 0; i < _shapes.length; i++) {
      PlanetShape otherCircle = _shapes[i];
      double r2 = circle.radius + otherCircle.radius;

      if (r2 >= circle.center.distanceTo(otherCircle.center) - 1) {
        return true;
      }
    }

    if (circle.center.x + circle.radius >= size.width || circle.center.x - circle.radius <= 0) {
      return true;
    }

    if (circle.center.y + circle.radius >= size.height || circle.center.y - circle.radius <= 0) {
      return true;
    }

    return false;
  }

  void drawPlanet(TouchyCanvas canvas) {
    Paint paint = Paint()
      ..strokeWidth = 0.5
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    _shapes.asMap().forEach((key, circle) {
      Offset offset = Offset(circle.center.x.toDouble(), circle.center.y.toDouble());

      paint.color = circle.color;

      canvas.drawCircle(
        offset,
        circle.radius - 10,
        paint,
        onTapDown: (details) {
          onTap(circle);
        },
      );
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    final touchyCanvas = TouchyCanvas(context, canvas);

    if (!wasPainted) _shapes.clear();
    for (var i = 0; i < totalPlanets; i++) {
      if (!wasPainted) {
        createPlanet(canvas, size);
      }
      drawPlanet(touchyCanvas);
    }
    wasPainted = true;
  }

  @override
  bool shouldRepaint(PlanetsPainter oldDelegate) => false;
}
