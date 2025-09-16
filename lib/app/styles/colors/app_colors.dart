import 'package:flutter/material.dart';

class AppColors {

  // Cores principais
  static const Color primary = Color(0xff2d4383);
  static const Color primaryLight = Color(0xff3a56a9);
  static const Color primaryDark = Color(0xff20305d);

  // Cores de sucesso
  static const Color success = Color(0xff27c24c);
  static const Color successLight = Color(0xff43d967);
  static const Color successDark = Color(0xff165a23); // Mais escura

  // Cores de informação
  static const Color info = Color(0xff23b7e5);
  static const Color infoLight = Color(0xff51c6ea);
  static const Color infoDark = Color(0xff0b3d5e); // Mais escura

  // Cores de aviso
  static const Color warning = Color(0xffff902b);
  static const Color warningLight = Color(0xffffab5e);
  static const Color warningDark = Color(0xffb44d00); // Mais escura

  // Cores de perigo
  static const Color danger = Color(0xfff05050);
  static const Color dangerLight = Color(0xfff47f7f);
  static const Color dangerDark = Color(0xffb71c1c); // Mais escura

  // Cores neutras
  static const Color white = Color(0xffffffff);
  static const Color gray = Color(0xff6c757d);
  static const Color grayLight = Color(0xffdde6e9);
  static const Color grayDark = Color(0xff343a40);
  static const Color light = Color(0xfff8f9fa);
  static const Color dark = Color(0xff3a3f51);
  static const Color inverse = Color(0xff131e26);
  static const Color secondary = Color(0xffffffff);

  static BoxShadow shadowSm = BoxShadow(
    color: Colors.black.withValues(alpha: 0.05),
    blurRadius: 4,
    offset: const Offset(0, 2),
  );

  static BoxShadow shadow = BoxShadow(
    color: Colors.black.withValues(alpha: 0.1),
    blurRadius: 6,
    offset: const Offset(0, 3),
  );

  static BoxShadow shadowLg = BoxShadow(
    color: Colors.black.withValues(alpha: 0.2),
    blurRadius: 12,
    offset: const Offset(0, 8),
  );

  // Cores para shimmer
  static Color highlightColor = AppColors.primary.withValues(alpha: 0.5);
  static Color baseSkeletonColor = AppColors.primaryLight.withValues(alpha: 0.3);

  // Disabled Colors
  static const Color primaryDisabled = Color(0xffa3b0cf);
  static const Color successDisabled = Color(0xffa9e2b8);
  static const Color infoDisabled = Color(0xffa6dff0);
  static const Color warningDisabled = Color(0xffffd5a2);
  static const Color dangerDisabled = Color(0xffffb3b3);
  static const Color inverseDisabled = Color(0xff7f8a93);
  static const Color grayDisabled = Color(0xffb0b9bf);
  static const Color grayLightDisabled = Color(0xffe6ebee);
  static const Color grayDarkDisabled = Color(0xff6b6f72);
  static const Color lightDisabled = Color(0xfff0f1f2);
  static const Color darkDisabled = Color(0xff565a64);

  // Hover Colors
  static const Color primaryHover = Color(0xff3a56a9);
  static const Color successHover = Color(0xff43d967);
  static const Color infoHover = Color(0xff51c6ea);
  static const Color warningHover = Color(0xffffab5e);
  static const Color dangerHover = Color(0xfff47f7f);
  static const Color inverseHover = Color(0xff2a2f37);
  static const Color grayHover = Color(0xff81888e);
  static const Color grayLightHover = Color(0xffeef1f4);
  static const Color grayDarkHover = Color(0xff484d52);
  static const Color lightHover = Color(0xfffafbfc);
  static const Color darkHover = Color(0xff4a4f5a);

  //Corresponding Transparent Color
  static const Color transparentWhite = Color(0xff000000);
  static const Color transparentGray = Color(0x006c757d);
  static const Color transparentGrayLight = Color(0x00dde6e9);
  static const Color transparentGrayDark = Color(0x00343a40);
  static const Color transparentPrimary = Color(0x002d4383);
  static const Color transparentSuccess = Color(0x0027c24c);
  static const Color transparentInfo = Color(0x0023b7e5);
  static const Color transparentWarning = Color(0x00ff902b);
  static const Color transparentDanger = Color(0x00f05050);
  static const Color transparentInverse = Color(0x00131e26);
  static const Color transparentPrimaryLight = Color(0x003a56a9);
  static const Color transparentPrimaryDark = Color(0x0020305d);
  static const Color transparentSuccessLight = Color(0x0043d967);
  static const Color transparentSuccessDark = Color(0x001e983b);
  static const Color transparentInfoLight = Color(0x0051c6ea);
  static const Color transparentInfoDark = Color(0x001797be);
  static const Color transparentWarningLight = Color(0x00ffab5e);
  static const Color transparentWarningDark = Color(0x00f77600);
  static const Color transparentDangerLight = Color(0x00f47f7f);
  static const Color transparentDangerDark = Color(0x00ec2121);
  static const Color transparentSecondary = Color(0x00ffffff);
  static const Color transparentLight = Color(0x00f8f9fa);
  static const Color transparentDark = Color(0x003a3f51);

  //Gradientes
  static const Gradient gradientPrimaryLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, primary],
  );
  static const Gradient gradientPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, dark],
  );

  static getRgbColor(Color color, double opacity){
    return color.withValues(alpha: opacity);
  }

}