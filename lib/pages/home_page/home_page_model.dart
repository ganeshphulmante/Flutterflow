import '/components/new_note_selector_component/new_note_selector_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NewNoteSelectorComponent component.
  late NewNoteSelectorComponentModel newNoteSelectorComponentModel;

  @override
  void initState(BuildContext context) {
    newNoteSelectorComponentModel =
        createModel(context, () => NewNoteSelectorComponentModel());
  }

  @override
  void dispose() {
    newNoteSelectorComponentModel.dispose();
  }
}
