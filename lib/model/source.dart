class Source {
  String id;
  String name;

  Source({this.id, this.name});

  Source.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.name = map["name"];
  }

  static Map<String, dynamic> toMap(Source source) {
    var map = Map<String, dynamic>();
    map["id"] = source.id;
    map["name"] = source.name;
    return map;
  }
}