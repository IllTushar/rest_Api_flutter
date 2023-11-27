class ModelClass{
  List<Data?>? data;
  ModelClass(this.data);
   ModelClass.fromJson(Map<String,dynamic>json){
    if(json['data']!=null){
      data = <Data>[];
      json['data'].forEach((v){
        data!.add(Data.fromJson(v));
      });
    }
   }
}
class Data{
  int? id;
  String? email;
  String? firstname;
  String? lastname;
  String? avatar;

  Data({this.id, this.email, this.firstname, this.lastname, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstname = json['first_name'];
    lastname = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstname;
    data['last_name'] = lastname;
    data['avatar'] = avatar;
    return data;
  }
}