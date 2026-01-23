import 'package:flutter/material.dart';
import '../../../config/theme.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Get actual transaction data from provider
    final activities = [
      _ActivityItem(
        title: 'Coffee Purchase',
        subtitle: 'StarBucks Coffee',
        points: 50,
        isPositive: true,
        date: 'Today',
        icon: Icons.coffee,
      ),
      _ActivityItem(
        title: 'Free Drink Redeemed',
        subtitle: 'Reward Redemption',
        points: -200,
        isPositive: false,
        date: 'Yesterday',
        icon: Icons.card_giftcard,
      ),
      _ActivityItem(
        title: 'Grocery Shopping',
        subtitle: 'Whole Foods Market',
        points: 120,
        isPositive: true,
        date: 'Jan 20',
        icon: Icons.shopping_cart,
      ),
      _ActivityItem(
        title: 'Welcome Bonus',
        subtitle: 'Account Created',
        points: 100,
        isPositive: true,
        date: 'Jan 18',
        icon: Icons.celebration,
      ),
    ];

    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: activities.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = activities[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: item.isPositive
                  ? AppTheme.successColor.withOpacity(0.1)
                  : AppTheme.errorColor.withOpacity(0.1),
              child: Icon(
                item.icon,
                color: item.isPositive ? AppTheme.successColor : AppTheme.errorColor,
                size: 20,
              ),
            ),
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              item.subtitle,
              style: const TextStyle(fontSize: 12),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${item.isPositive ? '+' : ''}${item.points} pts',
                  style: TextStyle(
                    color: item.isPositive ? AppTheme.successColor : AppTheme.errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item.date,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ActivityItem {
  final String title;
  final String subtitle;
  final int points;
  final bool isPositive;
  final String date;
  final IconData icon;

  _ActivityItem({
    required this.title,
    required this.subtitle,
    required this.points,
    required this.isPositive,
    required this.date,
    required this.icon,
  });
}
