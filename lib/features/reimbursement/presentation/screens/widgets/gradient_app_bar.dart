import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final List<Color>? gradientColors;
  final TextStyle? titleStyle;
  final Color? backIconColor;
  final double? elevation;

  const GradientAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.actions,
    this.gradientColors,
    this.titleStyle,
    this.backIconColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ?? const [Color(0xFF0C4886), Color(0xFF157FEC)];

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: elevation ?? 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: colors,
          ),
        ),
      ),
      title: Text(
        title,
        style:
            titleStyle ??
            const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios, color: backIconColor ?? Colors.white),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
