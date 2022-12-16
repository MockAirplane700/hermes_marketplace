import 'package:url_launcher/url_launcher.dart';


///-----------------------------------------------------------------------------
///
///     URL_LAUNCHERS FUNCTIONS
///
/// ----------------------------------------------------------------------------



///*****************************************************************************
///
/// URL LAUNCHER
///
/// ****************************************************************************
///
Future<void> launchWebSiteUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))){
    throw 'Could not launch url $url';
  }
}//end method

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

void launchEmailIntent(String mailto , String subject) {
  final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: mailto,
      query: encodeQueryParameters(<String, String>{
        'subject': subject
      })

  );

  launchUrl(emailLaunchUri);
}