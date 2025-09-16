part of 'app_theme.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final ExtendedColor success;
  final ExtendedColor purple;
  final ExtendedColor pink;
  final ExtendedColor coldLight;
  final ExtendedColor fire;
  final ExtendedColor info;
  final ExtendedColor neutralDark;

  CustomThemeExtension({
    required this.success,
    required this.info,
    required this.neutralDark,
    required this.purple,
    required this.pink,
    required this.coldLight,
    required this.fire
  });

  @override
  CustomThemeExtension copyWith({
    ExtendedColor? success,
    ExtendedColor? info,
    ExtendedColor? neutralDark,
    ExtendedColor? purple,
    ExtendedColor? pink,
    ExtendedColor? coldLight,
    ExtendedColor? fire
  }) {
    return CustomThemeExtension(
      success: success ?? this.success,
      purple: purple ?? this.purple,
      pink: pink ?? this.pink,
      coldLight: coldLight ?? this.coldLight,
      fire: fire ?? this.fire,
      info: info ?? this.info,
      neutralDark: neutralDark ?? this.neutralDark,
    );
  }

  CustomColors _resolveColors(Brightness brightness) => (
    success: success.resolve(brightness),
    info: info.resolve(brightness),
    neutralDark: neutralDark.resolve(brightness),
  );

  CustomColors resolveWithContext(BuildContext context) =>
      _resolveColors(Theme.of(context).brightness);

  @override
  CustomThemeExtension lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      purple: other.purple,
      pink: other.pink,
      coldLight: other.coldLight,
      fire: other.fire,
      success: other.success,
      info: other.info,
      neutralDark: other.neutralDark,
    );
  }
}
