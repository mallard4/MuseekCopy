import '/flutter_flow/flutter_flow_util.dart';
import 'camera_homepage_widget.dart' show CameraHomepageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CameraHomepageModel extends FlutterFlowModel<CameraHomepageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Main_Control_slider widget.
  PageController? mainControlSliderController;

  int get mainControlSliderCurrentIndex =>
      mainControlSliderController != null &&
              mainControlSliderController!.hasClients &&
              mainControlSliderController!.page != null
          ? mainControlSliderController!.page!.round()
          : 0;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 2;

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
