import 'package:flutter/material.dart';
import 'curved_edges.dart';

class SkyCurvedEdgeWidget extends StatelessWidget {
  const SkyCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: SkyCurvedEdges(), child: child);
  }
}
