library cart_stepper;

import 'package:flutter/material.dart';

class CartStepper extends StatefulWidget {
  final int count;
  final double size;
  final double numberSize;
  final Axis axis;
  final Color? activeForegroundColor;
  final Color? activeBackgroundColor;
  final Color? deActiveForegroundColor;
  final Color? deActiveBackgroundColor;
  final void Function(int count) didChangeCount;
  final List<BoxShadow>? shadows;

  CartStepper({
    Key? key,
    this.count = 0,
    required this.didChangeCount,
    this.activeForegroundColor,
    this.activeBackgroundColor,
    this.deActiveForegroundColor,
    this.deActiveBackgroundColor,
    this.size = 50.0,
    this.axis = Axis.horizontal,
    this.numberSize = 2,
    this.shadows = const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 5.0,
      )
    ],
  }) : super(key: key);
  @override
  _CartStepperState createState() => _CartStepperState();
}

class _CartStepperState extends State<CartStepper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final afColor = widget.activeForegroundColor ?? colorScheme.onPrimary;
    final abColor = widget.activeBackgroundColor ?? colorScheme.primary;
    final dfColor = widget.deActiveForegroundColor ?? colorScheme.onSurface;
    final dbColor = widget.deActiveBackgroundColor ?? colorScheme.surface;

    List<Widget> childs = [
      Expanded(
        child: Container(
          child: IconButton(
            iconSize: widget.size * 0.6,
            padding: EdgeInsets.all(widget.size * 0.2),
            icon: Icon(
              Icons.add,
              color: widget.count > 0 ? afColor : dfColor,
            ),
            onPressed: () {
              widget.didChangeCount(widget.count + 1);
            },
          ),
        ),
      )
    ];
    if (widget.count > 0) {
      childs.add(Container(
        width: widget.axis == Axis.vertical
            ? widget.size
            : widget.size * widget.numberSize * .5,
        child: Center(
          child: Text(
            widget.count.toString(),
            softWrap: false,
            style: TextStyle(
              color: afColor,
              fontWeight: FontWeight.w400,
              fontFamily: "Quicksand",
              fontStyle: FontStyle.normal,
              fontSize: widget.size * 0.5,
            ),
          ),
        ),
      ));
      childs.add(Expanded(
        child: Container(
          child: IconButton(
              iconSize: widget.size * 0.6,
              padding: EdgeInsets.all(widget.size * 0.2),
              icon: Icon(
                Icons.remove,
                color: afColor,
              ),
              onPressed: () {
                if (widget.count > 0) {
                  widget.didChangeCount(widget.count - 1);
                }
              }),
        ),
      ));
    }

    double width = widget.size;
    double height = width;
    if (widget.count > 0) {
      if (widget.axis == Axis.vertical) {
        height *= 2 + widget.numberSize * .5;
      } else {
        width *= 2 + widget.numberSize * .5;
      }
    }

    return AnimatedContainer(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.size * 0.5),
        boxShadow: widget.shadows,
        color: widget.count != 0 ? abColor : dbColor,
      ),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      child: widget.axis == Axis.vertical
          ? Column(
              children: childs,
            )
          : Row(
              children: childs.reversed.toList(),
            ),
    );
  }
}
