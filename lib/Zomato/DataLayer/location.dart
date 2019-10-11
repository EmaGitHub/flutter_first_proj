class Location {
  
  String name;
  String title;
  String country;
  String entityId;
  Location(this.name, this.title, this.country, this.entityId);

  String toString(){

    print('Location: '+this.name+' ('+this.title+') in '+this.country);
  }
}