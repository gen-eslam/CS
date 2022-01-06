class UserCreate
{
  String? name;
  String? email;
  String? phone;
  String? uId;

  UserCreate(
      {
        this.name,
        this.email,
        this.phone,
        this.uId,

      });
  UserCreate.fromJson(Map<String,dynamic>json)
  {
    email =json['email'];
    name =json['name'];
    phone =json['phone'];
    uId =json['uId'];

  }
  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
    };
  }

}