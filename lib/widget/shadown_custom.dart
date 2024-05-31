import 'package:flutter/material.dart';

class ShadowsCustom {
  const ShadowsCustom._();

  static final BoxShadow elevation01 = BoxShadow(
    offset: const Offset(0, 2),
    blurRadius: 4,
    color: const Color(0xFF000000).withOpacity(0.04),
  );

  static final BoxShadow elevation02 = BoxShadow(
    offset: const Offset(0, 3.2),
    blurRadius: 9.2,
    color: const Color(0xFF000000).withOpacity(0.05),
  );

  static final BoxShadow elevation03 = BoxShadow(
    offset: const Offset(0, 6.4),
    blurRadius: 16.4,
    color: const Color(0xFF000000).withOpacity(0.06),
  );

  static final BoxShadow elevation04 = BoxShadow(
    offset: const Offset(0, 6),
    blurRadius: 20,
    color: const Color(0xFF000000).withOpacity(0.13),
  );

  static final BoxShadow elevation05 = BoxShadow(
    offset: const Offset(0, 8),
    blurRadius: 33,
    color: const Color(0xFF000000).withOpacity(0.19),
  );

  static final BoxShadow elevationTabbar = BoxShadow(
    offset: const Offset(0, -2),
    blurRadius: 20,
    color: const Color(0xFF000000).withOpacity(0.09),
  );

  static final BoxShadow elevationTest = BoxShadow(
    offset: const Offset(0, -2),
    blurRadius: 20,
    color: const Color(0xFF000000).withOpacity(1),
  );
}