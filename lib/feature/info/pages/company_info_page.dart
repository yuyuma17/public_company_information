import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/info_item.dart';
import '../../../core/entities/company.dart';
import '../../follow/cubit/follow_cubit.dart';
import '../../../core/utils/general_dialog.dart';

class CompanyInfoPage extends StatelessWidget {
  static const routeName = '/company-info';

  final Company company;

  const CompanyInfoPage({required this.company, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${company.code} ${company.abbreviationName}'),
        actions: [_FollowButton(company)],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BasicInfo(company),
              const _VerticalSpace(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChairmanItem(company),
                  const _HorizontalSpace(),
                  GeneralManagerItem(company),
                  const _HorizontalSpace(),
                  IndustryItem(company),
                ],
              ),
              const _VerticalSpace(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EstablishmentDateItem(company),
                  const _HorizontalSpace(),
                  ListingDateItem(company),
                ],
              ),
              const _Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CentralPhoneNumberItem(company),
                  const _HorizontalSpace(),
                  TaxIdItem(company),
                ],
              ),
              const _VerticalSpace(),
              AddressItem(company),
              const _Divider(),
              ContributedCapitalItem(company),
              const _VerticalSpace(),
              PerValuePerShareItem(company),
              const _VerticalSpace(),
              IssuedShareItem(company),
              const _VerticalSpace(),
              PreferredStockItem(company),
            ],
          ),
        ),
      ),
    );
  }
}

class _FollowButton extends StatelessWidget {
  final Company company;

  const _FollowButton(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowCubit, List<Company>>(
      builder: (context, followedCompanies) {
        bool isFollowed = false;
        for (var followedCompany in followedCompanies) {
          if (followedCompany.code == company.code) {
            isFollowed = true;
            break;
          }
        }
        return IconButton(
          onPressed: () {
            isFollowed
                ? showUnFollowDialog(context, target: company)
                : showFollowDialog(context, target: company);
          },
          icon: Icon(isFollowed ? Icons.star : Icons.star_border),
        );
      },
    );
  }
}

class _VerticalSpace extends StatelessWidget {
  const _VerticalSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 15.0);
  }
}

class _HorizontalSpace extends StatelessWidget {
  const _HorizontalSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 55.0);
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Divider(),
    );
  }
}
