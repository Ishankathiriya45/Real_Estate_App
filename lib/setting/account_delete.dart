import 'package:flutter/material.dart';

class AccountDeletePage extends StatefulWidget {
  const AccountDeletePage({super.key});

  @override
  State<AccountDeletePage> createState() => _AccountDeletePageState();
}

class _AccountDeletePageState extends State<AccountDeletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Delete Account Instruction'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 10,),
            Text('Delete Account', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45),),

            SizedBox(height: 20,),
            Text('Mail me one info@gmail.com', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45),)
          ],
        ),
      ),
    );
  }
}
