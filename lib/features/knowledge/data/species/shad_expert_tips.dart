import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> shadExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-TIP-0001',
    species: 'Shad',
    category: KnowledgeCategory.expertTip,
    title: 'Fish the Water, Not the Clock',
    description:
    'Do not rely only on the time of day. Prioritize clean to green water, active baitfish, suitable tides and favourable surf conditions. Shad will often feed aggressively outside traditional peak periods when conditions are ideal.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.98,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Expert Knowledge',
        type: 'Experienced Anglers',
        reference: 'NKS-SHD-TIP-0001',
        reliability: 0.98,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: [
      'expert tip',
      'conditions',
      'water colour',
      'decision making',
      'shad',
    ],
    lastUpdated: DateTime(2026, 7, 29),
  ),
];