import 'package:flutter/material.dart';
import 'package:movemate_ui/application/home/home_anim_provider.dart';
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
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight / 1.5, left: 30),
          child: Hero(
            tag: 'search_bar',
            child: Material(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              child: SearchField(
                onChanged: (value) => homeProvider
                    .changeCrossFadeState(CrossFadeState.showSecond),
              ),
            ),
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
              secondChild: const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _CardItem(),
                      Divider(),
                      _CardItem(),
                      Divider(),
                      _CardItem(),
                      Divider(),
                      _CardItem(),
                      Divider(),
                      _CardItem(),
                    ],
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
          backgroundColor: Theme.of(context).colorScheme.primary,
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
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  '#NEJ20089934122231',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer
                            .withOpacity(0.55),
                      ),
                ),
                Text(
                  ' • ',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer
                            .withOpacity(0.55),
                      ),
                ),
                Text(
                  'Barcelona -> Spain',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer
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
