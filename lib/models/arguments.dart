import 'package:pp_28/widgets/screens/agreement.dart';

class AgreementViewArguments {
  final AgreementType agreementType;
  final bool usePrivacyAgreement;
  AgreementViewArguments({
    required this.agreementType,
    this.usePrivacyAgreement = false,
  });
}
