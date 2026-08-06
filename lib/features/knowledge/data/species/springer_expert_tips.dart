import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> springerExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SPR-TIP-0001',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.technique,
    title: 'Keep the Rod Bent During Jumps',
    description:
    'Springer frequently throw the hook during their acrobatic jumps. Keeping the rod tip low and maintaining constant pressure through each leap improves landing rates.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SPR-TIP-0001',
        reliability: 0.94,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'springer',
      'fight technique',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-SPR-TIP-0002',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.technique,
    title: 'Watch for Surface Activity',
    description:
    'Springer often betray their location with visible surface activity as they chase baitfish. Watching for this activity and casting directly to it significantly improves results.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SPR-TIP-0002',
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
      'springer',
      'surface activity',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
