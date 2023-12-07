import '/flutter_flow/flutter_flow_util.dart';
import 's_m_s_verify_login_widget.dart' show SMSVerifyLoginWidget;
import 'package:flutter/material.dart';

class SMSVerifyLoginModel extends FlutterFlowModel<SMSVerifyLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
