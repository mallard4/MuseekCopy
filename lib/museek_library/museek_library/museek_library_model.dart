import '/flutter_flow/flutter_flow_util.dart';
import '/museek/homepage/homepage_components/home_nav_bar/home_nav_bar_widget.dart';
import '/museek_library/audio_control_panel/audio_control_panel_widget.dart';
import 'museek_library_widget.dart' show MuseekLibraryWidget;
import 'package:flutter/material.dart';

class MuseekLibraryModel extends FlutterFlowModel<MuseekLibraryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Main_Tab_Selection widget.
  TabController? mainTabSelectionController;
  int get mainTabSelectionCurrentIndex => mainTabSelectionController != null
      ? mainTabSelectionController!.index
      : 0;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for AudioControlPanel component.
  late AudioControlPanelModel audioControlPanelModel;
  // Model for Home_Nav_Bar component.
  late HomeNavBarModel homeNavBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    audioControlPanelModel =
        createModel(context, () => AudioControlPanelModel());
    homeNavBarModel = createModel(context, () => HomeNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainTabSelectionController?.dispose();
    audioControlPanelModel.dispose();
    homeNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
