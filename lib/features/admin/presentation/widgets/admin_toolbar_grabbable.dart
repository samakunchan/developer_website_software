import 'package:flutter/cupertino.dart';

/// Not sure if Window and Linux need it. Only macos has this design. Window and Linux have real toolbar to grab normally.
class AdminToolbarGrabbable extends StatefulWidget {
  const AdminToolbarGrabbable({required this.child, super.key});
  final Widget child;

  @override
  State<AdminToolbarGrabbable> createState() => _AdminToolbarGrabbableState();
}

class _AdminToolbarGrabbableState extends State<AdminToolbarGrabbable> {
  bool _isGrabbing = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: _isGrabbing ? SystemMouseCursors.grabbing : SystemMouseCursors.grab,
      child: GestureDetector(
        onPanDown: (_) => setState(() => _isGrabbing = true),
        onPanEnd: (_) => setState(() => _isGrabbing = false),
        onPanCancel: () => setState(() => _isGrabbing = false),
        child: widget.child,
      ),
    );
  }
}
