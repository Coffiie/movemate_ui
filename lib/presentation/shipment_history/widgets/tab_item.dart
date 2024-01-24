import 'package:flutter/material.dart';
import 'package:movemate_ui/application/shipment_history/shipment_tab_provider.dart';
import 'package:movemate_ui/presentation/core/extensions/on_build_context.dart';
import 'package:provider/provider.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.index,
    required this.title,
    required this.amount,
  });
  final String title, amount;
  final int index;

  @override
  Widget build(BuildContext context) {
    final tabProvider = context.watch<ShipmentTabProvider>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(title),
          const SizedBox(
            width: 4,
          ),
          Container(
            decoration: BoxDecoration(
              color: tabProvider.index == index
                  ? context.colorScheme.secondary
                  : context.colorScheme.onPrimary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                amount,
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.colorScheme.onPrimary.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
