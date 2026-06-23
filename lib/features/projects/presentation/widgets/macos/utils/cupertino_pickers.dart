import 'dart:async';

import 'package:developer_website_software/features/projects/presentation/enums/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

void showCupertinoCategoryPicker({required BuildContext context, required Signal<String> categorySignal}) {
  unawaited(
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Select Category'),
        actions: CategoryDisplay.values.map((CategoryDisplay cat) {
          return CupertinoActionSheetAction(
            onPressed: () {
              categorySignal.value = cat.key;
              Navigator.pop(context);
            },
            child: Text(cat.value),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ),
    ),
  );
}

void showCupertinoStatusPicker({required BuildContext context, required Signal<String> statusSignal}) {
  unawaited(
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Select Status'),
        actions: StatusDisplay.values.map((StatusDisplay st) {
          return CupertinoActionSheetAction(
            onPressed: () {
              statusSignal.value = st.key;
              Navigator.pop(context);
            },
            child: Text(st.value),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ),
    ),
  );
}
