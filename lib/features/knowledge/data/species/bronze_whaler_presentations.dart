import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> bronzeWhalerPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKB-BWS-PRESENTATION-0001',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.presentation,
    title: 'Long Cast Beyond the Backline',
    description:
    'Casting a large bait well beyond the backline into deeper surf channels puts it in the path of cruising Bronze Whalers before they move into shallower water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-011',
        reliability: 0.87,
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
      'presentation',
      'casting',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BWS-PRESENTATION-0002',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.presentation,
    title: 'Balloon or Float-Suspended Bait',
    description:
    'Suspending a bait off a balloon or large float keeps it off the bottom and in the mid-water column where hunting Bronze Whalers commonly intercept baitfish.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-012',
        reliability: 0.80,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'presentation',
      'float',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
