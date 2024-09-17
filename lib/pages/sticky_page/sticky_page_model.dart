import '/backend/schema/structs/index.dart';
import '/components/note_component/note_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sticky_page_widget.dart' show StickyPageWidget;
import 'package:flutter/material.dart';

class StickyPageModel extends FlutterFlowModel<StickyPageWidget> {
  ///  Local state fields for this page.

  NoteStruct? note;
  void updateNoteStruct(Function(NoteStruct) updateFn) {
    updateFn(note ??= NoteStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for NoteComponent component.
  late NoteComponentModel noteComponentModel;

  @override
  void initState(BuildContext context) {
    noteComponentModel = createModel(context, () => NoteComponentModel());
  }

  @override
  void dispose() {
    noteComponentModel.dispose();
  }
}
