import 'zeker.dart';

class SubCategory {
  String? subCatName;
  List<Zeker> zekerList;
  bool isFavorite;
  SubCategory({
    required this.zekerList,
    required this.subCatName,
    this.isFavorite = false,
  });
}
