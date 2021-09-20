# number_stepper

A fully customizable Flutter Widget to get count. It can be applicable in e-commerce apps for getting cart count.

*This package is Forked from [AYNStepperView](https://github.com/AnsarAzees/AYNStepperView)*

![Preview](assets/preview.png)


## Arguments
  - count: int/double, the number to show
  - stepper: int/double, the number to increasing or decreasing
  - size: double, widget size
  - axis: Axis, layout direction
  - numberSize: double, number spacer, default 2
  - didChangeCount: Function, @required to set the release counter
  - activeForegroundColor: Color, text color when counter > 0
  - activeBackgroundColor: Color, background color when counter > 0
  - deActiveForegroundColor: Color, text color when counter == 0
  - deActiveBackgroundColor: Color, background color when counter == 0
  - elevation: double, display a shadow around this widget
  - shape: BoxShape,
  - radius: Radius, the borderRadius of this widget, default caculating a roundedRectAngle
  - shadowColor: Color


## Using
Create a widget to load and edit an image:
```dart
Widget _buildStepper() {
  return CartStepperInt(
               count: _counter,
               size: 30,
               activeForegroundColor: Colors.purple,
               didChangeCount: (count) {
               setState(() {
                _counter = count;
               });
             },
          );
}


```


