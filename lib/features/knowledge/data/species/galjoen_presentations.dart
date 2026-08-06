import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> galjoenPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GLJ-PRES-0001',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.presentation,
    title: 'Heavy Sinker in White Water',
    description:
    'A heavy sliding sinker rig is required to hold bottom in the turbulent white water Galjoen favour, keeping bait anchored where fish are actively feeding.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GLJ-PRES-0001',
        reliability: 0.93,
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
      'heavy sinker',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-GLJ-PRES-0002',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.presentation,
    title: 'Short Cast Into Gullies',
    description:
    'Rather than casting long, presenting bait in the near gullies where white water funnels food close to the rocks is often more effective for Galjoen.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GLJ-PRES-0002',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'galjoen',
      'short cast',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
