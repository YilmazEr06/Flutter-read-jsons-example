class cokkies{
  late List<String> ingredients ;
  late String name;
  late String description;
  late String origin;
  late List<String> popularregions;
  late String imageurl;
  
  cokkies(this.name,this.description,this.ingredients,this.origin,this.popularregions,this.imageurl);
  cokkies.fromMap( Map<String, dynamic> map) {
    name = map["name"] ?? "";
    description = map["description"] ?? "";
    ingredients = List<String>.from(map["ingredients"] ?? []);
    origin = map["origin"] ?? "";
    popularregions = List<String>.from(map["popular_regions"] ?? []);
    imageurl = map["image_url"] ?? "";
  }


 
  String get getname{
    return name;
  }
   String get getdescription{
    return description;
  }
   List<String> get getingredients{
    return ingredients;
  }
   String get getorigin{
    return origin;
  }
   List<String> get getpopularregions{
    return popularregions;
  }
   String get getimageurl{
    return imageurl;
  }


  Map<String, Object?> tomap() {
    var map = <String,dynamic>{};
    map["name"]= name;
    map["description"]= description;
    map["ingredients"]= ingredients;
    map["origin"]= origin;
    map["popularregions"]= popularregions;
    map["imageurl"]= imageurl;

    return map;
  }
  



}