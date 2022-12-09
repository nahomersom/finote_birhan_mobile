
class MezmurModel{
final String body,category,mezmurUrl,title,zemari,imageUrl;
final List<dynamic> type;
MezmurModel({
  required this.body,
  required this.category,
  required this.mezmurUrl,
  required this.title,
  required this.type,
  required this.zemari,
  required this.imageUrl

});
factory MezmurModel.fromJSON(Map<String,dynamic> json){
  return MezmurModel(
      body: json["body"] as String,
      category: json["category"] as String,
      mezmurUrl: json["mezmurUrl"] as String,
      title: json["title"] as String,
      type: json["type"] as List<dynamic>,
      zemari:  json["zemari"] as String,
      imageUrl: json["imageUrl"] as String,
  );
}
}