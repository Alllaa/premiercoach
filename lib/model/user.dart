class User{
  String firstName,lastName,urlImage;
  int score;
  User.fromJson(Map<String, dynamic> parsedJson)
  {
    firstName = parsedJson['firstname'];
    lastName = parsedJson['lastname'];
    urlImage = parsedJson['photo'];
    score = parsedJson['score'];
  }
}