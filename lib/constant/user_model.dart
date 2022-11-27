class UserModel {
  String? uid;
  String? plan;
  String? email;
  String? cardnumber;
  String? plan1;
  String? institute;
  String? cardname;
  String? cvv;
  String? valid;
  String? expiry;
  String? firstname;
  String? secondname;
  String? phonenumber;

  UserModel(
      {this.uid,
      this.plan,
      this.email,
      this.cardnumber,
      this.plan1,
      this.institute,
      this.cardname,
      this.cvv,
      this.valid,
      this.expiry,
      this.firstname,
      this.secondname,
      this.phonenumber});
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      plan: map['plan'],
      email: map['email'],
      cardnumber: map['cardnumber'],
      plan1: map['plan1'],
      institute: map['institute'],
      cardname: map['cardname'],
      cvv: map['cvv'],
      valid: map['valid'],
      expiry: map['expiry'],
      firstname: map['firstname'],
      secondname: map['secondname'],
      phonenumber: map['phonenumber'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'plan': plan,
      'email': email,
      'cardnumber': cardnumber,
      'plan1': plan1,
      'institute': institute,
      'cardname': cardname,
      'cvv': cvv,
      'valid': valid,
      'expiry': expiry,
      'firstname': firstname,
      'secondname': secondname,
      'phonenumber': phonenumber,
    };
  }
}
