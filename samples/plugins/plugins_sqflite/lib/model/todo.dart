class Todo {
  int? _id;
  String _title;
  String? _description;
  String _date;
  int _priority;

  Todo(this._title, this._priority, this._date, [this._description]);
  Todo.withId(this._id, this._title, this._priority, this._date, [this._description]);
  Todo.fromObject(dynamic o) :
    _id = o['id'],
    _title = o['title'],
    _description = o['description'],
    _date= o['date'],
    _priority = o['priority'];

  int get id => _id ?? 0;
  String get title => _title;
  String? get description => _description;
  String get date => _date;
  int get priority => _priority;

  set title(String title) {
    if (title.length <= 100) {
      _title = title;
    }
  }

  set description(String? description) {
    if (title.length <= 255) {
      _description = description;
    }
  }

  set priority(int priority) {
    if (priority > 0 && priority <= 3) {
      _priority = priority;
    }
  }

  Map<String, dynamic> toMap() {
    var result = new Map<String, dynamic>();
    result['title'] = _title;
    result['priority'] = _priority;
    result['date'] = _date;
    if (_id != null) {
      result['id'] = _id;
    }
    if (_description != null) {
      result['description'] = _description;
    }
    return result;
  }

}
