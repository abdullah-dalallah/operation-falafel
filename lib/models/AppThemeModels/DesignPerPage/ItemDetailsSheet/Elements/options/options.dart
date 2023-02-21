// To parse this JSON data, do
//
//     final options = optionsFromJson(jsonString);

import 'dart:convert';

import '../../../CommonElements/Elements/menu_checkbox.dart';
import '../../../CommonElements/Elements/title_style.dart';

Options optionsFromJson(String str) => Options.fromJson(json.decode(str));

String optionsToJson(Options data) => json.encode(data.toJson());

class Options {
  Options({
    required this.title,
    required this.checkBox,
  });

  TitleStyle title;
  MenuCheckBox checkBox;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    title: TitleStyle.fromJson(json["Title"]),
    checkBox: MenuCheckBox.fromJson(json["CheckBox"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "CheckBox": checkBox.toJson(),
  };
}




