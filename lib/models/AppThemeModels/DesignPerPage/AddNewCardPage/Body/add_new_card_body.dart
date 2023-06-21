import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/buttons.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';

import 'Elements/AddNewCardForm/add_new_card_form.dart';

class AddNewCardBody {
  TitleStyle? pageTitle;
  String? pageImage;
  AddNewCardForm? form;
  Button? addNewCardButton;

  AddNewCardBody({
    this.pageTitle,
    this.pageImage,
    this.form,
    this.addNewCardButton,
  });

  factory AddNewCardBody.fromJson(Map<String, dynamic> json) => AddNewCardBody(
    pageTitle: json["PageTitle"] == null ? null : TitleStyle.fromJson(json["PageTitle"]),
    pageImage: json["PageImage"],
    form: json["Form"] == null ? null : AddNewCardForm.fromJson(json["Form"]),
    addNewCardButton: json["AddNewCardButton"] == null ? null : Button.fromJson(json["AddNewCardButton"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle?.toJson(),
    "PageImage": pageImage,
    "Form": form?.toJson(),
    "AddNewCardButton": addNewCardButton?.toJson(),
  };
}