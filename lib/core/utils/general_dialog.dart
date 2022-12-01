import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entities/company.dart';
import '../../feature/follow/cubit/follow_cubit.dart';

showFollowDialog(BuildContext context, {required Company target}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('加入追蹤列表'),
        content: Text('是否將 ${target.code} ${target.abbreviationName}加入追蹤列表內'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('取消'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            child: const Text('加入'),
            onPressed: () {
              context.read<FollowCubit>().follow(target);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

showUnFollowDialog(BuildContext context, {required Company target}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('從追蹤列表中移除'),
        content: Text('是否將 ${target.code} ${target.abbreviationName}從追蹤列表中移除'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('取消'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            child: const Text('移除'),
            onPressed: () {
              context.read<FollowCubit>().unFollow(target);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
