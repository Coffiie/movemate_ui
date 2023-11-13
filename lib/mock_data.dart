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
    iconPath: Asset.forklift,
    description: 'International',
  ),
  Freight(
    name: 'Cargo freight',
    iconPath: Asset.forklift,
    description: 'Reliable',
  ),
  Freight(
    name: 'Air freight',
    iconPath: Asset.forklift,
    description: 'International',
  ),
];
