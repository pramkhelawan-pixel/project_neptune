import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> spottedGullySharkExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SGS-TIP-0001',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.technique,
    title: 'Fish the First Two Hours of Dark',
    description:
    'The first two hours after sunset are consistently the most productive window as Spotted Gully Sharks move up out of deeper water to hunt the shallow gullies.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-013',
        reliability: 0.88,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'technique',
      'timing',
      'night fishing',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SGS-TIP-0002',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.technique,
    title: 'Keep the Shark in the Water',
    description:
    'Support the shark in the water while unhooking rather than dragging it onto rocks or sand. Minimal air exposure significantly improves post-release survival.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-014',
        reliability: 0.93,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'technique',
      'fish care',
      'release',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SGS-TIP-0003',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.technique,
    title: 'Target Deeper Gullies After Rough Weather',
    description:
    'Following a period of rough surf, Spotted Gully Sharks tend to sit in the deeper, calmer gullies rather than the shallowest water, so shift casting range accordingly.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-015',
        reliability: 0.79,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'technique',
      'weather',
      'gully',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
