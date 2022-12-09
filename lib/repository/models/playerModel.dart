class PlayerModel{
  final String image,lyrics,title,zemari;
  final String? mezmurUrl;
  PlayerModel({required this.image, this.mezmurUrl, required this.lyrics, required this.title, required this.zemari});
  factory PlayerModel.fromOtherModel(Map model){
    return PlayerModel(
      image: model['imageUrl'],
      lyrics: model['body'],
      title: model['title'],
      zemari: model['zemari'],
        mezmurUrl: model['mezmurUrl']
    );
  }
}