class User {
  String id;
  User(
      {this.id,
      this.birth,
      this.email,
      this.phone,
      this.name,
      this.token,
      this.password});
  String name;
  DateTime birth;
  String phone = '';
  String password = '';
  String email = '';
  String token = '';
}
