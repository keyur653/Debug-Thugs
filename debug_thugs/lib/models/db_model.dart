import 'package:cloud_firestore/cloud_firestore.dart';

class Contents {
  String? name;
  String? key;
  bool isSelected = false;

  Contents(this.name);

  Contents.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot.get('name'),
        key = snapshot.id;
}

class Item {
  String name;
  String rollNo;
  String regNo;
  String yearNo;
  String classs;
  bool isSelected = false;
  String? key;

  Item(this.name,this.rollNo, this.regNo, this.yearNo, this.classs);

  Item.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot.get('Name'),
        regNo = snapshot.get('Regno').toString(),
        rollNo = snapshot.get('Rollno').toString(),
        yearNo = snapshot.get('yearNo').toString(),
        classs = snapshot.get('Class').toString(),
        key = snapshot.id;
}

/// helper functions
class DatabaseReference {
  /// get profile when passing class, year and department as arguments
  CollectionReference getProfile(String? cls, String? yer, String? dep) {
    return (FirebaseFirestore.instance
        .collection('collage/student/$dep/$yer/$cls'));
  }

  CollectionReference placeAttendance(String? cls, String? yer, String? dep) {
    return (FirebaseFirestore.instance
        .collection('collage/attendance/$dep/$yer/$cls'));
  }

  CollectionReference getDetailRef(String val) {
    return (FirebaseFirestore.instance.collection('collage/entity/$val'));
  }

  CollectionReference getDetailRef2(String? year, String? department) {
    return (FirebaseFirestore.instance
        .collection('collage/entity/class/$department/$year'));
  }

  CollectionReference getDates() {
    return (FirebaseFirestore.instance.collection('collage/date/working'));
  }
}
