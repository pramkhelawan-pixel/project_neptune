import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> raggedtoothSharkPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKB-RTS-PRESENTATION-0001',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.presentation,
    title: 'Long Soak on the Bottom',
    description:
    'A large static bait left to soak on the bottom near reef structure, with the rod in a stand and drag lightly set, is the standard presentation while waiting out an aggregation.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-012',
        reliability: 0.87,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
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
    id: 'NKB-RTS-PRESENTATION-0002',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.presentation,
    title: 'Firm, Steady Strike',
    description:
    'With circle hooks, avoid a hard strike; instead, wind down onto a steadily developing pull to let the hook find the jaw naturally.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-013',
        reliability: 0.88,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'presentation',
      'circle hook',
      'strike timing',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
