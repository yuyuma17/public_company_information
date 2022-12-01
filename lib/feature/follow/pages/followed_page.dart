import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:public_company_information/core/utils/general_dialog.dart';

import '../cubit/follow_cubit.dart';
import '../../../core/entities/company.dart';
import '../../info/pages/company_info_page.dart';

class FollowedPage extends StatelessWidget {
  static const routeName = '/followed';

  const FollowedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('追蹤')),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: const _FollowedList(),
      ),
    );
  }
}

class _FollowedList extends StatelessWidget {
  const _FollowedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowCubit, List<Company>>(
      builder: (context, followedCompanies) {
        return ListView.separated(
          itemCount: followedCompanies.length,
          itemBuilder: (BuildContext context, int index) {
            final followedCompany = followedCompanies[index];
            return Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {
                      showUnFollowDialog(context, target: followedCompany);
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: '移除',
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  final args = {'company': followedCompany};
                  Navigator.of(context).pushNamed(
                    CompanyInfoPage.routeName,
                    arguments: args,
                  );
                },
                child: ListTile(
                  title: Text(
                    '${followedCompany.code} ${followedCompany.abbreviationName}',
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      },
    );
  }
}
