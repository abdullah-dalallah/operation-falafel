import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/buttons.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/image_icon.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';

class OFGifts {
  BorderLabel? borderLabel;
  TitleStyle? title;
  TitleStyle? subTitle;
  Button? chooseButton;
  SelectedVoucher? selectedVoucher;

  OFGifts({
    this.borderLabel,
    this.title,
    this.subTitle,
    this.chooseButton,
    this.selectedVoucher,
  });

  factory OFGifts.fromJson(Map<String, dynamic> json) => OFGifts(
    borderLabel: json["BorderLabel"] == null ? null : BorderLabel.fromJson(json["BorderLabel"]),
    title: json["Title"] == null ? null : TitleStyle.fromJson(json["Title"]),
    subTitle: json["SubTitle"] == null ? null : TitleStyle.fromJson(json["SubTitle"]),
    chooseButton: json["ChooseButton"] == null ? null : Button.fromJson(json["ChooseButton"]),
    selectedVoucher: json["SelectedVoucher"] == null ? null : SelectedVoucher.fromJson(json["SelectedVoucher"]),
  );

  Map<String, dynamic> toJson() => {
    "BorderLabel": borderLabel?.toJson(),
    "Title": title?.toJson(),
    "SubTitle": subTitle?.toJson(),
    "ChooseButton": chooseButton?.toJson(),
    "SelectedVoucher": selectedVoucher?.toJson(),
  };
}

class BorderLabel {
  ImageIcon? giftIcon;
  TitleStyle? labelTitle;

  BorderLabel({
    this.giftIcon,
    this.labelTitle,
  });

  factory BorderLabel.fromJson(Map<String, dynamic> json) => BorderLabel(
    giftIcon: json["GiftIcon"] == null ? null : ImageIcon.fromJson(json["GiftIcon"]),
    labelTitle: json["LabelTitle"] == null ? null : TitleStyle.fromJson(json["LabelTitle"]),
  );

  Map<String, dynamic> toJson() => {
    "GiftIcon": giftIcon?.toJson(),
    "LabelTitle": labelTitle?.toJson(),
  };
}

class SelectedVoucher {
  TitleStyle? title;
  Button? removeButton;
  VoucherDetailsList? voucherDetailsList;

  SelectedVoucher({
    this.title,
    this.removeButton,
    this.voucherDetailsList,
  });

  factory SelectedVoucher.fromJson(Map<String, dynamic> json) => SelectedVoucher(
    title: json["Title"] == null ? null : TitleStyle.fromJson(json["Title"]),
    removeButton: json["RemoveButton"] == null ? null : Button.fromJson(json["RemoveButton"]),
    voucherDetailsList: json["VoucherDetailsList"] == null ? null : VoucherDetailsList.fromJson(json["VoucherDetailsList"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title?.toJson(),
    "RemoveButton": removeButton?.toJson(),
    "VoucherDetailsList": voucherDetailsList?.toJson(),
  };
}

class VoucherDetailsList {
  TitleStyle? title;
  ImageIcon? icon;

  VoucherDetailsList({
    this.title,
    this.icon,
  });

  factory VoucherDetailsList.fromJson(Map<String, dynamic> json) => VoucherDetailsList(
    title: json["Title"] == null ? null : TitleStyle.fromJson(json["Title"]),
    icon: json["Icon"] == null ? null : ImageIcon.fromJson(json["Icon"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title?.toJson(),
    "Icon": icon?.toJson(),
  };
}
