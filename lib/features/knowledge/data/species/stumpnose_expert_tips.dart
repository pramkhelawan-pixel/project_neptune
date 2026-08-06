import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> stumpnoseExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-STN-TIP-0001',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.technique,
    title: 'Fish the Push Into the Estuary',
    description:
    'Stumpnose typically move into estuary channels and eelgrass beds as the tide pushes in, making the first two hours of the incoming tide especially productive.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-STN-TIP-0001',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'stumpnose',
      'tide',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-STN-TIP-0002',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.technique,
    title: 'Target Eelgrass Edges',
    description:
    'Casting along the edges of eelgrass beds rather than into open sand consistently produces more Stumpnose, as fish use the grass for cover while feeding.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-STN-TIP-0002',
        reliability: 0.90,
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
      'stumpnose',
      'eelgrass',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
