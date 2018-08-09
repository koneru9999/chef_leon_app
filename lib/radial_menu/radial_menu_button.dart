import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RadialMenuButton extends StatelessWidget {
  const RadialMenuButton({
    @required this.child,
    this.backgroundColor,
    this.onPressed,
  });

  final Widget child;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Color color = backgroundColor ?? Theme.of(context).accentColor;

    return new Semantics(
      button: true,
      enabled: true,
      child: new Material(
        type: MaterialType.circle,
        elevation: 15.0,
        color: color,
        child: new InkWell(
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}