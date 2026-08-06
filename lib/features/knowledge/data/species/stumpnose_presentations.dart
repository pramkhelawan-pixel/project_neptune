import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> stumpnosePresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-STN-PRES-0001',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.presentation,
    title: 'Light Free-Line Near Eelgrass',
    description:
    'A lightly weighted or free-lined prawn drifted naturally near eelgrass beds is highly effective for Stumpnose feeding in estuary channels.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-STN-PRES-0001',
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
      'free-line',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-STN-PRES-0002',
    species: 'Stumpnose',
    targetSpecies: const ['Stumpnose'],
    category: KnowledgeCategory.presentation,
    title: 'Small Running Sinker in Surf',
    description:
    'When targeting Stumpnose in the surf adjacent to an estuary mouth, a small running sinker rig keeps bait presented naturally without excessive movement.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-STN-PRES-0002',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'stumpnose',
      'running sinker',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
