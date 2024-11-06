import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sky_store/utils/constants/sizes.dart';

class SkyProfileMenu extends StatelessWidget {
  const SkyProfileMenu({
    super.key,
    required this.onPressed,
    required this.title,
    required this.value,
    this.showIcon = false,
    this.icon = Iconsax.arrow_right_34,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: SkySizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              flex: 5,
              child: Text(value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis),
            ),
            showIcon
                ? Expanded(child: Icon(icon, size: 18))
                : const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
