class Statistics {
  bool success;
  Data data;

  Statistics({this.success, this.data});

  Statistics.fromJson(Map<String, dynamic> json) {
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
  String yellowCards;
  String redCards;
  String substitutions;
  String possesion;
  String freeKicks;
  String goalKicks;
  String throwIns;
  String offsides;
  String corners;
  String shotsOnTarget;
  String shotsOffTarget;
  String attemptsOnGoal;
  String saves;
  String fauls;
  String treatments;
  String penalties;
  String shotsBlocked;
  String dangerousAttacks;
  String attacks;

  Data(
      {this.yellowCards,
        this.redCards,
        this.substitutions,
        this.possesion,
        this.freeKicks,
        this.goalKicks,
        this.throwIns,
        this.offsides,
        this.corners,
        this.shotsOnTarget,
        this.shotsOffTarget,
        this.attemptsOnGoal,
        this.saves,
        this.fauls,
        this.treatments,
        this.penalties,
        this.shotsBlocked,
        this.dangerousAttacks,
        this.attacks});

  Data.fromJson(Map<String, dynamic> json) {
    yellowCards = json['yellow_cards'];
    redCards = json['red_cards'];
    substitutions = json['substitutions'];
    possesion = json['possesion'];
    freeKicks = json['free_kicks'];
    goalKicks = json['goal_kicks'];
    throwIns = json['throw_ins'];
    offsides = json['offsides'];
    corners = json['corners'];
    shotsOnTarget = json['shots_on_target'];
    shotsOffTarget = json['shots_off_target'];
    attemptsOnGoal = json['attempts_on_goal'];
    saves = json['saves'];
    fauls = json['fauls'];
    treatments = json['treatments'];
    penalties = json['penalties'];
    shotsBlocked = json['shots_blocked'];
    dangerousAttacks = json['dangerous_attacks'];
    attacks = json['attacks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yellow_cards'] = this.yellowCards;
    data['red_cards'] = this.redCards;
    data['substitutions'] = this.substitutions;
    data['possesion'] = this.possesion;
    data['free_kicks'] = this.freeKicks;
    data['goal_kicks'] = this.goalKicks;
    data['throw_ins'] = this.throwIns;
    data['offsides'] = this.offsides;
    data['corners'] = this.corners;
    data['shots_on_target'] = this.shotsOnTarget;
    data['shots_off_target'] = this.shotsOffTarget;
    data['attempts_on_goal'] = this.attemptsOnGoal;
    data['saves'] = this.saves;
    data['fauls'] = this.fauls;
    data['treatments'] = this.treatments;
    data['penalties'] = this.penalties;
    data['shots_blocked'] = this.shotsBlocked;
    data['dangerous_attacks'] = this.dangerousAttacks;
    data['attacks'] = this.attacks;
    return data;
  }
}