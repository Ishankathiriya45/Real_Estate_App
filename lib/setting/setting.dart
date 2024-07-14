import 'package:estate/Navigator.dart';
import 'package:estate/autentication/login.dart';
import 'package:estate/setting/about_us.dart';
import 'package:estate/setting/account_delete.dart';
import 'package:estate/setting/logout.dart';
import 'package:estate/setting/policy.dart';
import 'package:estate/setting/term.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int index = 0;

  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting', style: TextStyle(fontSize: 20, color: Colors.white),),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown,
      ),

      body: Column(
        children: [
          SizedBox(height: 10,),

          // ListTile(
          //   leading: Container(
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.brown.shade100
          //     ),
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Icon(Icons.notification_important_outlined, size: 24,),
          //       )
          //   ),
          //   title: Text('Enabale Push Notification',),
          //   trailing: CupertinoSwitch(
          //     activeColor: Colors.brown,
          //     value: _switchValue,
          //     onChanged: (value) {
          //       setState(() {
          //         _switchValue = value;
          //       });
          //     },
          //   ),
          // ),
          // Divider(),

          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown.shade100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.category_outlined, size: 24,),
                )
            ),
            title: Text('More App',),
            trailing: Icon(Icons.arrow_right),
            onTap: () => launch('https://codecanyon.net/user/viaviwebtech/portfolio'),
          ),
          Divider(),

          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown.shade100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.offline_share, size: 24,),
                )
            ),
            title: Text('Share App',),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Share.share('Continue using complete');
            },
          ),
          Divider(),

          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown.shade100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.sim_card_alert_outlined, size: 24,),
                )
            ),
            title: Text('About Us',),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(),));
            },
          ),
          Divider(),

          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown.shade100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.find_in_page_outlined, size: 24,),
                )
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TermUsePage(),));
            },
            title: Text('Terms of Use',),
            trailing: Icon(Icons.arrow_right),
          ),
          Divider(),

          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown.shade100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.policy_outlined, size: 24,),
                )
            ),
            title: Text('Privacy Policy',),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PolicyPage(),));
            },
          ),
          Divider(),

          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown.shade100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.query_builder_rounded, size: 24,),
                )
            ),
            title: Text('Delete Account Intruction',),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AccountDeletePage(),));
            },
          ),
          Divider(),

          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown.shade100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.logout, size: 24,),
                )
            ),
            title: Text('Logout',),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              buildSheet(context);
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  void buildSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 178,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text('Logout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),),

            SizedBox(height: 20,),
            Text('Are you sure you want to logout ?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage(index: 4),));
                    },
                    child: Container(
                      height: 44,
                      width: 150,
                      alignment: Alignment.center,
                      child: Text('Cancel', style: TextStyle(fontSize: 16, color: Colors.brown),),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        overlayColor: MaterialStatePropertyAll(Colors.brown.shade100),
                        side: MaterialStatePropertyAll(BorderSide(color: Colors.brown, width: 2)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    },
                    child: Container(
                      height: 46,
                      width: 180,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text('Yes, Logout', style: TextStyle(fontSize: 16, color: Colors.white),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
