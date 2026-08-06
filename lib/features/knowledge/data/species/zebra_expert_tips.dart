import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> zebraExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-ZBR-TIP-0001',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.technique,
    title: 'Fish Deeper Marks Than Blacktail',
    description:
    'When a mark is producing Blacktail but no Zebra, try deeper adjacent gullies and ledges. Zebra generally hold in deeper structure than Blacktail.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-ZBR-TIP-0001',
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
      'depth',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-ZBR-TIP-0002',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.technique,
    title: 'Apply Immediate Pressure',
    description:
    'Zebra dive for structure the instant they feel resistance. Applying firm pressure immediately after the take improves landing rates considerably.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-ZBR-TIP-0002',
        reliability: 0.89,
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
      'fight',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
