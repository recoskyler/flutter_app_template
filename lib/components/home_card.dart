import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final void Function()? onTap;

  const HomeCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      isThreeLine: false,
      trailing: const Icon(Icons.arrow_forward),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
        size: 40,
      ),
      title: Text(
        title,
        maxLines: 1,
        style: Theme.of(context).textTheme.titleMedium,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subTitle,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
