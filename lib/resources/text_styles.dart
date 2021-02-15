import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:flutter_authorization/resources/app_fonts.dart';

class TextStyles {
  static TextStyle common() {
    return AppFonts.sfUiDisplayRegular.copyWith(
      fontSize: 14,
      color: AppColors.textGray,
    );
  }

  static const TextStyle tabStyle = TextStyle(fontSize: 13);

  static const TextStyle tabHeaderStyle = TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold);

  static final gilroy2429DeepBlue = AppFonts.gilroy
      .copyWith(fontSize: 24, height: 1.2, color: AppColors.textDeepBlue);

  static final gilroy1822DeepBlue = AppFonts.gilroy
      .copyWith(fontSize: 18, height: 1.22, color: AppColors.textDeepBlue);

  static final sfBold1824Gray = AppFonts.sfUiDisplayBold
      .copyWith(fontSize: 18, height: 1.33, color: AppColors.textGray);

  static final sfBold1822White055 = AppFonts.sfUiDisplayBold.copyWith(
      color: Colors.white, fontSize: 18, height: 1.22, letterSpacing: 0.55);

  static final sfBold1420Primary = AppFonts.sfUiDisplayBold
      .copyWith(fontSize: 14, height: 1.42, color: AppColors.primary);

  static final sfBold1420Gray = AppFonts.sfUiDisplayBold
      .copyWith(fontSize: 14, height: 1.42, color: AppColors.textGray);

  static final sfBold1420Ghost2 = AppFonts.sfUiDisplayBold
      .copyWith(fontSize: 14, height: 1.42, color: AppColors.textGhost2);

  static final sfBold1420GrayHalfOpacity = AppFonts.sfUiDisplayBold.copyWith(
      height: 1.5, fontSize: 14, color: AppColors.textGrayHalfOpacity);

  static final sfBold1212Primary =
      AppFonts.sfUiDisplayBold.copyWith(color: AppColors.primary, fontSize: 12);

  static final sfBold1214White055 = AppFonts.sfUiDisplayBold.copyWith(
      color: Colors.white, fontSize: 12, height: 1.16, letterSpacing: 0.55);

  static final sfBold1214Primary06 = AppFonts.sfUiDisplayBold.copyWith(
      color: AppColors.primary, fontSize: 12, height: 1.16, letterSpacing: 0.6);

  static final sfBold1214DeepBlue06 = AppFonts.sfUiDisplayBold.copyWith(
      fontSize: 12, letterSpacing: 0.6, color: AppColors.textDeepBlue);

  static final sfBold1214GhostHalfOpacity06 = AppFonts.sfUiDisplayBold.copyWith(
      fontSize: 12,
      height: 1.16,
      letterSpacing: 0.6,
      color: AppColors.textGhostWithHalfOpacity);

  static final sfBold1113Black055 = AppFonts.sfUiDisplayBold
      .copyWith(fontSize: 11, height: 1.18, letterSpacing: 0.55);

  static final sfRegularGrayHalfOpacity = AppFonts.sfUiDisplayRegular
      .copyWith(color: AppColors.textGrayHalfOpacity);

  static final sfRegular1821Black =
      AppFonts.sfUiDisplayRegular.copyWith(fontSize: 18, height: 1.16);

  static final sfRegular1418Gray = AppFonts.sfUiDisplayRegular
      .copyWith(fontSize: 14, height: 1.28, color: AppColors.textGray);

  static final sfRegular1418Primary = AppFonts.sfUiDisplayRegular
      .copyWith(fontSize: 14, height: 1.28, color: AppColors.primary);

  static final sfRegular1418White = AppFonts.sfUiDisplayRegular
      .copyWith(fontSize: 14, height: 1.28, color: Colors.white);

  static final sfRegular1418Ghost2 = AppFonts.sfUiDisplayRegular
      .copyWith(fontSize: 14, height: 1.28, color: AppColors.textGhost2);

  static final sfRegular1214GhostTwo = AppFonts.sfUiDisplayRegular
      .copyWith(fontSize: 12, height: 1.16, color: AppColors.textGhost2);

  static final sfRegular1214GhostTwo06 = AppFonts.sfUiDisplayRegular.copyWith(
      fontSize: 12,
      height: 1.16,
      letterSpacing: 0.6,
      color: AppColors.textGhost2);

  static final sfRegular1214GhostSheet = AppFonts.sfUiDisplayRegular
      .copyWith(fontSize: 12, height: 1.16, color: AppColors.textGhostSheet);

  static final sfMedium1821Gray = AppFonts.sfUiDisplayMedium.copyWith(
    fontSize: 18,
    height: 1.16,
    color: AppColors.textGray,
  );

  static final sfMedium1826Primary = AppFonts.sfUiDisplayMedium.copyWith(
    fontSize: 18,
    color: AppColors.primary,
    height: 1.44,
  );

  static final faRegular1214OnBackGroundGray = AppFonts.faRegular.copyWith(
    fontSize: 12,
    height: 1.16,
    color: AppColors.onBackgroundGray,
  );
}

class TextInputFormatters {
  static TextInputFormatter fieldWithOnlyLetters =
  FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z -]'));
  static TextInputFormatter defaultField =
  FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9]'));
  static TextInputFormatter addressField =
  FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9 \.,\\,/]'));
}

class TextInputValidators {
  static const Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
}
