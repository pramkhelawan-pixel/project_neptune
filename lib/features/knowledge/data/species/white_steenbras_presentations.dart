import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> whiteSteenbrasPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-WST-PRES-0001',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.presentation,
    title: 'Sand Prawn Cocktail in Surf Gutter',
    description:
    'A sand prawn presented alone or as part of a cocktail bait, cast into a defined surf gutter, is the standard presentation for White Steenbras.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-WST-PRES-0001',
        reliability: 0.93,
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
      'cocktail bait',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-WST-PRES-0002',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.presentation,
    title: 'Long Cast Past the Backline',
    description:
    'Larger White Steenbras are often found beyond the immediate breaker line, making a long cast past the backline effective in suitable conditions.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-WST-PRES-0002',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'white steenbras',
      'long cast',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
