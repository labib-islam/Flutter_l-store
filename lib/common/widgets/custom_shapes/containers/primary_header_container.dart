import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class LPrimaryHeaderContainer extends StatelessWidget {
  const LPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LCurvedEdgeWidget(
      child: Container(
        color: LColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              /// -- Background Custom Shapes
              Positioned(
                  top: -150,
                  right: -250,
                  child: LCircularContainer(
                    backgroundColor: LColors.textWhite.withOpacity(0.1),
                  )),
              Positioned(
                  top: 100,
                  right: -300,
                  child: LCircularContainer(
                    backgroundColor: LColors.textWhite.withOpacity(0.1),
                  )),
              child,
            ],
          ),
        ),
      ),
    );
  }
}