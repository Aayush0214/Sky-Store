import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class UploadDataTile extends StatelessWidget {
  const UploadDataTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final IconData? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: SkyColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: Icon(trailing, size: 28, color: SkyColors.primary),
      onTap: onTap,
      splashColor: Colors.grey.shade50,
    );
  }
}
