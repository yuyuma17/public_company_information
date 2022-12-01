import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/info_item.dart';
import '../../../core/entities/enum/Industry.dart';
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
              _BasicInfo(company),
              const _VerticalSpace(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoItem(
                    title: '董事長',
                    info: company.chairman,
                    hasWidthLimit: true,
                  ),
                  const _HorizontalSpace(),
                  InfoItem(
                    title: '總經理',
                    info: company.generalManager,
                    hasWidthLimit: true,
                  ),
                  const _HorizontalSpace(),
                  InfoItem(
                    title: '產業類別',
                    info: company.industry.chineseName,
                    hasWidthLimit: true,
                  ),
                ],
              ),
              const _VerticalSpace(),
              const Divider(),
              const _VerticalSpace(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoItem(
                    title: '總機',
                    info: company.centralPhoneNumber,
                    hasWidthLimit: true,
                  ),
                  const _HorizontalSpace(),
                  InfoItem(
                    title: '統一編號',
                    info: company.taxId,
                    hasWidthLimit: true,
                  ),
                ],
              ),
              const _VerticalSpace(),
              InfoItem(title: '地址', info: company.address),
              const _VerticalSpace(),
              const Divider(),
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

class _BasicInfo extends StatelessWidget {
  final Company company;
  const _BasicInfo(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基本資料', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 3.0),
        GestureDetector(
          onTap: () async {
            final url = Uri.parse(company.url);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          child: Row(
            children: [
              Text(
                company.name,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(Icons.sports_basketball),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _VerticalSpace extends StatelessWidget {
  const _VerticalSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20.0);
  }
}

class _HorizontalSpace extends StatelessWidget {
  const _HorizontalSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 55.0);
  }
}
