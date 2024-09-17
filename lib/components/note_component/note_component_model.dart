import '/backend/schema/structs/index.dart';
import '/components/circle_button_component/circle_button_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'note_component_widget.dart' show NoteComponentWidget;
import 'package:flutter/material.dart';

class NoteComponentModel extends FlutterFlowModel<NoteComponentWidget> {
  ///  Local state fields for this component.

  bool isEditMode = false;

  NoteStruct? note;
  void updateNoteStruct(Function(NoteStruct) updateFn) {
    updateFn(note ??= NoteStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for NoteDescriptionTextField widget.
  FocusNode? noteDescriptionTextFieldFocusNode;
  TextEditingController? noteDescriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      noteDescriptionTextFieldTextControllerValidator;
  // Model for EditButton.
  late CircleButtonComponentModel editButtonModel;
  // Model for UpdateButton.
  late CircleButtonComponentModel updateButtonModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {
    editButtonModel = createModel(context, () => CircleButtonComponentModel());
    updateButtonModel =
        createModel(context, () => CircleButtonComponentModel());
  }

  @override
  void dispose() {
    noteDescriptionTextFieldFocusNode?.dispose();
    noteDescriptionTextFieldTextController?.dispose();

    editButtonModel.dispose();
    updateButtonModel.dispose();
  }
}
