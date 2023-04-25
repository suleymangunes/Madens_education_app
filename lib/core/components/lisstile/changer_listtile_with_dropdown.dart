import 'package:flutter/material.dart';

class ChangerListtileWithDropdown extends StatelessWidget {
  const ChangerListtileWithDropdown(
      {super.key, required this.icon, required this.title, required this.alertTitle, required this.child});

  final Icon icon;
  final String title;
  final String alertTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDialog(context);
      },
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          alertTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: child,
      ),
    );
  }
}
