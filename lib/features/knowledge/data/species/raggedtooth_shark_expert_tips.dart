import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> raggedtoothSharkExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKB-RTS-TIP-0001',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.technique,
    title: 'Fish Known Reef Aggregation Points',
    description:
    'Aliwal Shoal and Protea Banks are the most consistent aggregation points during the winter months; local dive and charter reports are a reliable indicator of when numbers build up.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-014',
        reliability: 0.88,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'technique',
      'reef',
      'aggregation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-RTS-TIP-0002',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.technique,
    title: 'Use a De-Hooking Tool and Release Fast',
    description:
    'Carry a long-handled de-hooker to remove hooks without lifting the shark from the water, and always cut the trace close to the hook if it cannot be removed safely.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-015',
        reliability: 0.94,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'technique',
      'fish care',
      'release',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-RTS-TIP-0003',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.technique,
    title: 'Match Tackle to Sustained Pressure',
    description:
    'Raggies do not run far but pull with relentless, heavy pressure; use a stout rod and locked-down drag suited to a prolonged tug-of-war rather than a fast, light setup.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-016',
        reliability: 0.81,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'technique',
      'tackle',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
