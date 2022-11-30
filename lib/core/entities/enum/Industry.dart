import 'package:freezed_annotation/freezed_annotation.dart';

enum Industry {
  @JsonValue('XX')
  uncategorized,
  @JsonValue('01')
  cement,
  @JsonValue('02')
  food,
  @JsonValue('03')
  plastic,
  @JsonValue('04')
  textile,
  @JsonValue('05')
  electricalMachinery,
  @JsonValue('06')
  electricalCable,
  @JsonValue('07')
  chemicalScience,
  @JsonValue('10')
  iron,
  @JsonValue('12')
  car,
  @JsonValue('13')
  electronics,
  @JsonValue('14')
  buildingMaterials,
  @JsonValue('15')
  shipping,
  @JsonValue('16')
  tourism,
  @JsonValue('17')
  finance,
  @JsonValue('18')
  trade,
  @JsonValue('20')
  others,
  @JsonValue('98')
  combination,
}

extension ExtVariables on Industry {
  String get chineseName {
    switch (this) {
      case Industry.uncategorized:
        return '未分類';
      case Industry.cement:
        return '水泥工業';
      case Industry.food:
        return '食品工業';
      case Industry.plastic:
        return '塑膠工業';
      case Industry.textile:
        return '紡織工業';
      case Industry.electricalMachinery:
        return '電機機械';
      case Industry.electricalCable:
        return '電器電纜';
      case Industry.chemicalScience:
        return '化學生技業';
      case Industry.iron:
        return '鋼鐵工業';
      case Industry.car:
        return '汽車工業';
      case Industry.electronics:
        return '電子工業';
      case Industry.buildingMaterials:
        return '建材營造';
      case Industry.shipping:
        return '航運';
      case Industry.tourism:
        return '觀光';
      case Industry.finance:
        return '金融';
      case Industry.trade:
        return '貿易百貨';
      case Industry.others:
        return '其他';
      case Industry.combination:
        return '綜合';
    }
  }
}
