import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../main_colors.dart';

final nextButtonText = TextStyle(
  color: Colors.white,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w500,
  fontSize: 18,
);

final defaultButtonPrimaryText = TextStyle(
  color: Colors.white,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w500,
  fontSize: 16,
);

final defaultButtonPrimaryTextDisabled = defaultButtonPrimaryText.copyWith();

final defaultButtonSecondaryText =
    defaultButtonPrimaryText.copyWith(color: MainColors.cielo);

final defaultButtonSecondaryTextDisabled =
    defaultButtonSecondaryText.copyWith(color: Colors.white);

final defaultButtonGhostText = defaultButtonSecondaryText.copyWith();

final defaultButtonGhostTextDisabled =
    defaultButtonGhostText.copyWith(color: MainColors.cloudy200);

final defaultButtonLightText =
    defaultButtonPrimaryText.copyWith(color: MainColors.cloudy);

final defaultButtonLightTextDisabled =
    defaultButtonSecondaryText.copyWith(color: Colors.white);

final defaultButtonLightGhostText =
    defaultButtonGhostText.copyWith(color: MainColors.cloudy);

final defaultButtonLightGhostTextDisabled =
    defaultButtonGhostText.copyWith(color: MainColors.cloudy200);

final defaultButtonDangerText = defaultButtonPrimaryText.copyWith();

final defaultButtonDangerTextDisabled = defaultButtonDangerText.copyWith();

final defaultButtonDangerGhostText =
    defaultButtonDangerText.copyWith(color: MainColors.danger);

final defaultButtonDangerGhostTextDisabled =
    defaultButtonDangerGhostText.copyWith(color: MainColors.cloudy200);

final defaultButtonSuccessText = defaultButtonPrimaryText.copyWith();

final defaultButtonSuccessTextDisabled = defaultButtonSuccessText.copyWith();

final defaultButtonSuccessGhostText =
    defaultButtonSuccessText.copyWith(color: MainColors.success);

final defaultButtonSuccessGhostTextDisabled =
    defaultButtonSuccessGhostText.copyWith(color: MainColors.cloudy200);

const shapeButtonBlock = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(0),
  ),
);

const shapeButtonDefault = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(8),
  ),
);

const shapeButtonThelephoneOperatorWhite = RoundedRectangleBorder(
  side: BorderSide(color: MainColors.cloudy100),
  borderRadius: BorderRadius.all(
    Radius.circular(50),
  ),
);

const shapeButtonThelephoneOperatorBlue = RoundedRectangleBorder(
  side: BorderSide(color: MainColors.cielo400),
  borderRadius: BorderRadius.all(
    Radius.circular(50),
  ),
);

const shapeButtonThelephoneOperatorDanger = RoundedRectangleBorder(
  side: BorderSide(color: MainColors.danger),
  borderRadius: BorderRadius.all(
    Radius.circular(50),
  ),
);
