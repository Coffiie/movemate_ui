import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movemate_ui/application/home/home_anim_provider.dart';
import 'package:movemate_ui/presentation/core/extensions/on_build_context.dart';
import 'package:movemate_ui/presentation/core/widgets/package_icon.dart';
import 'package:movemate_ui/presentation/core/widgets/search_field.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeAnimProvider>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20,
        leadingWidth: 0,
        leading: const SizedBox.shrink(),
        flexibleSpace: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.chevron_left,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
              Expanded(
                child: Hero(
                  tag: 'search_bar',
                  child: Material(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: SearchField(
                        onChanged: (value) => homeProvider
                            .changeCrossFadeState(CrossFadeState.showSecond),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            AnimatedCrossFade(
              crossFadeState: homeProvider.crossFadeState,
              duration: const Duration(milliseconds: 200),
              firstChild: const Card(),
              secondChild: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 375),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: [
                        const _CardItem(),
                        const Divider(),
                        const _CardItem(),
                        const Divider(),
                        const _CardItem(),
                        const Divider(),
                        const _CardItem(),
                        const Divider(),
                        const _CardItem(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PackageIcon(
          backgroundColor: context.colorScheme.primary,
          scale: 30,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summer linen jacket',
              style: context.textTheme.bodyLarge,
            ),
            Row(
              children: [
                Text(
                  '#NEJ20089934122231',
                  style: context.textTheme.bodySmall!.copyWith(
                    color: context.colorScheme.onSecondaryContainer
                        .withOpacity(0.55),
                  ),
                ),
                Text(
                  ' • ',
                  style: context.textTheme.bodySmall!.copyWith(
                    color: context.colorScheme.onSecondaryContainer
                        .withOpacity(0.55),
                  ),
                ),
                Text(
                  'Barcelona -> Spain',
                  style: context.textTheme.bodySmall!.copyWith(
                    color: context.colorScheme.onSecondaryContainer
                        .withOpacity(0.55),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
