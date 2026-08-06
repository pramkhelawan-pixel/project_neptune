import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> karanteenPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KRN-PRES-0001',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.presentation,
    title: 'Berley and Light Float Rig',
    description:
    'A steady berley trail combined with a small bread bait fished under a light float is a highly effective way to draw and hold a Karanteen shoal.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KRN-PRES-0001',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'karanteen',
      'berley',
      'float rig',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-KRN-PRES-0002',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.presentation,
    title: 'Light Free-Line Near Structure',
    description:
    'A lightly weighted or free-lined bait presented close to reef and rocky structure is effective when Karanteen are feeding tight to cover.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KRN-PRES-0002',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'karanteen',
      'free-line',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
