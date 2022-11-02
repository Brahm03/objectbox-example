import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class Users {
  int id;
  String name;
  String email;

  Users({this.id = 0, required this.email, required this.name});
}
