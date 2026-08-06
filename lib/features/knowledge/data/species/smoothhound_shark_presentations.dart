import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> smoothhoundSharkPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SHS-PRESENTATION-0001',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.presentation,
    title: 'Shallow Flat Bottom Fishing',
    description:
    'A light bait fished on the bottom in shallow water close to shore, just beyond the wash, consistently intercepts foraging Smoothhounds on the push of the tide.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-011',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
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
    id: 'NKB-SHS-PRESENTATION-0002',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.presentation,
    title: 'Small, Neat Bait Presentation',
    description:
    'Keep bait presentation small and neat rather than bulky; the Smoothhound\'s narrow mouth takes a smaller bait far more confidently.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-012',
        reliability: 0.78,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'presentation',
      'bait size',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
