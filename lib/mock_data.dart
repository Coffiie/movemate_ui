import 'package:movemate_ui/presentation/core/asset.dart';

class Freight {
  final String name, iconPath, description;

  Freight({
    required this.name,
    required this.iconPath,
    required this.description,
  });
}

final freights = [
  Freight(
    name: 'Ocean freight',
    iconPath: Asset.ship,
    description: 'International',
  ),
  Freight(
    name: 'Cargo freight',
    iconPath: Asset.truck,
    description: 'Reliable',
  ),
  Freight(
    name: 'Air freight',
    iconPath: Asset.plane,
    description: 'International',
  ),
];

final status = [
  'loading',
  'pending',
  'in-progress',
  'loading',
  'pending',
  'in-progress',
  'loading',
  'pending',
  'in-progress',
  'loading',
  'pending',
  'in-progress',
  'loading',
  'pending',
  'in-progress',
];

final chips = [
  'Documents',
  'Glass',
  'Liquid',
  'Food',
  'Electronic',
  'Product',
  'Others'
];
