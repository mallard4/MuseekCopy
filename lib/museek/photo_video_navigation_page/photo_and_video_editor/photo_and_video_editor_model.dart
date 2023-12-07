import '/flutter_flow/flutter_flow_util.dart';
import 'photo_and_video_editor_widget.dart' show PhotoAndVideoEditorWidget;
import 'package:flutter/material.dart';

class PhotoAndVideoEditorModel
    extends FlutterFlowModel<PhotoAndVideoEditorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
