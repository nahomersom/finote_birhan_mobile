class ZemarianModel{
  final String name,lastName,maereg,image;

  ZemarianModel({required this.name,required this.lastName, required this.maereg,required this.image});

  factory ZemarianModel.fromJSON(Map<String,dynamic> json){
    return ZemarianModel(
         name: json['name'],
         lastName: json['lastName'],
         maereg: json['maereg'],
         image: json['zemarianImage']
    );
  }
}