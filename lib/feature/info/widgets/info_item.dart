import 'package:flutter/material.dart';
import 'package:public_company_information/core/utils/number_formatter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/entities/company.dart';
import '../../../core/entities/enum/Industry.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String info;
  final bool hasWidthLimit;

  const InfoItem({
    required this.title,
    required this.info,
    this.hasWidthLimit = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 3.0),
        Text(
          info,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
    return hasWidthLimit ? SizedBox(width: 85.0, child: widget) : widget;
  }
}

class BasicInfo extends StatelessWidget {
  final Company company;
  const BasicInfo(this.company, {Key? key}) : super(key: key);

  String checkIfUrlContainPrefixHttp(String url) {
    if (url.startsWith('http://') || url.startsWith('https://')) {
      return url;
    } else {
      return 'https://$url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool containUrl = company.url != "";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基本資料', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 3.0),
        GestureDetector(
          onTap: () async {
            final uri = Uri.parse(checkIfUrlContainPrefixHttp(company.url));
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
          child: Row(
            children: [
              Text(
                company.name,
                style: TextStyle(
                  color: containUrl ? Colors.blue : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              containUrl
                  ? const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(Icons.sports_basketball),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}

class ChairmanItem extends StatelessWidget {
  final Company company;
  const ChairmanItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItem(title: '董事長', info: company.chairman, hasWidthLimit: true);
  }
}

class GeneralManagerItem extends StatelessWidget {
  final Company company;
  const GeneralManagerItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItem(
      title: '總經理',
      info: company.generalManager,
      hasWidthLimit: true,
    );
  }
}

class IndustryItem extends StatelessWidget {
  final Company company;
  const IndustryItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItem(
      title: '產業類別',
      info: company.industry.chineseName,
      hasWidthLimit: true,
    );
  }
}

class EstablishmentDateItem extends StatelessWidget {
  final Company company;
  const EstablishmentDateItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItem(
      title: '公司成立日期',
      info: company.establishmentDate,
      hasWidthLimit: true,
    );
  }
}

class ListingDateItem extends StatelessWidget {
  final Company company;
  const ListingDateItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItem(
      title: '上市日期',
      info: company.listingDate,
      hasWidthLimit: true,
    );
  }
}

class CentralPhoneNumberItem extends StatelessWidget {
  final Company company;
  const CentralPhoneNumberItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItem(
      title: '總機',
      info: company.centralPhoneNumber,
      hasWidthLimit: true,
    );
  }
}

class TaxIdItem extends StatelessWidget {
  final Company company;
  const TaxIdItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItem(title: '統一編號', info: company.taxId, hasWidthLimit: true);
  }
}

class AddressItem extends StatelessWidget {
  final Company company;
  const AddressItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItem(title: '地址', info: company.address);
  }
}

class ContributedCapitalItem extends StatelessWidget {
  final Company company;
  const ContributedCapitalItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItem(
      title: '實收資本額（元）',
      info: '${formatToThousandComma(
        int.parse(company.contributedCapital),
      )} 元',
    );
  }
}

class PerValuePerShareItem extends StatelessWidget {
  final Company company;
  const PerValuePerShareItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String perValuePerShare =
        company.perValuePerShare.replaceAll(" ", "");
    return InfoItem(title: '普通股每股面額', info: perValuePerShare);
  }
}

class IssuedShareItem extends StatelessWidget {
  final Company company;
  const IssuedShareItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 懶得計算已發行普通股了
    const String issuedShare = '0';
    final String privateShare = formatToThousandComma(
      int.parse(company.privateShare),
    );
    return InfoItem(
      title: '已發行普通股股數或 TDR 原股發行股數',
      info: '$issuedShare 股（含私募 $privateShare 股）',
    );
  }
}

class PreferredStockItem extends StatelessWidget {
  final Company company;
  const PreferredStockItem(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItem(
      title: '特別股',
      info: '${formatToThousandComma(
        int.parse(company.preferredStock),
      )} 股',
    );
  }
}
