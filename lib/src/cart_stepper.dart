library cart_stepper;

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'stepper_style.dart';

const _textStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontFamily: "Quicksand",
  fontStyle: FontStyle.normal,
);

/// Cart stepper widget
class CartStepper<VM extends num> extends StatefulWidget {
  const CartStepper({
    Key? key,

    /// value
    VM? value,
    @Deprecated('use value instead') VM? count,

    /// step value
    VM? stepper,
    required this.didChangeCount,
    this.size = 30.0,
    this.axis = Axis.horizontal,
    this.numberSize = 2,
    this.elevation,
    this.style,
  })  : _value = (value ?? count ?? 0) as VM,
        _stepper = (stepper ?? 1) as VM,
        super(key: key);

  final VM _value;

  final VM _stepper;

  /// size of the stepper button,normally it's min(with,height)
  final double size;

  /// number length of the value
  final double numberSize;

  /// widget direction
  final Axis axis;

  /// value callback
  final ValueChanged<VM> didChangeCount;

  /// elevation of [PhysicalModel]
  final double? elevation;

  /// widget style
  final CartStepperStyle? style;

  @override
  State<CartStepper<VM>> createState() => _CartStepperState<VM>();
}

class _CartStepperState<VM extends num> extends State<CartStepper<VM>> {
  bool _editMode = false;
  String lastText = '';
  late final TextEditingController _controller;
  late final FocusNode _focusNode = FocusNode()
    ..addListener(() {
      if (_editMode && !_focusNode.hasFocus) {
        setState(() {
          _editMode = false;
        });
      }
    });

  num defaultValue = 0;

  @override
  void initState() {
    super.initState();
    lastText = widget._value.toString();
    _controller = TextEditingController(text: lastText);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  VM? parseValue(String text) {
    if (text.isEmpty) return 0 as VM;
    double? value = double.tryParse(text);
    if (value == null) return null;
    if (value is VM) return value as VM;
    return value.toInt() as VM;
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? CartStepperTheme.of(context);

    final isExpanded = _editMode || widget._value > 0;

    List<Widget> childs = [
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Feedback.forTap(context);
          if (_editMode) {
            setState(() {
              _editMode = false;
            });
          }
          widget.didChangeCount((widget._value + widget._stepper) as VM);
        },
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: Center(
            child: Icon(
              Icons.add,
              size: widget.size,
              color: isExpanded
                  ? style.activeForegroundColor
                  : style.deActiveForegroundColor,
            ),
          ),
        ),
      ),
    ];
    if (isExpanded) {
      childs.add(
        GestureDetector(
          onTap: () {
            setState(() {
              lastText = widget._value.toString();
              _controller.text = lastText;
              _editMode = !_editMode;
              _focusNode.requestFocus();
            });
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            alignment: Alignment.center,
            width: widget.axis == Axis.vertical
                ? widget.size
                : widget.size * widget.numberSize * .5,
            child: _editMode
                ? EditableText(
                    controller: _controller,
                    focusNode: _focusNode,
                    textAlign: TextAlign.center,
                    style: _textStyle.merge(style.textStyle).copyWith(
                          color: style.activeForegroundColor,
                          fontSize: widget.size * 0.5,
                        ),
                    cursorColor: style.activeForegroundColor,
                    backgroundCursorColor: style.activeBackgroundColor,
                    onEditingComplete: () {
                      setState(() {
                        _editMode = false;
                      });
                    },
                    onChanged: (String value) {
                      VM? newValue = parseValue(_controller.text);
                      if (newValue == null) {
                        _controller.text = lastText;
                        _controller.selection =
                            TextSelection.collapsed(offset: lastText.length);
                      } else {
                        lastText = value;
                        widget.didChangeCount(newValue);
                      }
                    },
                  )
                : Text(
                    widget._value.toString(),
                    softWrap: false,
                    style: _textStyle.merge(style.textStyle).copyWith(
                          color: style.activeForegroundColor,
                          fontSize: widget.size * 0.5,
                        ),
                  ),
          ),
        ),
      );
      childs.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Feedback.forTap(context);
            if (_editMode) {
              setState(() {
                _editMode = false;
              });
            }
            if (widget._value > 0) {
              widget.didChangeCount(math.max(
                  (widget._value - widget._stepper),
                  VM is int
                      ? defaultValue.toInt()
                      : defaultValue.toDouble()) as VM);
            }
          },
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: Center(
              child: Icon(
                Icons.remove,
                size: widget.size * 0.6,
                color: style.activeForegroundColor,
              ),
            ),
          ),
        ),
      );
    }

    return AnimatedPhysicalModel(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      shape: style.shape,
      borderRadius: BorderRadius.all(
        style.radius ?? Radius.circular(widget.size),
      ),
      shadowColor: style.shadowColor ?? const Color.fromARGB(255, 0, 0, 0),
      color: isExpanded
          ? style.activeBackgroundColor
          : style.deActiveBackgroundColor,
      elevation: widget.elevation ?? style.elevation,
      child: widget.axis == Axis.vertical
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: childs,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: childs.reversed.toList(),
            ),
    );
  }
}

typedef CartStepperInt = CartStepper<int>;
typedef CartStepperDouble = CartStepper<double>;
