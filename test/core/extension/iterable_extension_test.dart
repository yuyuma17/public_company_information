import 'package:flutter_test/flutter_test.dart';
import 'package:public_company_information/core/extension/iterable_extension.dart';

import '../../resource/fake_company.dart';

main() {
  group('GroupBy Test', () {
    test(
      'Test: FakeList can be groupBy Industry to Map<Industry, List<Company>>.',
      () {
        final map = fakeList.groupBy((company) => company.industry);
        expect(map, fakeMap);
      },
    );
  });
}
