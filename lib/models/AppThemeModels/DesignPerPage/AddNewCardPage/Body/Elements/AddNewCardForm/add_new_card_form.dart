import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';

class AddNewCardForm {
  TitleStyle? cardNumber;
  TitleStyle? cardHolderName;
  TitleStyle? cvv;
  TitleStyle? expiryDate;

  AddNewCardForm({
    this.cardNumber,
    this.cardHolderName,
    this.cvv,
    this.expiryDate,
  });

  factory AddNewCardForm.fromJson(Map<String, dynamic> json) => AddNewCardForm(
    cardNumber: json["CardNumber"] == null ? null : TitleStyle.fromJson(json["CardNumber"]),
    cardHolderName: json["CardHolderName"] == null ? null : TitleStyle.fromJson(json["CardHolderName"]),
    cvv: json["CVV"] == null ? null : TitleStyle.fromJson(json["CVV"]),
    expiryDate: json["ExpiryDate"] == null ? null : TitleStyle.fromJson(json["ExpiryDate"]),
  );
  Map<String, dynamic> toJson() => {
    "CardNumber": cardNumber?.toJson(),
    "CardHolderName": cardHolderName?.toJson(),
    "CVV": cvv?.toJson(),
    "ExpiryDate": expiryDate?.toJson(),
  };
}