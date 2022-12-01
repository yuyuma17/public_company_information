// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Company _$$_CompanyFromJson(Map<String, dynamic> json) => _$_Company(
      json['出表日期'] as String,
      json['公司代號'] as String,
      json['公司名稱'] as String,
      json['公司簡稱'] as String,
      json['外國企業註冊地國'] as String,
      $enumDecode(_$IndustryEnumMap, json['產業別']),
      json['住址'] as String,
      json['營利事業統一編號'] as String,
      json['董事長'] as String,
      json['總經理'] as String,
      json['發言人'] as String,
      json['發言人職稱'] as String,
      json['代理發言人'] as String,
      json['總機電話'] as String,
      json['成立日期'] as String,
      json['上市日期'] as String,
      json['普通股每股面額'] as String,
      json['實收資本額'] as String,
      json['私募股數'] as String,
      json['特別股'] as String,
      json['編制財務報表類型'] as String,
      json['股票過戶機構'] as String,
      json['過戶電話'] as String,
      json['過戶地址'] as String,
      json['簽證會計師事務所'] as String,
      json['簽證會計師1'] as String,
      json['簽證會計師2'] as String,
      json['英文簡稱'] as String,
      json['英文通訊地址'] as String,
      json['傳真機號碼'] as String,
      json['電子郵件信箱'] as String,
      json['網址'] as String,
    );

Map<String, dynamic> _$$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      '出表日期': instance.publicationDate,
      '公司代號': instance.code,
      '公司名稱': instance.name,
      '公司簡稱': instance.abbreviationName,
      '外國企業註冊地國': instance.registrationCountry,
      '產業別': _$IndustryEnumMap[instance.industry]!,
      '住址': instance.address,
      '營利事業統一編號': instance.taxId,
      '董事長': instance.chairman,
      '總經理': instance.generalManager,
      '發言人': instance.spokesman,
      '發言人職稱': instance.spokesmanTitle,
      '代理發言人': instance.proxySpokesman,
      '總機電話': instance.centralPhoneNumber,
      '成立日期': instance.establishmentDate,
      '上市日期': instance.listingDate,
      '普通股每股面額': instance.perValuePerShare,
      '實收資本額': instance.contributedCapital,
      '私募股數': instance.privateShare,
      '特別股': instance.preferredStock,
      '編制財務報表類型': instance.financialStatementType,
      '股票過戶機構': instance.stockTransferAgency,
      '過戶電話': instance.transferPhoneNumber,
      '過戶地址': instance.transferAddress,
      '簽證會計師事務所': instance.accountingFirm,
      '簽證會計師1': instance.accountantOne,
      '簽證會計師2': instance.accountTwo,
      '英文簡稱': instance.englishAbbreviation,
      '英文通訊地址': instance.englishAddress,
      '傳真機號碼': instance.faxNumber,
      '電子郵件信箱': instance.email,
      '網址': instance.url,
    };

const _$IndustryEnumMap = {
  Industry.uncategorized: 'XX',
  Industry.cement: '01',
  Industry.food: '02',
  Industry.plastic: '03',
  Industry.textile: '04',
  Industry.electricalMachinery: '05',
  Industry.electricalCable: '06',
  Industry.chemicalScience: '07',
  Industry.iron: '10',
  Industry.car: '12',
  Industry.electronics: '13',
  Industry.buildingMaterials: '14',
  Industry.shipping: '15',
  Industry.tourism: '16',
  Industry.finance: '17',
  Industry.trade: '18',
  Industry.others: '20',
  Industry.combination: '98',
};
