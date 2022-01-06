class CoursesModel
{
  String? title;
  String? uId;
  String? price;
  String? totalHour;
  String? description;
  String? coursesImage;

  CoursesModel({
     this.title,
     this.uId,
     this.price,
     this.totalHour,
     this.coursesImage,
     this.description,
});
  CoursesModel.fromJson(Map<String,dynamic>json)
  {
    title = json['title'];
    price = json['price'];
    totalHour = json['totalHour'];
    coursesImage = json['coursesImage'];
    uId = json['uId'];
    description = json['description'];

  }
  Map<String,dynamic> toMap()
  {
    return
      {
        'title':title,
        'uId':uId,
        'price':price,
        'totalHour':totalHour,
        'coursesImage':coursesImage,
        'description':description,

      };
  }


}