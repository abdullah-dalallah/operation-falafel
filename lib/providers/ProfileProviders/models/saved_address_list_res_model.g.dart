// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_address_list_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedAddressList _$SavedAddressListFromJson(Map<String, dynamic> json) =>
    SavedAddressList(
      success: json['success'] as bool?,
      savedAddressItem: (json['savedAddressItem'] as List<dynamic>?)
          ?.map((e) => SavedAddressItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SavedAddressListToJson(SavedAddressList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'savedAddressItem': instance.savedAddressItem,
    };
