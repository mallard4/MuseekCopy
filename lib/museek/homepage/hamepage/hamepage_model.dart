import '/flutter_flow/flutter_flow_util.dart';
import '/museek/homepage/homepage_components/gallery/gallery_widget.dart';
import '/museek/homepage/homepage_components/home_nav_bar/home_nav_bar_widget.dart';
import 'hamepage_widget.dart' show HamepageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HamepageModel extends FlutterFlowModel<HamepageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for Home_Nav_Bar component.
  late HomeNavBarModel homeNavBarModel;
  // Model for Gallery component.
  late GalleryModel galleryModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    homeNavBarModel = createModel(context, () => HomeNavBarModel());
    galleryModel = createModel(context, () => GalleryModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    homeNavBarModel.dispose();
    galleryModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
