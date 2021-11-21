import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class Sidebar extends StatelessWidget {
  Future<void> signOut(BuildContext context) async {
    try {
      FirebaseAuth.instance.signOut();
      Navigator.pushNamedAndRemoveUntil(context, '/loginScreen', (r) => false);
      showToast("Logged-Out!!");
    } catch (e) {
      print(e);
    } finally {
      checkAuth();
    }
  }

  Future<void> checkAuth() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print("Signed In!!");
      } else {
        print("Signed Out!!");
      }
    } catch (e) {
      print(e);
    }
  }

  void showToast(String msg) => Fluttertoast.showToast(
        msg: msg,
        fontSize: 16,
        backgroundColor: Color(0xBF2B9A00),
        textColor: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            // accountName: Text(
            //   FirebaseAuth.instance.currentUser
            //   style:
            //       TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            // ),
            accountEmail: Text(
              FirebaseAuth.instance.currentUser.email,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://images.pexels.com/photos/4132362/pexels-photo-4132362.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/403571/pexels-photo-403571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.mail_rounded),
            title: Text('Feedback'),
            onTap: () async {
              final toEmail = "gardencentral.it@gmail.com";
              final Sub =
                  'Hey Developers!!! We find this suggestion would be helpful in the further application';
              final msg =
                  "We found this feature to be extremely helpful/ need to fix this feature.....";
              final url = 'mailto:$toEmail?subject=${Sub}&body=${msg}';
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.share_rounded),
            title: Text('Invite Friend'),
            onTap: () {
              Share.share(
                  'You can download the application with the below link');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => signOut(context),
          )
        ],
      ),
    );
  }
}
