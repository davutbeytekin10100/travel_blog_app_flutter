
import 'package:flutter/material.dart';
import 'package:travel_blog_app/detail_Page.dart';
import 'package:travel_blog_app/travel_Pictures.dart';

class MostPopularPart extends StatelessWidget {
 final _myList= Travel.generateMostPopulatPics();


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(15),
      itemCount: _myList.length,
      separatorBuilder: (_,index) => SizedBox(width: 15,),
      scrollDirection: Axis.horizontal,

      itemBuilder: (context,index) {
        var travel=_myList[index];

        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(travel: travel,)));
          },
          child: Stack(
            children: [

              ClipRRect(
               borderRadius: BorderRadius.circular(5),
                child: Image.asset(travel.imageURL,width: 150,height:150,fit: BoxFit.cover,),
              ),

              Positioned(
                bottom: 20,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Material(
                      color: Colors.transparent,
                      child: Text(travel.imageName,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),),
                    ),
                    SizedBox(height: 5,),
                    
                    Material(
                      color: Colors.transparent,
                      child: Text(travel.imageLocation,style: TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                right: 5,

                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(travel: travel,)));
                  },
                  child: Container(
                    width: 30,
                    height: 30,
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
