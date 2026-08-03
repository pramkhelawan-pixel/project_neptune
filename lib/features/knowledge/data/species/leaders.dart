import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> shadLeaderKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-LEADER-0001',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.leader,
    title: '0.70 mm Nylon Leader',
    description:
    'A 0.70 mm abrasion-resistant nylon leader is a widely used choice for targeting Shad with natural baits from the surf. It offers a balance between casting performance, abrasion resistance and bite protection.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-LEADER-0001',
        reliability: 0.98,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'leader',
      'nylon',
      '0.70 mm',
      'abrasion resistant',
      'shad',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
  KnowledgeRecord(
    id: 'NKS-SHD-LEADER-0002',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.leader,
    title: '0.80 mm Nylon Leader',
    description:
    'A 0.80 mm leader is preferred when heavy surf, rocky structure or larger fish require additional abrasion resistance and strength.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-LEADER-0002',
        reliability: 0.94,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'leader',
      '0.80 mm',
      'heavy surf',
      'rock fishing',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
];