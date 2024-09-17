// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteStruct extends BaseStruct {
  NoteStruct({
    String? description,
    Color? colour,
    DateTime? createDate,
    bool? isNew,
  })  : _description = description,
        _colour = colour,
        _createDate = createDate,
        _isNew = isNew;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "Colour" field.
  Color? _colour;
  Color? get colour => _colour;
  set colour(Color? val) => _colour = val;

  bool hasColour() => _colour != null;

  // "CreateDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  set createDate(DateTime? val) => _createDate = val;

  bool hasCreateDate() => _createDate != null;

  // "IsNew" field.
  bool? _isNew;
  bool get isNew => _isNew ?? false;
  set isNew(bool? val) => _isNew = val;

  bool hasIsNew() => _isNew != null;

  static NoteStruct fromMap(Map<String, dynamic> data) => NoteStruct(
        description: data['Description'] as String?,
        colour: getSchemaColor(data['Colour']),
        createDate: data['CreateDate'] as DateTime?,
        isNew: data['IsNew'] as bool?,
      );

  static NoteStruct? maybeFromMap(dynamic data) =>
      data is Map ? NoteStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Description': _description,
        'Colour': _colour,
        'CreateDate': _createDate,
        'IsNew': _isNew,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'Colour': serializeParam(
          _colour,
          ParamType.Color,
        ),
        'CreateDate': serializeParam(
          _createDate,
          ParamType.DateTime,
        ),
        'IsNew': serializeParam(
          _isNew,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NoteStruct fromSerializableMap(Map<String, dynamic> data) =>
      NoteStruct(
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        colour: deserializeParam(
          data['Colour'],
          ParamType.Color,
          false,
        ),
        createDate: deserializeParam(
          data['CreateDate'],
          ParamType.DateTime,
          false,
        ),
        isNew: deserializeParam(
          data['IsNew'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NoteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NoteStruct &&
        description == other.description &&
        colour == other.colour &&
        createDate == other.createDate &&
        isNew == other.isNew;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([description, colour, createDate, isNew]);
}

NoteStruct createNoteStruct({
  String? description,
  Color? colour,
  DateTime? createDate,
  bool? isNew,
}) =>
    NoteStruct(
      description: description,
      colour: colour,
      createDate: createDate,
      isNew: isNew,
    );
