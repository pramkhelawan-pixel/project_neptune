import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> diamondRayPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKB-DMR-PRESENTATION-0001',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.presentation,
    title: 'Drift Through Shallow Channels',
    description:
    'Cast into shallow estuary channels and allow the bait to sit or drift slowly with the current, covering ground where a buried ray may be ambushing prey.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-011',
        reliability: 0.83,
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
      'drift fishing',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DMR-PRESENTATION-0002',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.presentation,
    title: 'Fish at Night on the Sandbanks',
    description:
    'Target shallow sandbank edges after dark when Diamond Rays move up to feed, using a soft bite indicator to detect the initial pick-up.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-012',
        reliability: 0.77,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'presentation',
      'night fishing',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
