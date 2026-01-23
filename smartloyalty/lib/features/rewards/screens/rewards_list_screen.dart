import 'package:flutter/material.dart';
import '../../../config/routes.dart';
import '../../../config/theme.dart';
import '../widgets/reward_card.dart';

class RewardsListScreen extends StatefulWidget {
  const RewardsListScreen({super.key});

  @override
  State<RewardsListScreen> createState() => _RewardsListScreenState();
}

class _RewardsListScreenState extends State<RewardsListScreen> {
  String _selectedCategory = 'All';

  final List<String> _categories = ['All', 'Food', 'Travel', 'Shopping', 'Entertainment'];

  // TODO: Replace with actual data from FirestoreService
  final List<Map<String, dynamic>> _rewards = [
    {
      'id': '1',
      'title': 'Free Coffee',
      'description': 'Get a free medium coffee at any participating location',
      'pointsCost': 200,
      'category': 'Food',
      'imageUrl': null,
    },
    {
      'id': '2',
      'title': '\$10 Amazon Gift Card',
      'description': 'Redeem for a \$10 Amazon digital gift card',
      'pointsCost': 500,
      'category': 'Shopping',
      'imageUrl': null,
    },
    {
      'id': '3',
      'title': 'Movie Ticket',
      'description': 'One standard movie ticket at AMC Theatres',
      'pointsCost': 800,
      'category': 'Entertainment',
      'imageUrl': null,
    },
    {
      'id': '4',
      'title': 'Airport Lounge Access',
      'description': 'One-time access to premium airport lounges',
      'pointsCost': 1500,
      'category': 'Travel',
      'imageUrl': null,
    },
  ];

  List<Map<String, dynamic>> get _filteredRewards {
    if (_selectedCategory == 'All') return _rewards;
    return _rewards.where((r) => r['category'] == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
      ),
      body: Column(
        children: [
          // Category filter
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() => _selectedCategory = category);
                    },
                    selectedColor: AppTheme.primaryColor,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : AppTheme.textPrimary,
                    ),
                    checkmarkColor: Colors.white,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),

          // Rewards grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _filteredRewards.length,
              itemBuilder: (context, index) {
                final reward = _filteredRewards[index];
                return RewardCard(
                  title: reward['title'],
                  pointsCost: reward['pointsCost'],
                  category: reward['category'],
                  imageUrl: reward['imageUrl'],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.rewardDetail,
                      arguments: {'rewardId': reward['id']},
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
