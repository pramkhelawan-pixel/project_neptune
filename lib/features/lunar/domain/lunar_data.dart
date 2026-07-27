import 'moon_phase.dart';

class LunarData {
  final MoonPhase phase;

  final double illumination;

  final double lunarAge;

  const LunarData({
    required this.phase,
    required this.illumination,
    required this.lunarAge,
  });
}