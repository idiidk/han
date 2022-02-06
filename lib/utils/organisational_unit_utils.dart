import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:xedule_repository/xedule_repository.dart';

final Set<Color> organisationalUnitColors = {
  const Color(0xFF55EFC4),
  const Color(0xFF81ECEC),
  const Color(0xFF74B9FF),
  const Color(0xFFA29BFE),
  const Color(0xFF00B894),
  const Color(0xFF00CEC9),
  const Color(0xFF0984E3),
  const Color(0xFF6C5CE7),
  const Color(0xFFFF7675),
  const Color(0xFFFD79A8),
  const Color(0xFFFDCB6E),
  const Color(0xFFE84393),
  const Color(0xFFFd9644),
  const Color(0xFF2BCBBA),
  const Color(0xFF26DE81),
};

OrganisationalUnit? getOrganisationalUnitFromGroup(
  List<OrganisationalUnit> organisationalUnits,
  Group group,
) {
  return organisationalUnits.firstWhereOrNull(
    (ou) => group.organisationalUnitIds.contains(
      int.parse(ou.id),
    ),
  );
}

Color getOrganisationalUnitColor(OrganisationalUnit? organisationalUnit) {
  final random = Random(int.parse(organisationalUnit?.id ?? '0'));
  return organisationalUnitColors
      .elementAt(random.nextInt(organisationalUnitColors.length));
}
