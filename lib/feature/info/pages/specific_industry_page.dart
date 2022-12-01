import 'package:flutter/material.dart';

import 'company_info_page.dart';
import '../../../core/entities/company.dart';

class SpecificIndustryPage extends StatelessWidget {
  static const routeName = '/specific-industry';

  final String industryChineseName;
  final List<Company> companies;

  const SpecificIndustryPage({
    required this.industryChineseName,
    required this.companies,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(industryChineseName)),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: _CompanyList(companies),
      ),
    );
  }
}

class _CompanyList extends StatelessWidget {
  final List<Company> companies;
  const _CompanyList(this.companies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: companies.length,
      itemBuilder: (BuildContext context, int index) {
        final company = companies[index];
        return GestureDetector(
          onTap: () {
            final args = {'company': company};
            Navigator.of(context).pushNamed(
              CompanyInfoPage.routeName,
              arguments: args,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 15.0,
            ),
            child: Text('${company.code} ${company.abbreviationName}'),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
