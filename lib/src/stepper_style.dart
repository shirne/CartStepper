import 'package:flutter/material.dart';

/// Theme extension. 主题扩展，可以在主题中统一设置组件样式
class CartStepperTheme extends ThemeExtension<CartStepperTheme> {
  final CartStepperStyle? style;
  CartStepperTheme({this.style});

  @override
  ThemeExtension<CartStepperTheme> copyWith({
    CartStepperStyle? style,
  }) {
    return CartStepperTheme(style: style ?? this.style?.copyWith());
  }

  @override
  ThemeExtension<CartStepperTheme> lerp(
      ThemeExtension<CartStepperTheme>? other, double t) {
    if (other == null) return this;
    return t > 0.5 ? other : this;
  }
}

/// CartStepper Style. 组件样式
class CartStepperStyle {
  /// Actived foreground color 激活状态的前景色(文字颜色)
  final Color activeForegroundColor;

  /// Actived background color 激活状态的背景色
  final Color activeBackgroundColor;

  /// Deactived foreground color 未激活状态的前景色(文字颜色)
  final Color deActiveForegroundColor;

  /// Deactived background color 未激活状态的背景色
  final Color deActiveBackgroundColor;

  /// widget shape. 组件形状
  final BoxShape shape;

  /// Border radius of shape. 形状中的圆角值
  final Radius? radius;

  /// shadow color 阴影颜色
  final Color? shadowColor;

  /// value text style 显示值的字体样式
  final TextStyle? textStyle;

  const CartStepperStyle({
    this.activeForegroundColor = Colors.white,
    this.activeBackgroundColor = Colors.blue,
    this.deActiveForegroundColor = Colors.black54,
    this.deActiveBackgroundColor = Colors.white,
    this.shape = BoxShape.rectangle,
    this.radius,
    this.shadowColor,
    this.textStyle,
  });

  factory CartStepperStyle.fromTheme(
    ThemeData theme, {
    BoxShape shape = BoxShape.rectangle,
    Radius? radius,
    Color? shadowColor,
  }) {
    return CartStepperStyle.fromColorScheme(
      theme.colorScheme,
      shape: shape,
      radius: radius,
    );
  }
  factory CartStepperStyle.fromColorScheme(
    ColorScheme colorScheme, {
    BoxShape shape = BoxShape.rectangle,
    Radius? radius,
  }) {
    return CartStepperStyle(
      activeForegroundColor: colorScheme.onPrimary,
      activeBackgroundColor: colorScheme.primary,
      deActiveForegroundColor: colorScheme.onSurface,
      deActiveBackgroundColor: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      shape: shape,
      radius: radius,
    );
  }

  CartStepperStyle copyWith({
    Color? activeForegroundColor,
    Color? activeBackgroundColor,
    Color? deActiveForegroundColor,
    Color? deActiveBackgroundColor,
    BoxShape? shape,
    Radius? radius,
    Color? shadowColor,
    TextStyle? textStyle,
  }) {
    return CartStepperStyle(
      activeForegroundColor:
          activeForegroundColor ?? this.activeForegroundColor,
      activeBackgroundColor:
          activeBackgroundColor ?? this.activeBackgroundColor,
      deActiveForegroundColor:
          deActiveForegroundColor ?? this.deActiveForegroundColor,
      deActiveBackgroundColor:
          deActiveBackgroundColor ?? this.deActiveBackgroundColor,
      shape: shape ?? this.shape,
      radius: radius ?? this.radius,
      shadowColor: shadowColor ?? this.shadowColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}
