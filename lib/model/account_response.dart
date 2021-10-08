class Account_response {
  Account_response({
      String? name, 
      String? cr0faImage, 
      String? address1Line1, 
      String? accountnumber, 
      int? statecode, 
      String? address1Stateorprovince,}){
    _name = name;
    _cr0faImage = cr0faImage;
    _address1Line1 = address1Line1;
    _accountnumber = accountnumber;
    _statecode = statecode;
    _address1Stateorprovince = address1Stateorprovince;
}

  Account_response.fromJson(dynamic json) {
    _name = json['name'];
    _cr0faImage = json['cr0fa_image'];
    _address1Line1 = json['address1_line1'];
    _accountnumber = json['accountnumber'];
    _statecode = json['statecode'];
    _address1Stateorprovince = json['address1_stateorprovince'];
  }
  String? _name;
  String? _cr0faImage;
  String? _address1Line1;
  String? _accountnumber;
  int? _statecode;
  String? _address1Stateorprovince;

  String? get name => _name;
  String? get cr0faImage => _cr0faImage;
  String? get address1Line1 => _address1Line1;
  String? get accountnumber => _accountnumber;
  int? get statecode => _statecode;
  String? get address1Stateorprovince => _address1Stateorprovince;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['cr0fa_image'] = _cr0faImage;
    map['address1_line1'] = _address1Line1;
    map['accountnumber'] = _accountnumber;
    map['statecode'] = _statecode;
    map['address1_stateorprovince'] = _address1Stateorprovince;
    return map;
  }

}