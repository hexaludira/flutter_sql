class ClassPenangkap {
  int _id;
  String _date;
  String _detail;
  String _location;
  String _status;
  String _remark;

  ClassPenangkap(this._date, this._detail, this._location, this._status, this._remark);

  ClassPenangkap.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._date = map['date'];
    this._detail = map['detail'];
    this._location = map['location'];
    this._status = map['status'];
    this._remark = map['remark'];
  }

  int get id => _id;
  String get date => _date;
  String get detail => _detail;
  String get location => _location;
  String get status => _status;
  String get remark => _remark;

  //setter
  set date(String value) {
    _date = value;
  }

  set detail(String value) {
    _detail = value;
  }

  set location(String value) {
    _location = value;
  }

  set status(String value) {
    _status = value;
  }

  set remark(String value) {
    _remark = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['date'] = this._date;
    map['detail'] = detail;
    map['location'] = location;
    map['status'] = status;
    map['remark'] = remark;
    return map;

  }
}