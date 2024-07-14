import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('About Us'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 1, color: Colors.brown)]
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage('assets/images/logo_icon.png'),
                          ),
                          SizedBox(width: 10,),
                          Text('Real Estate', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.brown)]
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.brown.shade100,
                            child: Icon(Icons.report_gmailerrorred_outlined, color: Colors.brown,),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('App Version', style: TextStyle(fontSize: 16),),
                              SizedBox(height: 4,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade400
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6, right: 6, top: 1, bottom: 1),
                                  child: Text('1.0.0', style: TextStyle(fontSize: 15),),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.brown)]
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.brown.shade100,
                            child: Icon(Icons.corporate_fare_outlined, color: Colors.brown,),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Company', style: TextStyle(fontSize: 16),),
                              SizedBox(height: 4,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade400
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6, right: 6, top: 1, bottom: 1),
                                  child: Text('Viavi Wentech', style: TextStyle(fontSize: 15),),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.brown)]
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.brown.shade100,
                            child: Icon(Icons.email_outlined, color: Colors.brown,),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email', style: TextStyle(fontSize: 16),),
                              SizedBox(height: 4,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade400
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6, right: 6, top: 1, bottom: 1),
                                  child: Text('info@viavilab.com', style: TextStyle(fontSize: 15),),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.brown)]
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.brown.shade100,
                            child: Icon(Icons.language_outlined, color: Colors.brown,),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Website', style: TextStyle(fontSize: 16),),
                              SizedBox(height: 4,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade400
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6, right: 6, top: 1, bottom: 1),
                                  child: Text('www.viaviweb.com', style: TextStyle(fontSize: 15),),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.brown)]
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.brown.shade100,
                            child: Icon(Icons.contacts_outlined, color: Colors.brown,),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact Us', style: TextStyle(fontSize: 16),),
                              SizedBox(height: 4,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade400
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6, right: 6, top: 1, bottom: 1),
                                  child: Text('+91 9227777522', style: TextStyle(fontSize: 15),),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.brown)]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('About Us', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
