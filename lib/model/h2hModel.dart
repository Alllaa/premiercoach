class H2hModel {
  bool success;
  Data data;

  H2hModel({this.success, this.data});

  H2hModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<H2h> h2h;

  Data({this.h2h});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['h2h'] != null) {
      h2h = new List<H2h>();
      json['h2h'].forEach((v) {
        h2h.add(new H2h.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.h2h != null) {
      data['h2h'] = this.h2h.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class H2h {
  String id;
  String date;
  String homeName;
  String awayName;
  String score;
  String htScore;
  String ftScore;
  String etScore;
  String leagueId;
  String homeId;
  String awayId;
  String competitionId;
  String location;
  String scheduled;
  Outcomes outcomes;
  Competition competition;
  League league;

  H2h(
      {this.id,
        this.date,
        this.homeName,
        this.awayName,
        this.score,
        this.htScore,
        this.ftScore,
        this.etScore,
        this.leagueId,
        this.homeId,
        this.awayId,
        this.competitionId,
        this.location,
        this.scheduled,
        this.outcomes,
        this.competition,
        this.league});

  H2h.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    homeName = json['home_name'];
    awayName = json['away_name'];
    score = json['score'];
    htScore = json['ht_score'];
    ftScore = json['ft_score'];
    etScore = json['et_score'];
    leagueId = json['league_id'];
    homeId = json['home_id'];
    awayId = json['away_id'];
    competitionId = json['competition_id'];
    location = json['location'];
    scheduled = json['scheduled'];
    outcomes = json['outcomes'] != null
        ? new Outcomes.fromJson(json['outcomes'])
        : null;
    competition = json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null;
    league =
    json['league'] != null ? new League.fromJson(json['league']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['home_name'] = this.homeName;
    data['away_name'] = this.awayName;
    data['score'] = this.score;
    data['ht_score'] = this.htScore;
    data['ft_score'] = this.ftScore;
    data['et_score'] = this.etScore;
    data['league_id'] = this.leagueId;
    data['home_id'] = this.homeId;
    data['away_id'] = this.awayId;
    data['competition_id'] = this.competitionId;
    data['location'] = this.location;
    data['scheduled'] = this.scheduled;
    if (this.outcomes != null) {
      data['outcomes'] = this.outcomes.toJson();
    }
    if (this.competition != null) {
      data['competition'] = this.competition.toJson();
    }
    if (this.league != null) {
      data['league'] = this.league.toJson();
    }
    return data;
  }
}

class Outcomes {
  String halfTime;
  String fullTime;
  Null extraTime;

  Outcomes({this.halfTime, this.fullTime, this.extraTime});

  Outcomes.fromJson(Map<String, dynamic> json) {
    halfTime = json['half_time'];
    fullTime = json['full_time'];
    extraTime = json['extra_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['half_time'] = this.halfTime;
    data['full_time'] = this.fullTime;
    data['extra_time'] = this.extraTime;
    return data;
  }
}

class Competition {
  String id;
  String name;

  Competition({this.id, this.name});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class League {
  String id;
  String name;
  String countryId;

  League({this.id, this.name, this.countryId});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    return data;
  }
}