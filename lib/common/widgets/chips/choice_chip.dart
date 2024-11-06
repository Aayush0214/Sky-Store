import 'package:flutter/material.dart';
import 'package:sky_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class SkyChoiceChip extends StatelessWidget {
  const SkyChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = SkyHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? SkyColors.white : null),
        avatar: isColor
            ? SkyCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: SkyHelperFunctions.getColor(text)!)
            : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        // Make icon in the center
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? SkyHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
