import 'package:flutter/material.dart';

class UrlLauncher extends StatefulWidget {
  const UrlLauncher({super.key});

  @override
  State<UrlLauncher> createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  get launchUrl => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URL Launcher"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _launchUrl("");
            },
            child: Text("web"),
          ),
          ElevatedButton(
            onPressed: () {
              _launchDial("6005133333");
            },
            child: Text("Number"),
          ),
          ElevatedButton(
            onPressed: () {
              _launchSms("+91 6005133333?body=hii!");
            },
            child: Text("message"),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchDial(String url) async {
    if (!await launchUrl(Uri.parse("tel:$url"))) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchSms(String url) async {
    if (!await launchUrl(Uri.parse("sms:$url"))) {
      throw Exception('Could not launch $url');
    }
  }
}
