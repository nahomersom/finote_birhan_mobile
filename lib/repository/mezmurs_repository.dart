import 'package:finote_birhan_mobile/repository/models/category.dart';
import 'package:finote_birhan_mobile/repository/models/recomended.dart';
import 'package:finote_birhan_mobile/repository/models/zemarian.dart';
import 'package:finote_birhan_mobile/repository/services/mezmurs_service.dart';

class MezmursRepository{
  final MezmursService mezmursService;

  MezmursRepository({required this.mezmursService});
  Future<List<MezmurModel>> getMezmurs() => mezmursService.getRecommendedMezmurs();
  Future<List<CategoryModel>> getMezmursCategory([bool loadCachedData = false]) => mezmursService.getMezmursCategory(loadCachedData);
  Future<List<ZemarianModel>> getZemarians([bool loadCachedData = false]) => mezmursService.getZemarian(loadCachedData);
  Future<List<CategoryModel>> getWerebCategory([bool loadCachedData = false]) => mezmursService.getWerebCategory(loadCachedData);

}