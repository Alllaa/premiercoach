class RankingModel {
  List<Users> users;

  RankingModel({this.users});

  RankingModel.fromJson(Map<String, dynamic> json) {
    if (json['Users'] != null) {
      users = new List<Users>();
      json['Users'].forEach((v) {
        users.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['Users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String email;
  String firstname;
  String lastname;
  int correct;
  int wrong;
  int score;

  Users(
      {this.email,
        this.firstname,
        this.lastname,
        this.correct,
        this.wrong,
        this.score});

  Users.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    correct = json['correct'];
    wrong = json['wrong'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['correct'] = this.correct;
    data['wrong'] = this.wrong;
    data['score'] = this.score;
    return data;
  }
}