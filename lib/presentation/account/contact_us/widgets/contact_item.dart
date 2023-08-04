part of '../contact_us_page.dart';

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.extraDarkGreen,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
