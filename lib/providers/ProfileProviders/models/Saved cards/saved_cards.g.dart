// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedCards _$SavedCardsFromJson(Map<String, dynamic> json) => SavedCards(
      success: json['success'] as bool?,
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => CardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SavedCardsToJson(SavedCards instance) =>
    <String, dynamic>{
      'success': instance.success,
      'body': instance.body,
    };
