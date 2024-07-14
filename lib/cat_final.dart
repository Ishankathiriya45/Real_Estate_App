import 'package:estate/item_list.dart';
import 'package:flutter/material.dart';

List itemList = [
  {
    'icon': Icons.bed,
    'name': '3 Beds'
  },
  {
    'icon': Icons.bathroom_outlined,
    'name': '2 Bath'
  },
  {
    'icon': Icons.fit_screen_outlined,
    'name': '1100 Sqft'
  },
  {
    'icon': Icons.table_restaurant_outlined,
    'name': 'Furnished'
  },
  {
    'icon': Icons.verified_user_outlined,
    'name': 'Verified'
  },
];

List amenities = [
  {
    'icon': Icons.label_important_outline,
    'name': 'Lift'
  },
  {
    'icon': Icons.label_important_outline,
    'name': 'Security'
  },
  {
    'icon': Icons.label_important_outline,
    'name': 'Gymnasium'
  },
  {
    'icon': Icons.label_important_outline,
    'name': 'Grand Entrance'
  },
  {
    'icon': Icons.label_important_outline,
    'name': 'Lobby'
  },
  {
    'icon': Icons.label_important_outline,
    'name': 'CCTV Camera'
  },
  {
    'icon': Icons.label_important_outline,
    'name': 'Kids play area'
  },
];

class FinalCatPage extends StatefulWidget {
  const FinalCatPage({super.key});

  @override
  State<FinalCatPage> createState() => _FinalCatPageState();
}

class _FinalCatPageState extends State<FinalCatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Bungalow.jpg'),
                          fit: BoxFit.cover
                      )
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(
                              //height: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_back_ios_rounded, color: Colors.brown, size: 30,),
                              ),
                            ),

                            SizedBox(width: 230,),
                            Container(
                              //height: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.location_on_outlined, color: Colors.brown, size: 30,),
                              ),
                            ),

                            SizedBox(width: 10,),
                            Container(
                              //height: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.bookmark_border, color: Colors.brown, size: 30,),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 120,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 28,
                              width: 122,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: Text(
                                  'Rs.90.00.000',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),

                            Container(
                              height: 25,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.visibility,
                                    color: Colors.brown,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    '32',
                                    style: const TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),

          Positioned(
            left: 0,
            right: 0,
            top: 260,
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('King Villa', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, color: Colors.brown,),
                                  Expanded(child: Text('Dumas, Surat',maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black, fontSize: 18))),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.brown.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(Icons.book_online, size: 30, color: Colors.brown.shade500,),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(Icons.share_outlined, size: 30, color: Colors.brown.shade500,),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10,),
                    Divider(indent: 30, endIndent: 30,),

                    SizedBox(height: 10,),
                    SizedBox(
                      height: 94,
                      child: ListView.builder(
                        itemCount: itemList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              // height: 110,
                              width: 82,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.brown.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(itemList[index]['icon'], size: 40, color: Colors.brown,),
                                  Text(itemList[index]['name'], style: TextStyle(fontSize: 14, color: Colors.brown, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(1,2))],
                        borderRadius: BorderRadius.circular(14)
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/profile.png')
                              )
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(height: 16,),
                              Text('Owner', style: TextStyle(fontSize: 18),),
                              Text('Ishan Patel', style: TextStyle(fontSize: 20),),
                            ],
                          ),

                          SizedBox(width: 70,),
                          Container(
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              shape: BoxShape.circle,
                            ),
                            child:
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset('assets/images/whatsapp.png'),
                            ),
                          ),
                          SizedBox(width: 8,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child:
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.call, color: Colors.blueGrey, size: 30,),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    Text('Overview',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Description any word',style: TextStyle(fontSize: 18,),),
                    ),

                    SizedBox(height: 10,),
                    Text('Amenities',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    SizedBox(height: 6,),
                    // ItemPage()


                    GridView.builder(
                      itemBuilder: (context, index){
                        return GestureDetector(onTap: () {

                        },
                          child: Row(
                            children: [
                              Icon(Icons.label_important_outline, size: 30,),
                              Text('Lift', style: TextStyle(fontSize: 18),)
                            ],
                          ),
                        );
                      },
                      itemCount: amenities.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 20,
                        mainAxisSpacing: 3
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
