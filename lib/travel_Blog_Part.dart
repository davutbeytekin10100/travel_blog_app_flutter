
import 'package:flutter/material.dart';
import 'package:travel_blog_app/detail_Page.dart';
import 'package:travel_blog_app/travel_Pictures.dart';

class TravelBlogPart extends StatelessWidget {
  final _myList=Travel.generateTravelBlogPics();
  final _pageController=PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: _myList.length,
      controller: _pageController,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context,i) {
        var travel=_myList[i];
        print("travel : $i");

        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(travel: travel,)));
          },
          child: Stack(
            children: [

              Container(
               width: 500,
                height: 500,
                child: Image.asset(travel.imageURL,fit: BoxFit.cover,),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  border: Border.all(width: 1,color: Colors.pink.shade500),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber,
                      offset: Offset(1,1),
                      spreadRadius: 2,
                      blurRadius: 2,
                    )
                  ]
                ),
              ),

              Positioned(
                bottom: 40,
                left: 15,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                     color: Colors.transparent,
                     child: Text(travel.imageName,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 20),),
                    ),
                    SizedBox(height: 5,),

                    Material(
                      color: Colors.transparent,
                      child: Text(travel.imageLocation,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 10,
                right: 20,

                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(travel: travel,)));
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(child: Icon(Icons.arrow_forward,color: Colors.white,)),
                  ),
                ),
              ),

            ],
          ),
        );
      },

    );
  }
}
















