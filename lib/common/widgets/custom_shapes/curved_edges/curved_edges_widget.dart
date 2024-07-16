import 'package:flutter/material.dart';

import 'curved_edges.dart';

class LCurvedEdgeWidget extends StatelessWidget {
  const LCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: LCustomCurvedEdges(),
      child: child,
    );
  }
}