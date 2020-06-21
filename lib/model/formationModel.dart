class Squad {
  List<Formation> formation;

  Squad({this.formation});

  Squad.fromJson(Map<String, dynamic> json) {
    if (json['Formation'] != null) {
      formation = new List<Formation>();
      json['Formation'].forEach((v) {
        formation.add(new Formation.fromJson(v));
      });
    }
  }
}

class Formation {
  GoalKeeper goalKeeper;
  GoalKeeper leftCentralDefender;
  GoalKeeper rightCentralDefender;
  GoalKeeper leftWingBack;
  GoalKeeper rightWingBack;
  GoalKeeper playMakerMidFielders;
  GoalKeeper beastMidFielders;
  GoalKeeper controllerMidFielders;
  GoalKeeper leftWingAttacker;
  GoalKeeper rightWingAttacker;
  GoalKeeper strikerAttacker;

  Formation(
      {this.goalKeeper,
        this.leftCentralDefender,
        this.rightCentralDefender,
        this.leftWingBack,
        this.rightWingBack,
        this.playMakerMidFielders,
        this.beastMidFielders,
        this.controllerMidFielders,
        this.leftWingAttacker,
        this.rightWingAttacker,
        this.strikerAttacker});

  Formation.fromJson(Map<String, dynamic> json) {
    goalKeeper = json['GoalKeeper'] != null
        ? new GoalKeeper.fromJson(json['GoalKeeper'])
        : null;
    leftCentralDefender = json['Left Central Defender'] != null
        ? new GoalKeeper.fromJson(json['Left Central Defender'])
        : null;
    rightCentralDefender = json['Right Central Defender'] != null
        ? new GoalKeeper.fromJson(json['Right Central Defender'])
        : null;
    leftWingBack = json['Left Wing Back'] != null
        ? new GoalKeeper.fromJson(json['Left Wing Back'])
        : null;
    rightWingBack = json['Right Wing Back'] != null
        ? new GoalKeeper.fromJson(json['Right Wing Back'])
        : null;
    playMakerMidFielders = json['PlayMaker Mid_Fielders'] != null
        ? new GoalKeeper.fromJson(json['PlayMaker Mid_Fielders'])
        : null;
    beastMidFielders = json['Beast Mid_Fielders'] != null
        ? new GoalKeeper.fromJson(json['Beast Mid_Fielders'])
        : null;
    controllerMidFielders = json['Controller Mid_Fielders'] != null
        ? new GoalKeeper.fromJson(json['Controller Mid_Fielders'])
        : null;
    leftWingAttacker = json['Left Wing Attacker'] != null
        ? new GoalKeeper.fromJson(json['Left Wing Attacker'])
        : null;
    rightWingAttacker = json['Right Wing Attacker'] != null
        ? new GoalKeeper.fromJson(json['Right Wing Attacker'])
        : null;
    strikerAttacker = json['Striker Attacker'] != null
        ? new GoalKeeper.fromJson(json['Striker Attacker'])
        : null;
  }
}

class GoalKeeper {
  String name;
  String numbers;
  String photos;
  String position;

  GoalKeeper({this.name, this.numbers, this.photos, this.position});

  GoalKeeper.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    numbers = json['Numbers'];
    photos = json['Photos'];
    position = json['Position'];
  }
}
