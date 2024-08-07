import 'package:url_launcher/url_launcher.dart';

class ShareUtil {
  static launchWhatsapp(String msg) async {
    var whatsappAndroid = Uri.parse("whatsapp://send?text=$msg");
    await launchUrl(whatsappAndroid);
  }

  static launchWhatsapp1(String msg, String mobileNumber) async {
    mobileNumber = mobileNumber.replaceAll(RegExp(r"\D"), "");
    if (mobileNumber.length > 10) {
      mobileNumber = mobileNumber.substring(mobileNumber.length - 10);
    }
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=+91$mobileNumber&text=$msg");
    await launchUrl(whatsappAndroid);
  }

  static launchEmail(String subject, String body, String emailAddress) async {
    final emailUrl =
        Uri.parse('mailto:$emailAddress?subject=$subject&body=$body');
    await launchUrl(emailUrl);
  }
}
