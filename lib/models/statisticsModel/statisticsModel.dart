class StatisticsModel {
  String? message;
  Result? result;

  StatisticsModel({this.message, this.result});

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  Investors? investors;
  Investors? business;
  Investors? raisedFunds;
  Investors? verifiedFunds;
  Investors? cities;
  Investors? countries;
  Continents? continents;
  String? sId;
  int? iV;

  Result(
      {this.investors,
        this.business,
        this.raisedFunds,
        this.verifiedFunds,
        this.cities,
        this.countries,
        this.continents,
        this.sId,
        this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    investors = json['investors'] != null
        ? new Investors.fromJson(json['investors'])
        : null;
    business = json['business'] != null
        ? new Investors.fromJson(json['business'])
        : null;
    raisedFunds = json['raised_funds'] != null
        ? new Investors.fromJson(json['raised_funds'])
        : null;
    verifiedFunds = json['verified_funds'] != null
        ? new Investors.fromJson(json['verified_funds'])
        : null;
    cities =
    json['cities'] != null ? new Investors.fromJson(json['cities']) : null;
    countries = json['countries'] != null
        ? new Investors.fromJson(json['countries'])
        : null;
    continents = json['continents'] != null
        ? new Continents.fromJson(json['continents'])
        : null;
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.investors != null) {
      data['investors'] = this.investors!.toJson();
    }
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    if (this.raisedFunds != null) {
      data['raised_funds'] = this.raisedFunds!.toJson();
    }
    if (this.verifiedFunds != null) {
      data['verified_funds'] = this.verifiedFunds!.toJson();
    }
    if (this.cities != null) {
      data['cities'] = this.cities!.toJson();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.toJson();
    }
    if (this.continents != null) {
      data['continents'] = this.continents!.toJson();
    }
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class Investors {
  int? number;
  int? dailyIncrease;

  Investors({this.number, this.dailyIncrease});

  Investors.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    dailyIncrease = json['daily_increase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['daily_increase'] = this.dailyIncrease;
    return data;
  }
}

class Continents {
  int? number;

  Continents({this.number});

  Continents.fromJson(Map<String, dynamic> json) {
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    return data;
  }
}
