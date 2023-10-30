/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the WeigtTrackerUserModel type in your schema. */
class WeigtTrackerUserModel extends amplify_core.Model {
  static const classType = const _WeigtTrackerUserModelModelType();
  final String id;
  final String? _user_id;
  final amplify_core.TemporalDateTime? _save_date;
  final double? _currentWeight;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  WeigtTrackerUserModelModelIdentifier get modelIdentifier {
      return WeigtTrackerUserModelModelIdentifier(
        id: id
      );
  }
  
  String? get user_id {
    return _user_id;
  }
  
  amplify_core.TemporalDateTime? get save_date {
    return _save_date;
  }
  
  double? get currentWeight {
    return _currentWeight;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const WeigtTrackerUserModel._internal({required this.id, user_id, save_date, currentWeight, createdAt, updatedAt}): _user_id = user_id, _save_date = save_date, _currentWeight = currentWeight, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory WeigtTrackerUserModel({String? id, String? user_id, amplify_core.TemporalDateTime? save_date, double? currentWeight}) {
    return WeigtTrackerUserModel._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      user_id: user_id,
      save_date: save_date,
      currentWeight: currentWeight);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeigtTrackerUserModel &&
      id == other.id &&
      _user_id == other._user_id &&
      _save_date == other._save_date &&
      _currentWeight == other._currentWeight;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("WeigtTrackerUserModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("user_id=" + "$_user_id" + ", ");
    buffer.write("save_date=" + (_save_date != null ? _save_date!.format() : "null") + ", ");
    buffer.write("currentWeight=" + (_currentWeight != null ? _currentWeight!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  WeigtTrackerUserModel copyWith({String? user_id, amplify_core.TemporalDateTime? save_date, double? currentWeight}) {
    return WeigtTrackerUserModel._internal(
      id: id,
      user_id: user_id ?? this.user_id,
      save_date: save_date ?? this.save_date,
      currentWeight: currentWeight ?? this.currentWeight);
  }
  
  WeigtTrackerUserModel copyWithModelFieldValues({
    ModelFieldValue<String?>? user_id,
    ModelFieldValue<amplify_core.TemporalDateTime?>? save_date,
    ModelFieldValue<double?>? currentWeight
  }) {
    return WeigtTrackerUserModel._internal(
      id: id,
      user_id: user_id == null ? this.user_id : user_id.value,
      save_date: save_date == null ? this.save_date : save_date.value,
      currentWeight: currentWeight == null ? this.currentWeight : currentWeight.value
    );
  }
  
  WeigtTrackerUserModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _user_id = json['user_id'],
      _save_date = json['save_date'] != null ? amplify_core.TemporalDateTime.fromString(json['save_date']) : null,
      _currentWeight = (json['currentWeight'] as num?)?.toDouble(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'user_id': _user_id, 'save_date': _save_date?.format(), 'currentWeight': _currentWeight, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'user_id': _user_id,
    'save_date': _save_date,
    'currentWeight': _currentWeight,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<WeigtTrackerUserModelModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<WeigtTrackerUserModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USER_ID = amplify_core.QueryField(fieldName: "user_id");
  static final SAVE_DATE = amplify_core.QueryField(fieldName: "save_date");
  static final CURRENTWEIGHT = amplify_core.QueryField(fieldName: "currentWeight");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "WeigtTrackerUserModel";
    modelSchemaDefinition.pluralName = "WeigtTrackerUserModels";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeigtTrackerUserModel.USER_ID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeigtTrackerUserModel.SAVE_DATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeigtTrackerUserModel.CURRENTWEIGHT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _WeigtTrackerUserModelModelType extends amplify_core.ModelType<WeigtTrackerUserModel> {
  const _WeigtTrackerUserModelModelType();
  
  @override
  WeigtTrackerUserModel fromJson(Map<String, dynamic> jsonData) {
    return WeigtTrackerUserModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'WeigtTrackerUserModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [WeigtTrackerUserModel] in your schema.
 */
class WeigtTrackerUserModelModelIdentifier implements amplify_core.ModelIdentifier<WeigtTrackerUserModel> {
  final String id;

  /** Create an instance of WeigtTrackerUserModelModelIdentifier using [id] the primary key. */
  const WeigtTrackerUserModelModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'WeigtTrackerUserModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is WeigtTrackerUserModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}