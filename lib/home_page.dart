
import 'package:flutter/material.dart';
import 'package:travel_blog_app/most_Popular_Part.dart';
import 'package:travel_blog_app/travel_Blog_Part.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 4,
        shadowColor: Colors.blue,

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.menu,color: Colors.white,),
              onPressed: (){
               print("Menu Tıklandı");
              },
            ),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [

          Padding(
            padding: EdgeInsets.all(10),
            child: Text("My Travel Blog App ",style: TextStyle(fontSize: 28,color: Colors.blue,fontWeight: FontWeight.bold),),
          ),

          Expanded(
            flex: 2,
            child: TravelBlogPart(),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Most Popular Pictures",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 20),),

                Text("View All...",style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
              ],
            ),
          ),


          Expanded(
            flex: 1,
            child: MostPopularPart(),
          )

        ],
      ),

    );
  }
}
