class Users{
  String? uid;
  String? fname;
  String? sname;
  String? email;
  String? image;
  String? guildName;
  String? phone;

  Users({this.guildName,this.phone,this.uid,this.email,this.fname,this.sname,this.image});


// fetching data from firebase
  factory Users.fromMap(map){
    return Users(
      email: map['email'],
      fname: map['firstName'],
      sname: map['secondName'],
      image: map['image'],
      guildName:map['guildName'],
      phone: map['phone']
      );
      
      
  }

//sending data to firebase
Map<String,dynamic> toMap(){
  return {
    'uid':uid,
    'email':email,
    'firstName':fname,
    'secondName':sname,
    'image':image,
    'guildName':guildName,
    'phone':phone
  };
}
}
