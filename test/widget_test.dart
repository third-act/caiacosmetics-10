import 'package:flutter_test/flutter_test.dart';
import 'package:caiacosmetics_10/models/skin_profile.dart';
import 'package:caiacosmetics_10/services/mock_data_service.dart';

void main() {
  test('mock skin profile has glow index', () {
    const SkinProfile profile = MockDataService.skinProfile;
    expect(profile.glowIndex, 82);
    expect(profile.typeAndUndertone, contains('Kombinerad hud'));
  });
}
