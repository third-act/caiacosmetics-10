import 'package:flutter/material.dart';

/// CAIA Cosmetics design tokens — Soft depth palette.
class AppColors {
  AppColors._();

  // Brand accent — campaign rose (60/30/10)
  static const accent = Color(0xFF996466);
  static const accentSoft = Color(0xFFE0CCC7); // blush
  static const secondaryPink = Color(0xFFF4EFEB);

  // Semantic
  static const money = Color(0xFF996466);

  // Neutral ramp — never pure #FFFFFF as page bg
  static const bg = Color(0xFFFFFCF7); // cream
  static const surface = Color(0xFFFFFFFF);
  static const surfaceRaised = Color(0xFFFFFEFC);
  static const hairline = Color(0x0F333333);
  static const ink = Color(0xFF333333);
  static const inkMuted = Color(0xFF6F6464); // hover
  static const inkFaint = Color(0xFFC5C3BD); // grey
  static const blush = Color(0xFFE0CCC7);

  // Neutral shadow — never tint with saturated brand
  static const shadow = Color(0x14333333);
}
