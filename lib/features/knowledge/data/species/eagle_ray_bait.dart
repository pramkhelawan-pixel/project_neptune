import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> eagleRayBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKB-EGR-BAIT-0001',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.bait,
    title: 'Sand Prawn',
    description:
    'Sand prawn is the most consistent bait for Eagle Ray, closely matching its natural diet of buried crustaceans in open surf gutters.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-006',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
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
    id: 'NKB-EGR-BAIT-0002',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.bait,
    title: 'Crab',
    description:
    'A whole small crab presented on the bottom is a reliable secondary bait choice, particularly over open sand near reef margins.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-007',
        reliability: 0.82,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'bait',
      'crab',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-EGR-BAIT-0003',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.bait,
    title: 'Mussel',
    description:
    'Shelled mussel is a proven bait in known Eagle Ray marks, offering strong scent dispersion in moving surf water.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-008',
        reliability: 0.78,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'bait',
      'mussel',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
