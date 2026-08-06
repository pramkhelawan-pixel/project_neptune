import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> bronzeBreamExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BRB-TIP-0001',
    species: 'Bronze Bream',
    targetSpecies: const ['Bronze Bream'],
    category: KnowledgeCategory.technique,
    title: 'Fish Hard Against Structure',
    description:
    'Bronze Bream hold tight to reef and gully edges. Casting as close to structure as the rig allows, while accepting some risk of snagging, generally outperforms fishing open sand.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BRB-TIP-0001',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'bronze bream',
      'structure',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BRB-TIP-0002',
    species: 'Bronze Bream',
    targetSpecies: const ['Bronze Bream'],
    category: KnowledgeCategory.technique,
    title: 'Use Strong Trace Near Reef',
    description:
    'A heavier trace than the target size might suggest is recommended, since Bronze Bream dive hard for reef and abrasion against rock is a common cause of break-offs.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BRB-TIP-0002',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'bronze bream',
      'trace',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BRB-TIP-0003',
    species: 'Bronze Bream',
    targetSpecies: const ['Bronze Bream'],
    category: KnowledgeCategory.technique,
    title: 'Target Discoloured, Moving Water',
    description:
    'Bronze Bream tend to feed more confidently in slightly discoloured, moving water than in flat, clear conditions, likely due to reduced wariness.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BRB-TIP-0003',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'bronze bream',
      'water clarity',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
