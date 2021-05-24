import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        //foto profile
        Padding(
            padding: EdgeInsets.only(top: 8, bottom: 20),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://media-exp1.licdn.com/dms/image/D5635AQHXNPRrEpWcCQ/profile-framedphoto-shrink_400_400/0/1621341193537?e=1621936800&v=beta&t=YRpgNcrTzL_0kSopAsneU74TMepg4tqF5b8cHMTjIE0"),
            )),
        _items(icon: FaIcon(Icons.person), label: "Saepul anwar"),
        _items(icon: FaIcon(Icons.email), label: "adm.ipul@gmail.com"),
        _items(
            icon: FaIcon(FontAwesomeIcons.linkedin),
            label: "Saepul anwar",
            ontap: () {
              _launchURL("https://www.linkedin.com/in/saepul-anwar-b15a6916a");
            }),
        _items(
            icon: FaIcon(FontAwesomeIcons.github),
            label: "@Saepulawr",
            ontap: () {
              _launchURL("https://github.com/Saepulawr");
            }),
      ],
    ));
  }

  Widget _items({required FaIcon? icon, required String label, ontap()?}) {
    return Card(
      child: ListTile(
        onTap: ontap,
        leading: icon,
        title: Text(label),
        trailing: ontap != null ? Icon(Icons.arrow_right) : null,
      ),
    );
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
