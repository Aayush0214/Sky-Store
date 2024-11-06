import 'package:flutter/material.dart';
import 'package:sky_store/utils/constants/colors.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTrackingTimeline extends StatelessWidget {
  const OrderTrackingTimeline({super.key, required this.currentStep});

  final int currentStep; // Index of the current step in the order process

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTimelineTile(
          context,
          stepIndex: 0,
          title: "Order Placed",
          description: "Your order has been placed successfully.",
          activeIcon: Icons.check_circle,
          isFirst: true,
        ),
        buildTimelineTile(
          context,
          stepIndex: 1,
          activeIcon: Icons.watch_later_outlined,
          title: "Processing",
          description: "Your order is being processed.",
        ),
        buildTimelineTile(
          context,
          stepIndex: 2,
          title: "Shipped",
          activeIcon: Icons.local_shipping_outlined,
          description: "Your order has been shipped.",
        ),
        buildTimelineTile(
          context,
          stepIndex: 3,
          title: "Delivered",
          activeIcon: Icons.delivery_dining_outlined,
          description: "Your order has been delivered.",
          isLast: true,
        ),
      ],
    );
  }

  // Method to build each timeline tile
  TimelineTile buildTimelineTile(
    BuildContext context, {
    required int stepIndex,
    required String title,
    required String description,
    required IconData activeIcon,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      axis: TimelineAxis.vertical,
      lineXY: 0.1,
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: stepIndex <= currentStep ? Colors.green : Colors.grey,
        thickness: 3,
      ),
      afterLineStyle: LineStyle(
        color: stepIndex < currentStep ? Colors.green : Colors.grey,
        thickness: 3,
      ),
      indicatorStyle: IndicatorStyle(
          width: 35,
          height: 35,
          color: stepIndex <= currentStep ? Colors.green : Colors.grey,
          padding: EdgeInsets.all(6),
          iconStyle: IconStyle(
              iconData: activeIcon,
              color: currentStep < stepIndex
                  ? SkyColors.darkerGrey
                  : Colors.white)),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.apply(
                color: SkyHelperFunctions.isDarkMode(context)
                    ? stepIndex <= currentStep
                        ? SkyColors.white
                        : SkyColors.darkGrey
                    : SkyColors.black),
          ),
          subtitle: Text(
            description,
            style: Theme.of(context).textTheme.labelSmall!.apply(
                color: SkyHelperFunctions.isDarkMode(context)
                    ? stepIndex <= currentStep
                        ? SkyColors.white
                        : SkyColors.darkGrey
                    : SkyColors.black),
          ),
        ),
      ),
    );
  }
}
