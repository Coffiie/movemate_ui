import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movemate_ui/application/shipment_history/shipment_tab_provider.dart';
import 'package:movemate_ui/mock_data.dart';
import 'package:movemate_ui/presentation/core/extensions/on_build_context.dart';
import 'package:movemate_ui/presentation/core/theme/app_colors.dart';
import 'package:movemate_ui/presentation/core/widgets/package_icon.dart';
import 'package:movemate_ui/presentation/shipment_history/widgets/tab_item.dart';
import 'package:provider/provider.dart';

class ShipmentHistoryView extends StatelessWidget {
  const ShipmentHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = context.read<ShipmentTabProvider>();

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Shipment history',
            style: context.textTheme.bodyLarge!.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          bottom: TabBar(
            indicatorWeight: 3,
            isScrollable: true,
            onTap: (index) => tabProvider.setIndex(index),
            indicatorColor: context.colorScheme.secondary,
            unselectedLabelColor: context.colorScheme.inversePrimary,
            labelColor: context.colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              TabItem(
                title: 'All',
                amount: '12',
                index: 0,
              ),
              TabItem(
                title: 'Completed',
                amount: '5',
                index: 1,
              ),
              TabItem(
                title: 'In progress',
                amount: '3',
                index: 2,
              ),
              TabItem(
                title: 'Pending',
                amount: '12',
                index: 3,
              ),
              TabItem(
                title: 'Done',
                amount: '12',
                index: 4,
              ),
            ],
          ),
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        _TabViewItem(),
        _TabViewItem(),
        _TabViewItem(),
        _TabViewItem(),
        _TabViewItem(),
      ],
    );
  }
}

class _TabViewItem extends StatelessWidget {
  const _TabViewItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: status.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const _Shipment();
          }
          final statusItem = status[index - 1];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: _ShipmentHistoryCard(
                  status: statusItem,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Shipment extends StatelessWidget {
  const _Shipment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        'Shipments',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _ShipmentHistoryCard extends StatelessWidget {
  const _ShipmentHistoryCard({required this.status});
  final String status;

  Color _getColor(String status) {
    switch (status) {
      case 'loading':
        return AppColors.statusLoadingColor;
      case 'pending':
        return AppColors.statusPendingColor;
      case 'in-progress':
        return AppColors.statusInProgressColor;
      default:
        return AppColors.statusLoadingColor;
    }
  }

  IconData _getIcon(String status) {
    switch (status) {
      case 'loading':
        return Icons.rotate_right_outlined;
      case 'pending':
        return Icons.history_outlined;
      case 'in-progress':
        return Icons.cached_outlined;
      default:
        return Icons.rotate_right_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 4,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _getIcon(status),
                            color: _getColor(status),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            status,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: _getColor(status),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Arriving today!',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
                          style: context.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer
                                .withOpacity(
                                  0.5,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: PackageIcon(
                      scale: 10,
                      hasBackground: false,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '\$650 USD',
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '•',
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Sep 20, 2023',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
