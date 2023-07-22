

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/buttons.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/icon.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';

class MethodCheckBox {
  CheckBoxDesgin? checkBoxDesgin;
  String? data;
  String? color;
  SelectedCard? selectedCard;
  SelectedPoint? selectedPoint;

  MethodCheckBox({
    this.checkBoxDesgin,
    this.data,
    this.color,
    this.selectedCard,
    this.selectedPoint,
  });

  factory MethodCheckBox.fromJson(Map<String, dynamic> json) => MethodCheckBox(
    checkBoxDesgin: json["CheckBoxDesgin"] == null ? null : CheckBoxDesgin.fromJson(json["CheckBoxDesgin"]),
    data: json["Data"],
    color: json["Color"],
    selectedCard: json["SelectedCard"] == null ? null : SelectedCard.fromJson(json["SelectedCard"]),
    selectedPoint: json["SelectedPoint"] == null ? null : SelectedPoint.fromJson(json["SelectedPoint"]),
  );

  Map<String, dynamic> toJson() => {
    "CheckBoxDesgin": checkBoxDesgin?.toJson(),
    "Data": data,
    "Color": color,
    "SelectedCard": selectedCard?.toJson(),
    "SelectedPoint": selectedPoint?.toJson(),
  };
}

class CheckBoxDesgin {
  String? color;
  String? selectedColor;
  String? selectedImage;

  CheckBoxDesgin({
    this.color,
    this.selectedColor,
    this.selectedImage,
  });

  factory CheckBoxDesgin.fromJson(Map<String, dynamic> json) => CheckBoxDesgin(
    color: json["Color"],
    selectedColor: json["SelectedColor"],
    selectedImage: json["SelectedImage"],
  );

  Map<String, dynamic> toJson() => {
    "Color": color,
    "SelectedColor": selectedColor,
    "SelectedImage": selectedImage,
  };
}

class SelectedCard {
  TitleStyle? title;
  TitleStyle? subTitle;
  Button? changeButton;
  Button? addNewCardButton;

  SelectedCard({
    this.title,
    this.subTitle,
    this.changeButton,
    this.addNewCardButton,
  });

  factory SelectedCard.fromJson(Map<String, dynamic> json) => SelectedCard(
    title: json["Title"] == null ? null : TitleStyle.fromJson(json["Title"]),
    subTitle: json["SubTitle"] == null ? null : TitleStyle.fromJson(json["SubTitle"]),
    changeButton: json["ChangeButton"] == null ? null : Button.fromJson(json["ChangeButton"]),
    addNewCardButton: json["AddNewCardButton"] == null ? null : Button.fromJson(json["AddNewCardButton"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title?.toJson(),
    "SubTitle": subTitle?.toJson(),
    "ChangeButton": changeButton?.toJson(),
    "AddNewCardButton": addNewCardButton?.toJson(),
  };
}

class SelectedPoint {
  Icon? minusArrow;
  Icon? plusArrow;
  TitleStyle? selectedPriceOfDiscount;
  TitleStyle? selectedAmountOfPoints;
  Button? fullPointButton;
  SliderDesign? sliderDesign;

  SelectedPoint({
    this.minusArrow,
    this.plusArrow,
    this.selectedPriceOfDiscount,
    this.selectedAmountOfPoints,
    this.fullPointButton,
    this.sliderDesign,
  });

  factory SelectedPoint.fromJson(Map<String, dynamic> json) => SelectedPoint(
    minusArrow: json["MinusArrow"] == null ? null : Icon.fromJson(json["MinusArrow"]),
    plusArrow: json["PlusArrow"] == null ? null : Icon.fromJson(json["PlusArrow"]),
    selectedPriceOfDiscount: json["SelectedPriceOfDiscount"] == null ? null : TitleStyle.fromJson(json["SelectedPriceOfDiscount"]),
    selectedAmountOfPoints: json["SelectedAmountOfPoints"] == null ? null : TitleStyle.fromJson(json["SelectedAmountOfPoints"]),
    fullPointButton: json["FullPointButton"] == null ? null : Button.fromJson(json["FullPointButton"]),
    sliderDesign: json["SliderDesign"] == null ? null : SliderDesign.fromJson(json["SliderDesign"]),
  );

  Map<String, dynamic> toJson() => {
    "MinusArrow": minusArrow,
    "PlusArrow": plusArrow,
    "SelectedPriceOfDiscount": selectedPriceOfDiscount?.toJson(),
    "SelectedAmountOfPoints": selectedAmountOfPoints?.toJson(),
    "FullPointButton": fullPointButton?.toJson(),
    "SliderDesign": sliderDesign?.toJson(),
  };
}

class SliderDesign {
  String? sliderBackGroundColor;
  TitleStyle? minPtsTitle;
  TitleStyle? maxPtsTitle;
  String? acitveTrackColor;
  String? inAcitveTrackColor;
  SliderThumCircle? sliderThumCircle;

  SliderDesign({
    this.sliderBackGroundColor,
    this.minPtsTitle,
    this.maxPtsTitle,
    this.acitveTrackColor,
    this.inAcitveTrackColor,
    this.sliderThumCircle,
  });

  factory SliderDesign.fromJson(Map<String, dynamic> json) => SliderDesign(
    sliderBackGroundColor: json["SliderBackGroundColor"],
    minPtsTitle: json["MinPtsTitle"] == null ? null : TitleStyle.fromJson(json["MinPtsTitle"]),
    maxPtsTitle: json["MaxPtsTitle"] == null ? null : TitleStyle.fromJson(json["MaxPtsTitle"]),
    acitveTrackColor: json["AcitveTrackColor"],
    inAcitveTrackColor: json["InAcitveTrackColor"],
    sliderThumCircle: json["SliderThumCircle"] == null ? null : SliderThumCircle.fromJson(json["SliderThumCircle"]),
  );

  Map<String, dynamic> toJson() => {
    "SliderBackGroundColor":sliderBackGroundColor,
    "MinPtsTitle": minPtsTitle?.toJson(),
    "MaxPtsTitle": maxPtsTitle?.toJson(),
    "AcitveTrackColor": acitveTrackColor,
    "InAcitveTrackColor": inAcitveTrackColor,
    "SliderThumCircle": sliderThumCircle?.toJson(),
  };
}

class SliderThumCircle {
  String? circleColor;
  TitleStyle? circleTitle;
  bool? circleTitleVisibility;

  SliderThumCircle({
    this.circleColor,
    this.circleTitle,
    this.circleTitleVisibility,
  });

  factory SliderThumCircle.fromJson(Map<String, dynamic> json) => SliderThumCircle(
    circleColor: json["CircleColor"],
    circleTitle: json["CircleTitle"] == null ? null : TitleStyle.fromJson(json["CircleTitle"]),
    circleTitleVisibility: json["CircleTitleVisibility"],
  );

  Map<String, dynamic> toJson() => {
    "CircleColor": circleColor,
    "CircleTitle": circleTitle?.toJson(),
    "CircleTitleVisibility": circleTitleVisibility,
  };
}