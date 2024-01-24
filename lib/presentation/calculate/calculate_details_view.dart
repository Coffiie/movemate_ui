import 'dart:async';

import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:movemate_ui/presentation/core/asset.dart';
import 'package:movemate_ui/presentation/core/extensions/on_build_context.dart';
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
      backgroundColor: context.colorScheme.onPrimary,
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
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
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
              const _EstimatedAmountHeader(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Countup(
                    prefix: '\$',
                    begin: 1300,
                    end: 1460,
                    duration: const Duration(seconds: 3),
                    separator: ',',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: AppColors.statusInProgressColor,
                    ),
                    curve: Curves.easeOutExpo,
                  ),
                  Text(
                    ' USD',
                    style: context.textTheme.titleMedium!.copyWith(
                      color: AppColors.statusInProgressColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const _EstimatedAmountDescription(),
              const SizedBox(
                height: 32,
              ),
              const _BackToHome(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EstimatedAmountDescription extends StatelessWidget {
  const _EstimatedAmountDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55.0),
      child: Column(
        children: [
          Text(
            'This amount is estimated this will vary if you change your location or weight',
            style: context.textTheme.titleSmall!.copyWith(
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
    );
  }
}

class _EstimatedAmountHeader extends StatelessWidget {
  const _EstimatedAmountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Total Estimated Amount',
      style: context.textTheme.titleLarge!.copyWith(),
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
          style: context.textTheme.displaySmall!.copyWith(
            color: context.colorScheme.primary,
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

class _BackToHome extends StatelessWidget {
  const _BackToHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                style: context.textTheme.titleSmall!.copyWith(
                  color: context.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
