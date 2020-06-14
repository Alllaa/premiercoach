class MatchInfoModel {
  bool success;
  Match data;

  MatchInfoModel({this.success, this.data});

  MatchInfoModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Match.fromJson(json['data']) : null;
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

class Match {
  List<Fixtures> fixtures;
  String nextPage;
  bool prevPage;

  Match({this.fixtures, this.nextPage, this.prevPage});

  Match.fromJson(Map<String, dynamic> json) {
    if (json['fixtures'] != null) {
      fixtures = new List<Fixtures>();
      json['fixtures'].forEach((v) {
        fixtures.add(new Fixtures.fromJson(v));
      });
    }
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fixtures != null) {
      data['fixtures'] = this.fixtures.map((v) => v.toJson()).toList();
    }
    data['next_page'] = this.nextPage;
    data['prev_page'] = this.prevPage;
    return data;
  }
}

class Fixtures {
  String id;
  String date;
  String time;
  String round;
  String homeName;
  String awayName;
  String location;
  String leagueId;
  String competitionId;
  String homeId;
  String awayId;
  Competition competition;
  League league;

  Fixtures(
      {this.id,
        this.date,
        this.time,
        this.round,
        this.homeName,
        this.awayName,
        this.location,
        this.leagueId,
        this.competitionId,
        this.homeId,
        this.awayId,
        this.competition,
        this.league});

  Fixtures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    round = json['round'];
    homeName = json['home_name'];
    awayName = json['away_name'];
    location = json['location'];
    leagueId = json['league_id'];
    competitionId = json['competition_id'];
    homeId = json['home_id'];
    awayId = json['away_id'];
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
    data['time'] = this.time;
    data['round'] = this.round;
    data['home_name'] = this.homeName;
    data['away_name'] = this.awayName;
    data['location'] = this.location;
    data['league_id'] = this.leagueId;
    data['competition_id'] = this.competitionId;
    data['home_id'] = this.homeId;
    data['away_id'] = this.awayId;
    if (this.competition != null) {
      data['competition'] = this.competition.toJson();
    }
    if (this.league != null) {
      data['league'] = this.league.toJson();
    }
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