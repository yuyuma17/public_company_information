import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/entities/company.dart';
import '../../follow/cubit/follow_cubit.dart';

class CompanyInfoPage extends StatelessWidget {
  static const routeName = '/company-info';

  final Company company;

  const CompanyInfoPage({required this.company, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
        actions: [_FollowButton(company)],
      ),
      body: Container(),
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
                ? context.read<FollowCubit>().unFollow(company)
                : context.read<FollowCubit>().follow(company);
          },
          icon: Icon(isFollowed ? Icons.star : Icons.star_border),
        );
      },
    );
  }
}
