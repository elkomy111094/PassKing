class MainCategoryModel {
  MainCategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.hasMenu,
    required this.hasBooking,
    required this.storesCount,
  });
  late final int id;
  late final String name;
  late final String image;
  late final bool hasMenu;
  late final bool hasBooking;
  late final int storesCount;

  MainCategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    hasMenu = json['has_menu'];
    hasBooking = json['has_booking'];
    storesCount = json['stores_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['has_menu'] = hasMenu;
    _data['has_booking'] = hasBooking;
    _data['stores_count'] = storesCount;
    return _data;
  }
}