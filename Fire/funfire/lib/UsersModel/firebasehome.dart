class Firebasehome{
  final String? date;
  final String? image;
  final String? title;
  final String? time;
  final String? map;
  final String? fee;
  final String? code;
  Firebasehome({this.image,this.title,this.map,this.date,this.time,this.fee,this.code});
  factory Firebasehome.fromMap(map){
  return Firebasehome(
     map: map['map'],
     title: map['title'],
     date: map['date'],
     time: map['time'],
     fee: map['fee'],
     code: map['code'],
     image: map['image']
  );
  }
}