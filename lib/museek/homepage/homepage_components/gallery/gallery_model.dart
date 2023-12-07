import '/flutter_flow/flutter_flow_util.dart';
import 'gallery_widget.dart' show GalleryWidget;
import 'package:flutter/material.dart';

class GalleryModel extends FlutterFlowModel<GalleryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Gallery widget.
  TabController? galleryController;
  int get galleryCurrentIndex =>
      galleryController != null ? galleryController!.index : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    galleryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
