import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> guitarfishBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKB-GTF-BAIT-0001',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.bait,
    title: 'Bloodworm',
    description:
    'Bloodworm is the most reliable bait for Guitarfish, producing confident bites in the surf zone and estuary channels alike.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-006',
        reliability: 0.89,
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
      'bait',
      'bloodworm',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GTF-BAIT-0002',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.bait,
    title: 'Sand Prawn',
    description:
    'Sand prawn is a strong secondary bait choice, especially effective when fished on light tackle in shallow estuary water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-007',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
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
    id: 'NKB-GTF-BAIT-0003',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.bait,
    title: 'Cut Fish Bait',
    description:
    'A small strip of cut fish bait, such as mackerel or maasbanker, works well when Guitarfish are actively feeding on scent in murky surf water.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-008',
        reliability: 0.79,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'bait',
      'cut fish',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
