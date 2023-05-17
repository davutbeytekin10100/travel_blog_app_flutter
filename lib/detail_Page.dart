
import 'package:flutter/material.dart';
import 'package:travel_blog_app/travel_Pictures.dart';

class DetailPage extends StatelessWidget {

   final Travel travel;
  final double expandedHeight=300;
  final double roundedContainerHeight=50;

  DetailPage({required this.travel});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          CustomScrollView(
           slivers: [
              _buildSilverHead(),

              SliverToBoxAdapter(
                child: _buildDetail(),
              )
           ],
          ),




          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top,right: 15,left: 15),

            child: SizedBox(
              height: kToolbarHeight,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },

                    child: Container(
                      height: 30,
                      width: 30,
                      child: CircleAvatar(child: Icon(Icons.arrow_back,size: 30,color: Colors.white,)),

                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),


                  Icon(Icons.menu,color: Colors.blue,size: 30,),

                ],
              ),


            ),
          ),



        ],
      ),
    );
  }


  Widget _buildSilverHead() {
    return SliverPersistentHeader(
       delegate: DetailSliverDelegate(travel: travel, expandedHeight: expandedHeight, roundedContainerHeight: roundedContainerHeight),
    );
  }



   Widget _buildDetail() {

     return Container(
       color: Colors.white,

       child: Column(
         children: [

           _buildUserInfo(),

           Padding(
             padding: const EdgeInsets.all(15),
             child: Text("Yinelenen bir sayfa iceriginin okuyucunun dikkatini dagittigi bilinen bir gercektir."
                 " Lorem Ipsum kullanmanin amaci, surekli 'buraya metin gelecek, buraya metin gelecek'"
                 " yazmaya kiyasla daha dengeli bir harf dagilimi saglayarak okunurlugu artirmasidir.",

               style: TextStyle(color: Colors.black,fontSize: 14,height: 1.5),
             ),
           ),



           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Sevdicegim",style: TextStyle(fontSize: 17,color: Colors.red.shade900,fontWeight: FontWeight.bold),),
                 Text("Minik Pandam",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red.shade900.withOpacity(0.8),fontSize: 14),),
               ],
             ),
           ),

           SizedBox(
             height: 160,
             child: FeaturedWidget(),
           ),


           Padding(
             padding: const EdgeInsets.all(15),
             child: Text("Yinelenen bir sayfa iceriginin okuyucunun dikkatini dagittigi bilinen bir gercektir."
                 " Lorem Ipsum kullanmanin amaci, surekli 'buraya metin gelecek, buraya metin gelecek'"
                 " yazmaya kiyasla daha dengeli bir harf dagilimi saglayarak okunurlugu artirmasidir.",
               style: TextStyle(color: Colors.black, fontSize: 14,height: 1.5),),
           ),


         ],
       ),
     );
   }


  Widget _buildUserInfo(){
     return Padding(
       padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
       child: Row(
         children: [

           ClipRRect(
             borderRadius: BorderRadius.circular(50),
              child: Image.asset(travel.imageURL,width: 50,height: 50,fit: BoxFit.cover,),
           ),

           Padding(
             padding: EdgeInsets.only(left: 10),

             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(travel.imageName,style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold),),

                 SizedBox(height: 5,),

                 Text(travel.imageLocation,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey),),

               ],
             ),
           ),

         ],
       ),

     );
   }



}



class DetailSliverDelegate extends SliverPersistentHeaderDelegate {

  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;

  DetailSliverDelegate({required this.travel, required this.expandedHeight, required this.roundedContainerHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Stack(
      children: [

        Opacity(
          opacity: 1, // OR =>  0.9 , 0.8
          child: Image.asset(travel.imageURL,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.cover,),
        ),



        Positioned(
          top: expandedHeight-roundedContainerHeight-shrinkOffset,

          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,

            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
            ),
          ),
        ),



        Positioned(
          top: expandedHeight-shrinkOffset-120,
          left: 0,

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(travel.imageName,style: TextStyle(fontSize: 20,color: Colors.amber,fontWeight: FontWeight.bold),),

                SizedBox(height: 5,),

                Text(travel.imageLocation,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}


class FeaturedWidget extends StatelessWidget { // 8. CI

  final _list=Travel.generateMostPopulatPics();

  @override
  Widget build(BuildContext context) {

    return ListView.separated(

      padding: EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      itemCount: _list.length,
      separatorBuilder: (_,index) => SizedBox(width: 10,),

      itemBuilder: (context,index) {
        var travel=_list[index];

        return Stack(
          children: [

            Container(
              width: 150,
              height: 150,
              child: Image.asset(travel.imageURL,fit: BoxFit.cover,),
            ),


            Positioned(
              top: 0,
              left: 0,

              child: IconButton(
                icon: CircleAvatar(child: Icon(Icons.arrow_back,color: Colors.white,)),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            )

          ],
        );
      },
    );
  }
}