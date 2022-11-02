import 'package:objectboxapp/model/usermodel.dart';
import 'package:objectboxapp/objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<Users> _userbox;

  ObjectBox._init(this._store) {
    _userbox = Box<Users>(_store);
  }

  Future<ObjectBox> init() async {
    final store = await openStore();
    return ObjectBox._init(store);
  }


  
}
