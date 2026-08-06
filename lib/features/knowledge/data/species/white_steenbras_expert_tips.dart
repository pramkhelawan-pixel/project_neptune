import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> whiteSteenbrasExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-WST-TIP-0001',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.technique,
    title: 'Fish the Dark Hours for Bigger Fish',
    description:
    'The largest White Steenbras are typically caught after dark. Fishing through the night in a known gutter consistently improves the chance of a specimen fish.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-WST-TIP-0001',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'white steenbras',
      'night fishing',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-WST-TIP-0002',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.technique,
    title: 'Practice Careful Release',
    description:
    'Given the species\' vulnerable conservation status, handle White Steenbras with care and follow current regulations closely, releasing fish promptly and safely where required.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Regulatory Guidance',
        reference: 'NKS-WST-TIP-0002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'South Africa',
    ],
    seasons: const [],
    tags: const [
      'white steenbras',
      'conservation',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
