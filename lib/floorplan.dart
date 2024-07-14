import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

class FloorPage extends StatefulWidget {

  List imageplanList;
  String imagename;
  String title;
   FloorPage({super.key, required this.imageplanList, required this.imagename, required this.title});

  @override
  State<FloorPage> createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage> {
  String? image;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    image = widget.imagename;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
              child:Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 42,
                          width: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown.shade100
                          ),
                          child: Icon(Icons.arrow_back_ios_rounded, color: Colors.brown, size: 24,),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(widget.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
                    ],
                  ),

                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: WidgetZoom(
                      heroAnimationTag: '',
                      zoomWidget: Image.network(image!),
                    ),
                  ),
                  Spacer(),

                  widget.imageplanList.length == 0? SizedBox():SizedBox(
                    height: widget.imageplanList.length == 0? 0:170,
                    child: ListView.builder(
                      itemCount: widget.imageplanList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: () {
                            image = widget.imageplanList[index]['gallery_image'];
                            setState(() {

                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: widget.imageplanList[index]['gallery_image'],
                                  fit: BoxFit.cover, width: 150,
                                placeholder: (context, url) => Center(child: Image.asset('assets/images/home_load.jpg', fit: BoxFit.cover,)),
                                errorWidget: (context, url, error) => Center(child: Icon(Icons.error, size: 30)),
                              ),
                            ),
                          )
                        );
                      },
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
