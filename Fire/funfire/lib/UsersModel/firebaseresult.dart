class FirebaseResult{
  final String? name;
  final String? matchName;
  final String? guildName;
  final String? kill;
  final String? points;
  FirebaseResult({this.name,this.guildName,this.matchName,this.kill,this.points});
  factory FirebaseResult.fromMap(map){
  return FirebaseResult(
     name: map['name'],
     guildName: map['guildName'],
     matchName: map['matchName'],
     kill: map['kill'],
     points: map['points'],
  );
  }
}