import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movemate_ui/application/calculate/calculate_chip_provider.dart';
import 'package:movemate_ui/mock_data.dart';
import 'package:movemate_ui/presentation/calculate/calculate_details_view.dart';
import 'package:movemate_ui/presentation/calculate/widgets/destination_field.dart';
import 'dart:math' as math;

import 'package:movemate_ui/presentation/core/widgets/package_icon.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class CalculateView extends StatelessWidget {
  const CalculateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Calculate',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final disabledColor =
        Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.55);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
          child: Text(
            'Destination',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: _DestinationCard(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Packaging',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'What are you sending?',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: disabledColor,
                    ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: _PackagingSection(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'What are you sending?',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: disabledColor,
                    ),
              ),
            ],
          ),
        ),
        const _ChipSection(),
        const SizedBox(
          height: 16,
        ),
        const _CalculateButton(),
      ],
    );
  }
}

class _DestinationCard extends StatelessWidget {
  const _DestinationCard();

  @override
  Widget build(BuildContext context) {
    final disabledColor =
        Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.55);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DestinationField(
              suffixIcon: Icon(
                Icons.outbox_outlined,
                color: disabledColor,
                size: 20,
              ),
              hintText: 'Sender location',
            ),
            const SizedBox(
              height: 8,
            ),
            DestinationField(
              suffixIcon: Transform.rotate(
                angle: 180 * math.pi / 180,
                child: Icon(
                  Icons.outbox_outlined,
                  color: disabledColor,
                  size: 20,
                ),
              ),
              hintText: 'Receiver Location',
            ),
            const SizedBox(
              height: 8,
            ),
            DestinationField(
              suffixIcon: Icon(
                Icons.scale_outlined,
                color: disabledColor,
                size: 20,
              ),
              hintText: 'Approx weight',
            ),
          ],
        ),
      ),
    );
  }
}

class _PackagingSection extends StatelessWidget {
  const _PackagingSection();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              const PackageIcon(
                scale: 20,
              ),
              const SizedBox(
                width: 4,
              ),
              VerticalDivider(
                width: 3,
                color: Theme.of(context)
                    .colorScheme
                    .onSecondaryContainer
                    .withOpacity(0.2),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Box',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChipSection extends StatelessWidget {
  const _ChipSection();

  @override
  Widget build(BuildContext context) {
    final chipProvider = context.watch<CalculateChipProvider>();

    return Wrap(
      children: List.generate(chips.length, (index) {
        final chipItem = chips[index];
        final selected = chipProvider.index == index;

        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: FilterChip(
            labelPadding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            checkmarkColor:
                selected ? Theme.of(context).colorScheme.onTertiary : null,
            selected: selected,
            selectedColor: Theme.of(context).colorScheme.tertiary,
            onSelected: (value) {
              if (value) {
                chipProvider.setIndex(index);
              }
            },
            label: Text(
              chipItem,
              style: selected
                  ? Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.onTertiary)
                  : null,
            ),
          ),
        );
      }),
    );
  }
}

class _CalculateButton extends StatelessWidget {
  const _CalculateButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CalculateDetailsView(),
            ),
          );
        },
        child: Text(
          'Calculate',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
    );
  }
}
