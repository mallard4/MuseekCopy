import '/flutter_flow/flutter_flow_util.dart';
import 's_m_s_verify_sign_up_widget.dart' show SMSVerifySignUpWidget;
import 'package:flutter/material.dart';

class SMSVerifySignUpModel extends FlutterFlowModel<SMSVerifySignUpWidget> {
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
