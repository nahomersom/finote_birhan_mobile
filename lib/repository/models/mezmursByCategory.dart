class MezmursByCategoryModel{
  final String title,imageUrl,zemari;

  MezmursByCategoryModel({
    required this.title,
    required this.imageUrl,
    required this.zemari,

  });

  factory MezmursByCategoryModel.fromJSON(Map<String,dynamic> json){
    return MezmursByCategoryModel(
        title: json['title'],
        imageUrl: json['imageUrl'],
        zemari: json['zemari'],

    );
  }
}