import 'package:flutter/material.dart';

class TermUsePage extends StatefulWidget {
  const TermUsePage({super.key});

  @override
  State<TermUsePage> createState() => _TermUsePageState();
}

class _TermUsePageState extends State<TermUsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Terms Of Use'),
      ),
      
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text('Use of this site is provided by Demos subject to the following Terms and Conditions:',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('1. Your use constitutes acceptance of these Terms and Conditions as at the date of your first use of the site.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('2. Demos reserves the rights to change these Terms and Conditions at any time by posting changes online. Your continued use of this site after changes are posted constitutes your acceptance of this agreement as modified.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('3. You agree to use this site only for lawful purposes, and in a manner which does not infringe the rights, or restrict, or inhibit the use and enjoyment of the site by any third party.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('4. This site and the information, names, images, pictures, logos regarding or relating to Demos are provided “as is” without any representation or endorsement made and without warranty of any kind whether express or implied. In no event will Demos be liable for any damages including, without limitation, indirect or consequential damages, or any damages whatsoever arising from the use or in connection with such use or loss of use of the site, whether in contract or in negligence.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('5. Demos does not warrant that the functions contained in the material contained in this site will be uninterrupted or error free, that defects will be corrected, or that this site or the server that makes it available are free of viruses or bugs or represents the full functionality, accuracy and reliability of the materials.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('6. Copyright restrictions: please refer to our Creative Commons license terms governing the use of material on this site.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('7. Demos takes no responsibility for the content of external Internet Sites.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('8. Any communication or material that you transmit to, or post on, any public area of the site including any data, questions, comments, suggestions, or the like, is, and will be treated as, non-confidential and non-proprietary information.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('9. If there is any conflict between these Terms and Conditions and rules and/or specific terms of use appearing on this site relating to specific material then the latter shall prevail.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('10. These terms and conditions shall be governed and construed in accordance with the laws of England and Wales. Any disputes shall be subject to the exclusive jurisdiction of the Courts of England and Wales.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text('11. If these Terms and Conditions are not accepted in full, the use of this site must be terminated immediately.',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45, fontSize: 15),),
            ),
          ],
        ),
      ),
    );
  }
}
