import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType()
class User {
  @HiveField(0)
  String username;
  @HiveField(1)
  int score = 0;
  User(this.username, this.score);
}
