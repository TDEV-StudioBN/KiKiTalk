import 'package:flutter/material.dart';

class WIDButton extends StatefulWidget {
  final Function onTap;
  final Color color;
  final double bulging;
  final double bulgingNomarl;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget child;

  const WIDButton({
    super.key,
    required this.onTap,
    this.color = Colors.grey,
    this.bulging = 5,
    this.bulgingNomarl = 1,
    this.borderRadius,
    this.padding,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _WIDButtonState();
}

class _WIDButtonState extends State<WIDButton> {
  bool _isPressed = false;
  Color get colorBorder => Color.alphaBlend(Colors.grey.withValues(alpha: 0.7), widget.color.withValues(alpha: 0.3));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: () {
        setState(() => _isPressed = true);
        Future.delayed(const Duration(milliseconds: 100), () {
          widget.onTap();
          if(context.mounted) {
            setState(() => _isPressed = false);
          }
        });
      },
      child: Container(
          margin: _isPressed ? EdgeInsets.only(top: widget.bulging) : const EdgeInsets.only(top: 1),
          padding: widget.padding ?? const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: widget.borderRadius,
            border: Border(
              top: BorderSide(
                width: widget.bulgingNomarl,
                color: colorBorder
              ),
              right: BorderSide(
                  width: _isPressed ? widget.bulgingNomarl :  widget.bulging / 2,
                  color: colorBorder
              ),
              bottom: BorderSide(
                width: _isPressed ? widget.bulgingNomarl : widget.bulging,
                color: colorBorder
              ),
              left: BorderSide(
                  width: widget.bulgingNomarl,
                  color: colorBorder
              ),
            ),
          ),
          child: widget.child
      ),
    );
  }
}