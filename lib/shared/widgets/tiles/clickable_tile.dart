import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';

// 可点击项目组件
class ClickableTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final Function() onTap;
  const ClickableTile({
    super.key,
    required this.title,
    this.icon,
    this.iconColor,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: context.textTheme.bodyMedium),
      subtitle: subtitle != null
          ? Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 2),
              child: Text(subtitle!, style: context.textTheme.bodySmall),
            )
          : null,
      leading: icon == null ? null : Icon(icon, size: 20, color: iconColor),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }
}
