import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/AddNewCardPage/Body/Elements/card_main_checkbox.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/buttons.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';

import 'Elements/AddNewCardForm/add_new_card_form.dart';

class AddNewCardBody {
  TitleStyle? pageTitle;
  String? pageImage;
  AddNewCardForm? form;
  Button? addNewCardButton;
  CardMainCheckBox? cardMainCheckBox;

  AddNewCardBody({
    this.pageTitle,
    this.pageImage,
    this.form,
    this.addNewCardButton,
    this.cardMainCheckBox
  });

  factory AddNewCardBody.fromJson(Map<String, dynamic> json) => AddNewCardBody(
    pageTitle: json["PageTitle"] == null ? null : TitleStyle.fromJson(json["PageTitle"]),
    pageImage: json["PageImage"],
    form: json["Form"] == null ? null : AddNewCardForm.fromJson(json["Form"]),
    addNewCardButton: json["AddNewCardButton"] == null ? null : Button.fromJson(json["AddNewCardButton"]),
    cardMainCheckBox: json["CardMainCheckBox"] == null ? null : CardMainCheckBox.fromJson(json["CardMainCheckBox"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle?.toJson(),
    "PageImage": pageImage,
    "Form": form?.toJson(),
    "AddNewCardButton": addNewCardButton?.toJson(),
    "CardMainCheckBox": cardMainCheckBox?.toJson(),
  };
}