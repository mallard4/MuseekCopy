import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/museek/homepage/homepage_components/home_nav_bar/home_nav_bar_widget.dart';
import 'all_chats_page_widget.dart' show AllChatsPageWidget;
import 'package:flutter/material.dart';

class AllChatsPageModel extends FlutterFlowModel<AllChatsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Home_Nav_Bar component.
  late HomeNavBarModel homeNavBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    homeNavBarModel = createModel(context, () => HomeNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    homeNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
