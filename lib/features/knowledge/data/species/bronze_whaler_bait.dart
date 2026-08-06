import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> bronzeWhalerBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKB-BWS-BAIT-0001',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.bait,
    title: 'Fresh Mullet',
    description:
    'A whole fresh mullet is the standard big-bait choice for Bronze Whaler, presented on heavy tackle in the surf zone or off estuary points.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-006',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'bait',
      'mullet',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BWS-BAIT-0002',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.bait,
    title: 'Mackerel Fillet',
    description:
    'An oily mackerel fillet cast into a surf gutter or estuary channel produces a strong scent trail that draws Bronze Whalers in from open water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-007',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'bait',
      'mackerel',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BWS-BAIT-0003',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.bait,
    title: 'Live Bait Off a Ski-Boat',
    description:
    'A live shad or mackerel fished slow-trolled or drifted off a ski-boat is highly effective when Bronze Whalers are marked following bait shoals close to shore.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-008',
        reliability: 0.79,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'bait',
      'live bait',
      'ski-boat',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
