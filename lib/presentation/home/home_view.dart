import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movemate_ui/application/home/home_anim_provider.dart';
import 'package:movemate_ui/mock_data.dart';
import 'package:movemate_ui/presentation/core/asset.dart';
import 'package:movemate_ui/presentation/core/widgets/package_icon.dart';
import 'package:movemate_ui/presentation/core/widgets/search_field.dart';
import 'package:movemate_ui/presentation/home/search_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final kLeadingWidth = 56.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: kLeadingWidth,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
              Asset.profilePic,
            ),
          ),
        ),
        title: Column(
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
              Row(
                children: [
                  Transform.rotate(
                    angle: 45 * math.pi / 180,
                    child: Icon(
                      Icons.navigation,
                      size: 15,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Your location',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Wetheimer, Illinois',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.expand_more,
                    size: 15,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 20),
          child: Hero(
            tag: 'search_bar',
            child: Material(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              child: SearchField(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => HomeAnimProvider(),
                        child: const SearchView(),
                      ),
                    ),
                  );
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
          ),
        ),
      ),
      body: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 375),
        childAnimationBuilder: (widget) => SlideAnimation(
          horizontalOffset: 50.0,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Text(
              'Tracking',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const _ShipmentDetails(),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Text(
              'Available Vehicles',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const SizedBox(height: 200, child: _AvailableVehicles()),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class _ShipmentDetails extends StatelessWidget {
  const _ShipmentDetails();

  @override
  Widget build(BuildContext context) {
    final disabledColor =
        Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(
              0.5,
            );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipment number',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer
                                          .withOpacity(
                                            0.5,
                                          ),
                                    ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'NEJ20089934122231',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Transform.scale(
                        scaleX: -1,
                        child: Image.asset(
                          Asset.forklift,
                          scale: 12,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              PackageIcon(backgroundColor: Colors.red.shade100),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sender',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: disabledColor,
                                        ),
                                  ),
                                  const Text(
                                    'Atlanta, 5243',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              PackageIcon(
                                backgroundColor: Colors.lightGreen.shade100,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Receiver',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: disabledColor),
                                  ),
                                  const Text(
                                    'Chicago, 6342',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer
                                          .withOpacity(
                                            0.5,
                                          ),
                                    ),
                          ),
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '2 - 3 days',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Status',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer
                                          .withOpacity(
                                            0.5,
                                          ),
                                    ),
                          ),
                          const Text(
                            'Waiting to collect',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 20,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Add Stop',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
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

class _AvailableVehicles extends StatelessWidget {
  const _AvailableVehicles();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: freights.length,
      itemBuilder: (context, index) {
        final item = freights[index];

        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: index == freights.length - 1 ? 16 : 0,
          ),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              item.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
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
                    ],
                  ),
                  Positioned.fill(
                    right: -30,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Transform.scale(
                        scaleX: -1,
                        child: Image.asset(
                          item.iconPath,
                          scale: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
