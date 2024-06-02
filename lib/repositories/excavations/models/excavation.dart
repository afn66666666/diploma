

class Excavation{
  String id;
  String description;
  Map<String,dynamic> geodata;

  Excavation(this.id,this.description,this.geodata);

  Excavation.fromJson(Map<String,dynamic> rawData):
    id = rawData['id'] as String,
    description = rawData['description'] as String,
    geodata = rawData['geodata'];
}