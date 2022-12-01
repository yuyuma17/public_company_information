import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum/Industry.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  const factory Company(
    @JsonKey(name: '出表日期') String publicationDate,
    @JsonKey(name: '公司代號') String code,
    @JsonKey(name: '公司名稱') String name,
    @JsonKey(name: '公司簡稱') String abbreviationName,
    @JsonKey(name: '外國企業註冊地國') String registrationCountry,
    @JsonKey(name: '產業別') Industry industry,
    @JsonKey(name: '住址') String address,
    @JsonKey(name: '營利事業統一編號') String taxId,
    @JsonKey(name: '董事長') String chairman,
    @JsonKey(name: '總經理') String generalManager,
    @JsonKey(name: '發言人') String spokesman,
    @JsonKey(name: '發言人職稱') String spokesmanTitle,
    @JsonKey(name: '代理發言人') String proxySpokesman,
    @JsonKey(name: '總機電話') String centralPhoneNumber,
    @JsonKey(name: '成立日期') String establishmentDate,
    @JsonKey(name: '上市日期') String listingDate,
    @JsonKey(name: '普通股每股面額') String perValuePerShare,
    @JsonKey(name: '實收資本額') String contributedCapital,
    @JsonKey(name: '私募股數') String privateShare,
    @JsonKey(name: '特別股') String preferredStock,
    @JsonKey(name: '編制財務報表類型') String financialStatementType,
    @JsonKey(name: '股票過戶機構') String stockTransferAgency,
    @JsonKey(name: '過戶電話') String transferPhoneNumber,
    @JsonKey(name: '過戶地址') String transferAddress,
    @JsonKey(name: '簽證會計師事務所') String accountingFirm,
    @JsonKey(name: '簽證會計師1') String accountantOne,
    @JsonKey(name: '簽證會計師2') String accountTwo,
    @JsonKey(name: '英文簡稱') String englishAbbreviation,
    @JsonKey(name: '英文通訊地址') String englishAddress,
    @JsonKey(name: '傳真機號碼') String faxNumber,
    @JsonKey(name: '電子郵件信箱') String email,
    @JsonKey(name: '網址') String url,
  ) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
