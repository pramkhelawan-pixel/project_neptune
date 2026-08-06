import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> smoothhoundSharkBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SHS-BAIT-0001',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.bait,
    title: 'Sand Prawn',
    description:
    'Live or fresh sand prawn is the top bait for Smoothhound Shark, matching its natural crustacean diet and producing confident bites on light tackle.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-006',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'bait',
      'sand prawn',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SHS-BAIT-0002',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.bait,
    title: 'Bloodworm',
    description:
    'Bloodworm fished on a small hook is a reliable alternative bait, particularly effective in estuary channels and shallow bay margins.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-007',
        reliability: 0.83,
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
      'bait',
      'bloodworm',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SHS-BAIT-0003',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.bait,
    title: 'Small Crab',
    description:
    'A whole small crab presented on the bottom is a natural, high-confidence bait choice in known Smoothhound marks over sand and mud.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-008',
        reliability: 0.79,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'bait',
      'crab',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
