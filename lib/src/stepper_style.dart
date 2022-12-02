import 'package:flutter/material.dart';

/// Theme extension. 主题扩展，可以在主题中统一设置组件样式
class CartStepperTheme extends ThemeExtension<CartStepperTheme> {
  final CartStepperStyle? style;

  CartStepperTheme({this.style});

  static CartStepperStyle of(BuildContext context) {
    final theme = Theme.of(context);
    return theme.extension<CartStepperTheme>()?.style ??
        CartStepperStyle.fromColorScheme(theme.colorScheme);
  }

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
  final Color foregroundColor;

  /// Deactived background color 未激活状态的背景色
  final Color backgroundColor;

  /// widget shape. 组件形状
  final BoxShape shape;

  /// Border radius of shape. 形状中的圆角值
  final Radius? radius;

  /// shadow color 阴影颜色
  final Color? shadowColor;

  /// value text style 显示值的字体样式
  final TextStyle? textStyle;

  final IconThemeData iconTheme;

  final IconData? iconPlus;
  final IconData? iconMinus;

  final double buttonAspectRatio;

  final double elevation;

  const CartStepperStyle({
    this.activeForegroundColor = Colors.white,
    this.activeBackgroundColor = Colors.blue,
    this.foregroundColor = Colors.black54,
    this.backgroundColor = Colors.white,
    this.shape = BoxShape.rectangle,
    this.radius,
    this.shadowColor,
    this.textStyle,
    this.iconTheme = const IconThemeData(),
    this.iconPlus,
    this.iconMinus,
    this.buttonAspectRatio = 1,
    this.elevation = 2,
  });

  factory CartStepperStyle.fromTheme(
    ThemeData theme, {
    BoxShape shape = BoxShape.rectangle,
    Radius? radius,
    IconThemeData? iconTheme,
    IconData? iconPlus,
    IconData? iconMinus,
    double? buttonAspectRatio,
    double? elevation,
  }) {
    return CartStepperStyle.fromColorScheme(
      theme.colorScheme,
      shape: shape,
      radius: radius,
      textStyle: theme.textTheme.bodyText1,
      iconPlus: iconPlus,
      iconMinus: iconMinus,
      buttonAspectRatio: buttonAspectRatio,
      elevation: elevation,
    );
  }
  factory CartStepperStyle.fromColorScheme(
    ColorScheme colorScheme, {
    BoxShape shape = BoxShape.rectangle,
    Radius? radius,
    TextStyle? textStyle,
    IconThemeData? iconTheme,
    IconData? iconPlus,
    IconData? iconMinus,
    double? buttonAspectRatio,
    double? elevation,
  }) {
    return CartStepperStyle(
      activeForegroundColor: colorScheme.onPrimary,
      activeBackgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onSurface,
      backgroundColor: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      shape: shape,
      radius: radius,
      textStyle: textStyle,
      iconTheme: iconTheme ?? const IconThemeData(),
      iconPlus: iconPlus,
      iconMinus: iconMinus,
      elevation: elevation ?? 2,
    );
  }

  CartStepperStyle copyWith({
    Color? activeForegroundColor,
    Color? activeBackgroundColor,
    Color? foregroundColor,
    Color? backgroundColor,
    BoxShape? shape,
    Radius? radius,
    Color? shadowColor,
    TextStyle? textStyle,
    IconThemeData? iconTheme,
    IconData? iconPlus,
    IconData? iconMinus,
    double? buttonAspectRatio,
    double? elevation,
  }) {
    return CartStepperStyle(
      activeForegroundColor:
          activeForegroundColor ?? this.activeForegroundColor,
      activeBackgroundColor:
          activeBackgroundColor ?? this.activeBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shape: shape ?? this.shape,
      radius: radius ?? this.radius,
      shadowColor: shadowColor ?? this.shadowColor,
      textStyle: textStyle ?? this.textStyle,
      iconTheme: iconTheme ?? this.iconTheme,
      iconPlus: iconPlus ?? this.iconPlus,
      iconMinus: iconMinus ?? this.iconMinus,
      buttonAspectRatio: buttonAspectRatio ?? this.buttonAspectRatio,
      elevation: elevation ?? this.elevation,
    );
  }
}
