

import 'main_category_model.dart';

class StoreModel {
  StoreModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isFav,
    required this.lat,
    required this.lng,
    required this.addressName,
    required this.distance,
    required this.map,
    required this.image,
    required this.cover,
    required this.rate,
    required this.rateText,
    required this.openStore,
    required this.closeStore,
    required this.phone,
    required this.whatsapp,
    required this.instagram,
    required this.twitter,
    required this.snapchat,
    required this.hasBooking,
    required this.orderType,
    required this.hasMenu,
    required this.menuType,
    required this.branchesCount,
    required this.branches,
    required this.mainCategory,
    required this.subCategories,
    required this.isFeatured,
    required this.storeStatus,
    required this.doYouReceiveOrder,
    required this.waitingOrderTime,
    required this.storeCreatedAt,
  });
  late final int id;
  late final String name;
  late final String description;
  late final bool ? isFav;
  late final String lat;
  late final String lng;
  late final String addressName;
  late final int ? distance;
  late final String map;
  late final String ? image;
  late final List<Cover>  cover;
  late final int  ? rate;
  late final String ?  rateText;
  late final String openStore;
  late final String closeStore;
  late final String phone;
  late final String whatsapp;
  late final String instagram;
  late final String twitter;
  late final String snapchat;
  late final bool hasBooking;
  late final List<dynamic> orderType;
  late final bool hasMenu;
  late final List<dynamic> menuType;
  late final int branchesCount;
  late final List<Branches> branches;
  late final MainCategoryModel mainCategory;
  late final List<SubCategories> subCategories;
  late final IsFeatured isFeatured;
  late final StoreStatus storeStatus;
  late final bool doYouReceiveOrder;
  late final String waitingOrderTime;
  late final String storeCreatedAt;

  StoreModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isFav = json['is_fav'];
    lat = json['lat'];
    lng = json['lng'];
    addressName = json['address_name'];
    distance = json['distance'];
    map = json['map'];
    image = json['image'];
    cover = List.from(json['cover']).map((e)=>Cover.fromJson(e)).toList();
    rate = json['rate'];
    rateText = json['rateText'];
    openStore = json['open_store'];
    closeStore = json['close_store'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    snapchat = json['snapchat'];
    hasBooking = json['hasBooking'];
    orderType = List.castFrom<dynamic, dynamic>(json['order_type']);
    hasMenu = json['hasMenu'];
    menuType = List.castFrom<dynamic, dynamic>(json['menuType']);
    branchesCount = json['branchesCount'];
    branches = List.from(json['branches']).map((e)=>Branches.fromJson(e)).toList();
    mainCategory = MainCategoryModel.fromJson(json['mainCategory']);
    subCategories = List.from(json['subCategories']).map((e)=>SubCategories.fromJson(e)).toList();
    isFeatured = IsFeatured.fromJson(json['is_featured']);
    storeStatus = StoreStatus.fromJson(json['store_status']);
    doYouReceiveOrder = json['do_you_receive_order'];
    waitingOrderTime = json['waiting_order_time'];
    storeCreatedAt = json['store_created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['is_fav'] = isFav;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['address_name'] = addressName;
    _data['distance'] = distance;
    _data['map'] = map;
    _data['image'] = image;
    _data['cover'] = cover.map((e)=>e.toJson()).toList();
    _data['rate'] = rate;
    _data['rateText'] = rateText;
    _data['open_store'] = openStore;
    _data['close_store'] = closeStore;
    _data['phone'] = phone;
    _data['whatsapp'] = whatsapp;
    _data['instagram'] = instagram;
    _data['twitter'] = twitter;
    _data['snapchat'] = snapchat;
    _data['hasBooking'] = hasBooking;
    _data['order_type'] = orderType;
    _data['hasMenu'] = hasMenu;
    _data['menuType'] = menuType;
    _data['branchesCount'] = branchesCount;
    _data['branches'] = branches.map((e)=>e.toJson()).toList();
    _data['mainCategory'] = mainCategory.toJson();
    _data['subCategories'] = subCategories.map((e)=>e.toJson()).toList();
    _data['is_featured'] = isFeatured.toJson();
    _data['store_status'] = storeStatus.toJson();
    _data['do_you_receive_order'] = doYouReceiveOrder;
    _data['waiting_order_time'] = waitingOrderTime;
    _data['store_created_at'] = storeCreatedAt;
    return _data;
  }
}

class Cover {
  Cover({
    required this.id,
    required this.cover,
  });
  late final int id;
  late final String cover;

  Cover.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['cover'] = cover;
    return _data;
  }
}

class Branches {
  Branches({
  required this.id,
  required this.name,
  required this.addressName,
  required this.lat,
  required this.lng,
  required this.phone,
  required this.area,
  required this.map,
  required this.main,
});
late final int  ? id;
late final String ? name;
late final String ? addressName;
late final String  ?lat;
late final String ? lng;
late final String ? phone;
late final Area ? area;
late final String ? map;
late final bool ? main;

Branches.fromJson(Map<String, dynamic> json){
id = json['id'];
name = json['name'];
addressName = json['address_name'];
lat = json['lat'];
lng = json['lng'];
phone = json['phone'];
area = Area.fromJson(json['area']);
map = json['map'];
main = json['main'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['id'] = id;
_data['name'] = name;
_data['address_name'] = addressName;
_data['lat'] = lat;
_data['lng'] = lng;
_data['phone'] = phone;
_data['area'] = area?.toJson() ?? "";
_data['map'] = map;
_data['main'] = main;
return _data;
}
}

class Area {
Area({
required this.id,
required this.name,
});
late final int id;
late final String name;

Area.fromJson(Map<String, dynamic> json){
id = json['id'];
name = json['name'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['id'] = id;
_data['name'] = name;
return _data;
}
}



class SubCategories {
SubCategories({
required this.id,
required this.name,
required this.image,
});
late final int id;
late final String name;
late final String image;

SubCategories.fromJson(Map<String, dynamic> json){
id = json['id'];
name = json['name'];
image = json['image'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['id'] = id;
_data['name'] = name;
_data['image'] = image;
return _data;
}
}

class IsFeatured {
IsFeatured({
required this.featured,
required this.startFeaturedDate,
required this.endFeaturedDate,
});
late final bool featured;
late final String startFeaturedDate;
late final String endFeaturedDate;

IsFeatured.fromJson(Map<String, dynamic> json){
featured = json['featured'];
startFeaturedDate = json['start_featured_date'];
endFeaturedDate = json['end_featured_date'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['featured'] = featured;
_data['start_featured_date'] = startFeaturedDate;
_data['end_featured_date'] = endFeaturedDate;
return _data;
}
}

class StoreStatus {
StoreStatus({
required this.storeStatus,
required this.processDate,
required this.rejectedMessage,
});
late final String storeStatus;
late final String processDate;
late final String rejectedMessage;

StoreStatus.fromJson(Map<String, dynamic> json){
storeStatus = json['store_status'];
processDate = json['process_date'];
rejectedMessage = json['rejected_message'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['store_status'] = storeStatus;
_data['process_date'] = processDate;
_data['rejected_message'] = rejectedMessage;
return _data;
}
}