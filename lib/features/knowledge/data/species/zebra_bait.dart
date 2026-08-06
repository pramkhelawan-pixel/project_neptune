import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> zebraBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-ZBR-BAIT-0001',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.bait,
    title: 'Red Bait',
    description:
    'Red bait is the most widely used and effective bait for Zebra, fished close to reef ledges and deep gullies.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-ZBR-BAIT-0001',
        reliability: 0.96,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'zebra',
      'red bait',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-ZBR-BAIT-0002',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.bait,
    title: 'Black Mussel',
    description:
    'Black mussel is a strong secondary bait for Zebra, particularly effective when fished tight against reef structure.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-ZBR-BAIT-0002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'zebra',
      'mussel',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-ZBR-BAIT-0003',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.bait,
    title: 'Sea Cockroach',
    description:
    'Sea cockroach is a productive alternative bait for Zebra, particularly effective in clearer water conditions.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-ZBR-BAIT-0003',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'zebra',
      'sea cockroach',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
