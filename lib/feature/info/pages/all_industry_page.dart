import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_all_info_cubit.dart';
import '../../../core/entities/enum/Industry.dart';

class AllIndustryPage extends StatelessWidget {
  static const routeName = '/all-industry';

  const AllIndustryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('產業別')),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: const _IndustryList(),
      ),
    );
  }
}

class _IndustryList extends StatelessWidget {
  const _IndustryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllInfoCubit, GetAllInfoState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (industryGroupMap) {
            return ListView.separated(
              itemCount: industryGroupMap.length,
              itemBuilder: (BuildContext context, int index) {
                final entry = industryGroupMap.entries.elementAt(index);
                final name = entry.key.chineseName;
                final count = entry.value.length;
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 15.0,
                    ),
                    child: Text('$name($count)'),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
