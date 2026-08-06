import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> grunterExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRN-TIP-0001',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.technique,
    title: 'Target Discoloured Water After Rain',
    description:
    'Grunter fishing typically improves noticeably after rain has pushed sediment into an estuary. Discoloured water reduces wariness and increases feeding activity.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRN-TIP-0001',
        reliability: 0.95,
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
      'discoloured water',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-GRN-TIP-0002',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.technique,
    title: 'Fish Quietly at Night',
    description:
    'Grunter are notably more active and less easily spooked after dark. Fishing quietly at night in estuary channels frequently outperforms daytime sessions.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRN-TIP-0002',
        reliability: 0.90,
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
      'night fishing',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
