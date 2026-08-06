import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> springerBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SPR-BAIT-0001',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.bait,
    title: 'Live Prawn',
    description:
    'Live prawn is a highly effective natural bait for Springer, fished near the surface around estuary mouths where fish are actively feeding.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SPR-BAIT-0001',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'springer',
      'prawn',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-SPR-BAIT-0002',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.bait,
    title: 'Live Small Mullet',
    description:
    'A small live mullet is an effective bait for larger Springer, particularly when fished near surface activity in an estuary channel.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SPR-BAIT-0002',
        reliability: 0.88,
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
      'springer',
      'mullet',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-SPR-BAIT-0003',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.bait,
    title: 'Sardine Strip',
    description:
    'A thin sardine strip fished near the surface is a productive alternative bait for Springer when live bait is not available.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SPR-BAIT-0003',
        reliability: 0.82,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'springer',
      'sardine',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
