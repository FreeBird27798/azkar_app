import 'sub_category.dart';

class ZekerCategory {
  String catName;
  String catName_en;
  String imagePath;
  List<SubCategory> list;

  ZekerCategory({
    required this.list,
    required this.catName,
    required this.catName_en,
    required this.imagePath,
  });
}
