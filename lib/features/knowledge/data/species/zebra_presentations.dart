import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> zebraPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-ZBR-PRES-0001',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.presentation,
    title: 'Sliding Sinker at Reef Ledge',
    description:
    'A sliding sinker rig presented at the edge of a reef ledge or deep gully is the standard, most effective approach for Zebra.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-ZBR-PRES-0001',
        reliability: 0.91,
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
      'sliding sinker',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-ZBR-PRES-0002',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.presentation,
    title: 'Vertical Drop Into Deep Gully',
    description:
    'From rocks with direct access to deep water, a vertical drop presentation directly into a gully can be highly effective for Zebra holding close to structure.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-ZBR-PRES-0002',
        reliability: 0.84,
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
      'vertical drop',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
