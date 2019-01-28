import 'package:flutter/material.dart';
import '../../blocs/main_bloc.dart';

class CartButton extends StatefulWidget {
  // This is the only place where I use statefulWidget because
  // CartButtonState mixin with SingleTickerProviderStateMixin to make vsync available

  final Color badgeColor;

  final Color badgeTextColor;

  CartButton({
    Key key,
    this.badgeColor: Colors.red,
    this.badgeTextColor: Colors.white,
  })  : assert(badgeColor != null),
        assert(badgeTextColor != null),
        super(key: key);

  @override
  CartButtonState createState() => CartButtonState();
}

class CartButtonState extends State<CartButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  final Tween<Offset> _badgePositionTween = Tween(
    begin: const Offset(-0.5, 0.9),
    end: const Offset(0.0, 0.0),
  );

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      stateID: "cartButtonState",
      blocs: [mainBloc],
      initState: (_) {
        _animationController = AnimationController(
          duration: const Duration(milliseconds: 500),
          vsync: this,
        );
        _animation = CurvedAnimation(
            parent: _animationController, curve: Curves.elasticOut);
        _animationController.forward();
      },
      dispose: (_) => _animationController.dispose(),
      builder: (_) {
        _animationController.reset();
        _animationController.forward();
        return IconButton(
          icon: Stack(
            overflow: Overflow.visible,
            children: [
              Icon(Icons.shopping_cart),
              Positioned(
                top: -8.0,
                right: -3.0,
                child: SlideTransition(
                  position: _badgePositionTween.animate(_animation),
                  child: Material(
                      type: MaterialType.circle,
                      elevation: 2.0,
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          mainBloc.itemCount.toString(),
                          style: TextStyle(
                            fontSize: 13.0,
                            color: widget.badgeTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
          onPressed: () => Navigator.of(context).pushNamed("/cart"),
        );
      },
    );
  }
}
