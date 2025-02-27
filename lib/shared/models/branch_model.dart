class BranchModel {
  BranchModel({
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
late final int id;
late final String name;
late final String addressName;
late final String lat;
late final String lng;
late final String phone;
late final Area area;
late final String map;
late final bool main;

BranchModel.fromJson(Map<String, dynamic> json){
id = json['id'];
name = json['name'];
addressName = json['address_name'];
lat = json['lat'];
lng = json['lng'];
phone = json['phone'];
area = Area.fromJson(json['area']);
map = json['map'];
main = json['default'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['id'] = id;
_data['name'] = name;
_data['address_name'] = addressName;
_data['lat'] = lat;
_data['lng'] = lng;
_data['phone'] = phone;
_data['area'] = area.toJson();
_data['map'] = map;
_data['default'] = main;
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