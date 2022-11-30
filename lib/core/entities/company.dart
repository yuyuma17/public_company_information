import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  const factory Company(
    @JsonKey(name: '出表日期') String a,
    @JsonKey(name: '公司代號') String b,
    @JsonKey(name: '公司名稱') String c,
    @JsonKey(name: '公司簡稱') String d,
    @JsonKey(name: '外國企業註冊地國') String e,
    @JsonKey(name: '產業別') String f,
    @JsonKey(name: '住址') String g,
    @JsonKey(name: '營利事業統一編號') String h,
    @JsonKey(name: '董事長') String i,
    @JsonKey(name: '總經理') String j,
    @JsonKey(name: '發言人') String k,
    @JsonKey(name: '發言人職稱') String l,
    @JsonKey(name: '代理發言人') String m,
    @JsonKey(name: '總機電話') String n,
    @JsonKey(name: '成立日期') String o,
    @JsonKey(name: '上市日期') String p,
    @JsonKey(name: '普通股每股面額') String q,
    @JsonKey(name: '實收資本額') String r,
    @JsonKey(name: '私募股數') String s,
    @JsonKey(name: '特別股') String t,
    @JsonKey(name: '編制財務報表類型') String u,
    @JsonKey(name: '股票過戶機構') String v,
    @JsonKey(name: '過戶電話') String w,
    @JsonKey(name: '過戶地址') String x,
    @JsonKey(name: '簽證會計師事務所') String y,
    @JsonKey(name: '簽證會計師1') String z,
    @JsonKey(name: '簽證會計師2') String a1,
    @JsonKey(name: '英文簡稱') String a2,
    @JsonKey(name: '英文通訊地址') String a3,
    @JsonKey(name: '傳真機號碼') String a4,
    @JsonKey(name: '電子郵件信箱') String a5,
    @JsonKey(name: '網址') String a6,
  ) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
