import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/icon.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';

class AddNewCardAppBar {
  Icon? backIcon;
  TitleStyle? title;

  AddNewCardAppBar({
    this.backIcon,
    this.title,
  });

  factory AddNewCardAppBar.fromJson(Map<String, dynamic> json) => AddNewCardAppBar(
    backIcon: json["BackIcon"] == null ? null : Icon.fromJson(json["BackIcon"]),
    title: json["Title"] == null ? null : TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon?.toJson(),
    "Title": title?.toJson(),
  };
}