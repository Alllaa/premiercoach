class User{
  String firstName,lastName,urlImage,correct,wrong;
  int score;
  User.fromJson(Map<String, dynamic> parsedJson)
  {
    firstName = parsedJson['firstname'];
    lastName = parsedJson['lastname'];
    urlImage = parsedJson['photo'];
    score = parsedJson['score'];
    correct = parsedJson['correct'].toString();
    wrong = parsedJson['wrong'].toString();
  }
}