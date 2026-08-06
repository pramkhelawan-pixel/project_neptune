import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> stumpnoseBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-STN-BAIT-0001',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.bait,
    title: 'Live Mud Prawn',
    description:
    'Live mud prawn is regarded as the premier bait for Stumpnose, presented on light tackle around estuary channels and eelgrass beds.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-STN-BAIT-0001',
        reliability: 0.97,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'stumpnose',
      'mud prawn',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-STN-BAIT-0002',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.bait,
    title: 'Sand Mussel',
    description:
    'Sand mussel is a reliable natural bait for Stumpnose, particularly effective in the surf zone adjacent to estuary mouths.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-STN-BAIT-0002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'stumpnose',
      'sand mussel',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-STN-BAIT-0003',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.bait,
    title: 'Small Crab',
    description:
    'Small crab is a productive bait for larger Stumpnose, particularly when fished tight to structure within estuary channels.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-STN-BAIT-0003',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Autumn',
    ],
    tags: const [
      'stumpnose',
      'crab',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
