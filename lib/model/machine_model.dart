class MachineModel {
  String awayWinAwaygoals;
  String awayWinHomegoals;
  String awayWinPercentage;
  String drawAwaygoals;
  String drawHomegoals;
  String drawPercentage;
  String homeWinAwaygoals;
  String homeWinHomegoals;
  String homeWinPercentage;

  MachineModel(
      {this.awayWinAwaygoals,
        this.awayWinHomegoals,
        this.awayWinPercentage,
        this.drawAwaygoals,
        this.drawHomegoals,
        this.drawPercentage,
        this.homeWinAwaygoals,
        this.homeWinHomegoals,
        this.homeWinPercentage});
  MachineModel.fromJson(Map<String, dynamic> json) {
    awayWinAwaygoals = json['AwayWin_Awaygoals'];
    awayWinHomegoals = json['AwayWin_Homegoals'];
    awayWinPercentage = json['AwayWin_Percentage'];
    drawAwaygoals = json['Draw_Awaygoals'];
    drawHomegoals = json['Draw_Homegoals'];
    drawPercentage = json['Draw_Percentage'];
    homeWinAwaygoals = json['HomeWin_Awaygoals'];
    homeWinHomegoals = json['HomeWin_Homegoals'];
    homeWinPercentage = json['HomeWin_Percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AwayWin_Awaygoals'] = this.awayWinAwaygoals;
    data['AwayWin_Homegoals'] = this.awayWinHomegoals;
    data['AwayWin_Percentage'] = this.awayWinPercentage;
    data['Draw_Awaygoals'] = this.drawAwaygoals;
    data['Draw_Homegoals'] = this.drawHomegoals;
    data['Draw_Percentage'] = this.drawPercentage;
    data['HomeWin_Awaygoals'] = this.homeWinAwaygoals;
    data['HomeWin_Homegoals'] = this.homeWinHomegoals;
    data['HomeWin_Percentage'] = this.homeWinPercentage;
    return data;
  }
}
