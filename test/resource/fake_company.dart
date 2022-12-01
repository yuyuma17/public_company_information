import 'package:public_company_information/core/entities/company.dart';
import 'package:public_company_information/core/entities/enum/Industry.dart';

const Company fakeCompany = Company(
  "1111130",
  "000104",
  "臺銀綜合證券股份有限公司",
  "臺銀證券",
  "－ ",
  Industry.uncategorized,
  "臺北市重慶南路1段58號4~9樓",
  "28428390",
  "魏江霖",
  "謝秀賢",
  "林溫琴",
  "副總經理",
  "管理部梁文奎經理",
  "(02)2388-2188",
  "20080102",
  "20131021",
  "新台幣 10.0000元",
  "3000000000",
  "0",
  "0",
  "2",
  "",
  "",
  "",
  "安侯建業聯合會計師事務所",
  "陳富仁",
  "陳奕任",
  "BankTaiwan Sec.",
  "4~9F., No.58, Sec. 1, Chongching S. Rd., Jhongjheng DistrictTaipei City 100, Taiwan (R.O.C.)",
  "(02)2371-7121",
  "sec00301@twfhcsec.com.tw",
  "http://www.twfhcsec.com.tw",
);

const List<Company> fakeList = [fakeCompany];
const Map<Industry, List<Company>> fakeMap = {Industry.uncategorized: fakeList};
