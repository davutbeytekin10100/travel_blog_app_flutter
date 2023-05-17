
class Travel { // my transfer class...

  final String imageName;
  final String imageLocation;
  final String imageURL;

  Travel(this.imageName, this.imageLocation, this.imageURL);

  static List<Travel> generateTravelBlogPics(){
    return [
      Travel("picture1", "Miami", "assets/images/travel1.jpg"),
      Travel("picture2", "Miami", "assets/images/travel2.jpg"),
      Travel("picture3", "Miami", "assets/images/travel3.jpg"),
      Travel("picture4", "Miami", "assets/images/travel4.jpg"),
      Travel("picture5", "Miami", "assets/images/travel5.jpg"),
      Travel("picture6", "Miami", "assets/images/travel6.jpg"),
      Travel("picture7", "Miami", "assets/images/travel4.jpg"),
      Travel("picture8", "Miami", "assets/images/travel8.jpg"),
      Travel("picture9", "Miami", "assets/images/travel9.jpg"),
      Travel("picture10", "Miami", "assets/images/travel10.jpg"),
    ];
  }


  static List<Travel> generateMostPopulatPics() {
    return [
      Travel("picture11", "Miami", "assets/images/travel11.jpg"),
      Travel("picture12", "Miami", "assets/images/travel12.jpg"),
      Travel("picture13", "Miami", "assets/images/travel13.jpg"),
      Travel("picture14", "Miami", "assets/images/travel14.jpg"),
      Travel("picture15", "Miami", "assets/images/travel15.jpg"),
      Travel("picture16", "Miami", "assets/images/travel16.jpg"),
      Travel("picture17", "Miami", "assets/images/travel17.jpg"),
      Travel("picture18", "Miami", "assets/images/travel18.jpg"),
      Travel("picture19", "Miami", "assets/images/travel19.jpg"),
      Travel("picture20", "Miami", "assets/images/travel20.jpg"),
    ];
  }

}