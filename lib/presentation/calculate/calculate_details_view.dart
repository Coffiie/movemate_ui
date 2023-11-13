import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movemate_ui/presentation/core/asset.dart';
import 'package:movemate_ui/presentation/core/theme/app_colors.dart';
import 'package:movemate_ui/presentation/core/widgets/package_icon.dart';

class CalculateDetailsView extends StatefulWidget {
  const CalculateDetailsView({super.key});

  @override
  State<CalculateDetailsView> createState() => _CalculateDetailsViewState();
}

class _CalculateDetailsViewState extends State<CalculateDetailsView> {
  late Timer timer;
  CrossFadeState state = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if (mounted) {
        setState(() {
          state = CrossFadeState.showSecond;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: AnimatedCrossFade(
        duration: const Duration(milliseconds: 600),
        crossFadeState: state,
        firstChild: Center(
          child: Lottie.asset(
            Asset.calculateSuccessLottie,
            repeat: false,
          ),
        ),
        secondChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _Logo(),
            const SizedBox(
              height: 32,
            ),
            const PackageIcon(
              hasBackground: false,
              scale: 4,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Total Estimated Amount',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$1460',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.statusInProgressColor,
                      ),
                ),
                Text(
                  ' USD',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.statusInProgressColor,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: Column(
                children: [
                  Text(
                    'This amount is estimated this will vary if you change your location or weight',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer
                              .withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Back to home',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'MoveMate',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
        ),
        const SizedBox(
          width: 16,
        ),
        Transform.translate(
          offset: const Offset(
            0,
            -5,
          ),
          child: Image.asset(
            Asset.truck,
            scale: 10,
          ),
        ),
      ],
    );
  }
}
