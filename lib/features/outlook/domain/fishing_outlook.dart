class FishingOutlook {
  final String title;
  final String summary;
  final String bestWindow;
  final int confidence;
  final List<String> highlights;

  const FishingOutlook({
    required this.title,
    required this.summary,
    required this.bestWindow,
    required this.confidence,
    required this.highlights,
  });
}