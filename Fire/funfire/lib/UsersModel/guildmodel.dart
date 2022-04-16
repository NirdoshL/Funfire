class GuildModel{
  String? guildName;
  String? fname;
  GuildModel({this.fname,this.guildName});
  Map<String,dynamic> toMap(){
    return{
      'guildName':guildName,
      'first Name':fname
    };
  }
}