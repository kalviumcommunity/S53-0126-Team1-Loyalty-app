import 'package:flutter/material.dart';
import '../../../config/theme.dart';
import '../../../core/utils/helpers.dart';
import '../../../shared/widgets/custom_button.dart';

class RewardDetailScreen extends StatelessWidget {
  final String? rewardId;

  const RewardDetailScreen({super.key, this.rewardId});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch reward details using rewardId from FirestoreService
    // For now, using mock data
    const reward = {
      'title': 'Free Coffee',
      'description':
          'Get a free medium coffee at any participating location. Valid at over 5,000 locations nationwide. Choose from any of our signature blends or seasonal specials.',
      'pointsCost': 200,
      'category': 'Food',
      'terms': [
        'Valid for one medium hot or iced coffee',
        'Cannot be combined with other offers',
        'Must be redeemed within 30 days',
        'Available at participating locations only',
      ],
    };

    const userPoints = 1250;
    final canRedeem = userPoints >= (reward['pointsCost'] as int);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Image header
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppTheme.primaryColor.withOpacity(0.1),
                child: const Icon(
                  Icons.card_giftcard,
                  size: 80,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
          ),

          // Content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Category chip
                Chip(
                  label: Text(
                    reward['category'] as String,
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                ),
                const SizedBox(height: 8),

                // Title
                Text(
                  reward['title'] as String,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Points cost
                Row(
                  children: [
                    const Icon(Icons.stars, color: AppTheme.primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      '${Helpers.formatPoints(reward['pointsCost'] as int)} points',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Description
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  reward['description'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),

                // Terms
                const Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...(reward['terms'] as List).map(
                  (term) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle,
                            size: 18, color: AppTheme.successColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            term as String,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100), // Space for bottom button
              ]),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Points info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Your Points'),
                  Text(
                    Helpers.formatPoints(userPoints),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('After Redemption'),
                  Text(
                    Helpers.formatPoints(userPoints - (reward['pointsCost'] as int)),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: canRedeem ? AppTheme.successColor : AppTheme.errorColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: canRedeem ? 'Redeem Reward' : 'Not Enough Points',
                onPressed: canRedeem
                    ? () {
                        // TODO: Implement redemption
                        Helpers.showSnackBar(context, 'Reward redeemed successfully!');
                        Navigator.pop(context);
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
