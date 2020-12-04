
class Trailer{
  String id;
  String key;
  String name;
  String type;
  String size;
  String site;

  Trailer.fromJson(Map <String,dynamic> json):
        id=json['id'].toString(),
        key=json['key'].toString(),
        name=json['name'].toString(),
        type=json['type'].toString(),
        size=json['size'].toString(),
        site=json['site'].toString()
  ;

}