import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> shadExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-TIP-0001',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.technique,
    title: 'Fish the Water, Not the Clock',
    description:
    'Do not rely only on the time of day. Prioritize clean to green water, active baitfish, suitable tides and favourable surf conditions. Shad will often feed aggressively outside traditional peak periods when conditions are ideal.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Expert Knowledge',
        type: 'Experienced Anglers',
        reference: 'NKS-SHD-TIP-0001',
        reliability: 0.98,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'expert tip',
      'conditions',
      'water colour',
      'decision making',
      'shad',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
];