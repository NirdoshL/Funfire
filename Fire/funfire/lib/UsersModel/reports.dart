class FirebaseReport{
  String? report;
  FirebaseReport({this.report});
  // fuction that put report to fire store
  Map<String,dynamic>toMap(){
    return {
       'report':report
    };
  }
}