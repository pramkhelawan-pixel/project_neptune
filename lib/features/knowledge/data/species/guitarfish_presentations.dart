import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> guitarfishPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKB-GTF-PRESENTATION-0001',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.presentation,
    title: 'Close-In Bottom Fishing',
    description:
    'A light bait fished on the bottom just beyond the wash is the standard, highly effective presentation for Guitarfish, which frequently feed within casting range of the beach.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-011',
        reliability: 0.87,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'presentation',
      'bottom fishing',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GTF-PRESENTATION-0002',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.presentation,
    title: 'Light Sinker for Sensitive Bite Detection',
    description:
    'Use the lightest sinker that will hold bottom in the prevailing surf conditions; Guitarfish bites can be subtle and are easier to detect on light gear.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-012',
        reliability: 0.79,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'presentation',
      'sinker',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
