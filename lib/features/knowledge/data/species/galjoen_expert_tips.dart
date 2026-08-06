import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> galjoenExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GLJ-TIP-0001',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.technique,
    title: 'Fish Straight After a Cold Front',
    description:
    'The day or two after a cold front, once fresh groundswell has arrived and turned the water rough, is traditionally regarded as prime Galjoen time.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GLJ-TIP-0001',
        reliability: 0.95,
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
      'cold front',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-GLJ-TIP-0002',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.technique,
    title: 'Prioritise Safety in Rough Conditions',
    description:
    'Because Galjoen are best targeted in rough, turbulent surf, always fish from safe, elevated positions and be mindful of surge and rogue waves near rocks.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GLJ-TIP-0002',
        reliability: 0.96,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'galjoen',
      'safety',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
