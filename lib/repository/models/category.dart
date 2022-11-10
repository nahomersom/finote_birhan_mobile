class CategoryModel{
  final String category,image,type;
  final List months;
  CategoryModel({
    required this.category,
    required this.image,
    required this.months,
    required this.type
  });

 factory CategoryModel.fromJSON(Map<String,dynamic> json){
    return CategoryModel(
        category: json['category'],
        image: json['mezmurTypeImage'],
        months: json['months'],
        type: json['type']
    );
  }
}