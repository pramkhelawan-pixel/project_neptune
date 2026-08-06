import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> galjoenBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GLJ-BAIT-0001',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.bait,
    title: 'Red Bait',
    description:
    'Red bait is the classic and most trusted bait for Galjoen, fished hard into rough, wave-washed gullies close to the rocks.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GLJ-BAIT-0001',
        reliability: 0.97,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'galjoen',
      'red bait',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-GLJ-BAIT-0002',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.bait,
    title: 'Black Mussel',
    description:
    'Black mussel is a highly effective bait for Galjoen, particularly when redbait is scarce or when fish are feeding tight against the rocks.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GLJ-BAIT-0002',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'galjoen',
      'mussel',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-GLJ-BAIT-0003',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.bait,
    title: 'Sea Lice',
    description:
    'Sea lice are a traditional and effective bait for Galjoen, particularly favoured by experienced anglers fishing rough, wave-washed gullies.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GLJ-BAIT-0003',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'galjoen',
      'sea lice',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
