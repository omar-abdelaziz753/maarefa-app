
class PlaceModel{
  String? description;
  String? placeId;


  PlaceModel.fromJson(Map<dynamic,dynamic> json) {
    description = json['description'].toString();
    placeId = json['place_id'].toString();
  }
}