// To parse this JSON data, do
//
//     final locationWidget = locationWidgetFromJson(jsonString);

import 'dart:convert';

import 'LocationWidgetElements/location_change_button.dart';
import 'LocationWidgetElements/location_icon.dart';
import 'LocationWidgetElements/location_tile.dart';

LocationWidget locationWidgetFromJson(String str) => LocationWidget.fromJson(json.decode(str));

String locationWidgetToJson(LocationWidget data) => json.encode(data.toJson());

class LocationWidget {
  LocationWidget({
    required this.locationIcon,
    required this.locationTile,
    required this.locationChangeButton,
  });

  LocationIcon locationIcon;
  LocationTile locationTile;
  LocationChangeButton locationChangeButton;

  factory LocationWidget.fromJson(Map<String, dynamic> json) => LocationWidget(
    locationIcon: LocationIcon.fromJson(json["LocationIcon"]),
    locationTile: LocationTile.fromJson(json["LocationTile"]),
    locationChangeButton: LocationChangeButton.fromJson(json["LocationChangeButton"]),
  );

  Map<String, dynamic> toJson() => {
    "LocationIcon": locationIcon.toJson(),
    "LocationTile": locationTile.toJson(),
    "LocationChangeButton": locationChangeButton.toJson(),
  };
}


