import '/components/note_dot_component/note_dot_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_note_selector_component_widget.dart'
    show NewNoteSelectorComponentWidget;
import 'package:flutter/material.dart';

class NewNoteSelectorComponentModel
    extends FlutterFlowModel<NewNoteSelectorComponentWidget> {
  ///  Local state fields for this component.

  bool isNewNoteDotsVisible = false;

  bool isDotsDisabled = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for NoteDot1Component.
  late NoteDotComponentModel noteDot1ComponentModel;
  // Model for NoteDot2Component.
  late NoteDotComponentModel noteDot2ComponentModel;
  // Model for NoteDot3Component.
  late NoteDotComponentModel noteDot3ComponentModel;
  // Model for NoteDot4Component.
  late NoteDotComponentModel noteDot4ComponentModel;
  // Model for NoteDot5Component.
  late NoteDotComponentModel noteDot5ComponentModel;

  @override
  void initState(BuildContext context) {
    noteDot1ComponentModel =
        createModel(context, () => NoteDotComponentModel());
    noteDot2ComponentModel =
        createModel(context, () => NoteDotComponentModel());
    noteDot3ComponentModel =
        createModel(context, () => NoteDotComponentModel());
    noteDot4ComponentModel =
        createModel(context, () => NoteDotComponentModel());
    noteDot5ComponentModel =
        createModel(context, () => NoteDotComponentModel());
  }

  @override
  void dispose() {
    noteDot1ComponentModel.dispose();
    noteDot2ComponentModel.dispose();
    noteDot3ComponentModel.dispose();
    noteDot4ComponentModel.dispose();
    noteDot5ComponentModel.dispose();
  }
}
