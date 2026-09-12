class SkinProfile {
  const SkinProfile({
    required this.glowIndex,
    required this.moisture,
    required this.evenness,
    required this.redTones,
    required this.shadeCode,
    required this.skinTypeLabel,
    required this.undertoneLabel,
    required this.summary,
    required this.scannedDaysAgo,
  });

  final int glowIndex;
  final int moisture;
  final int evenness;
  final int redTones;
  final String shadeCode;
  final String skinTypeLabel;
  final String undertoneLabel;
  final String summary;
  final int scannedDaysAgo;

  String get typeAndUndertone => '$skinTypeLabel, $undertoneLabel';
}
