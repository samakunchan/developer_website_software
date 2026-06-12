import 'dart:io';

import 'package:flutter/widgets.dart';

abstract class PlatformStatefulWidget extends StatefulWidget {
  const PlatformStatefulWidget({super.key});

  @override
  PlatformState<PlatformStatefulWidget> createState();
}

abstract class PlatformState<T extends PlatformStatefulWidget> extends State<T> {
  Widget buildCupertino(BuildContext context);
  Widget buildFluent(BuildContext context);
  Widget buildMaterial(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS || Platform.isIOS) {
      return buildCupertino(context);
    } else if (Platform.isWindows) {
      return buildFluent(context);
    }

    return buildMaterial(context);
  }
}
