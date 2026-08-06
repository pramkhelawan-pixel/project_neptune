import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> grunterBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRN-BAIT-0001',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.bait,
    title: 'Live Mud Prawn',
    description:
    'Live mud prawn is widely regarded as the single best bait for Grunter, fished in estuary channels and murky surf on light tackle.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRN-BAIT-0001',
        reliability: 0.97,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'grunter',
      'mud prawn',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-GRN-BAIT-0002',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.bait,
    title: 'Bloodworm',
    description:
    'Bloodworm is a highly effective bait for Grunter, particularly productive when fished in murky water within estuary systems.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRN-BAIT-0002',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'grunter',
      'bloodworm',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-GRN-BAIT-0003',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.bait,
    title: 'Sand Prawn',
    description:
    'Sand prawn is a reliable alternative bait for Grunter, especially productive around estuary mouths and adjacent surf.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRN-BAIT-0003',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'grunter',
      'sand prawn',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
