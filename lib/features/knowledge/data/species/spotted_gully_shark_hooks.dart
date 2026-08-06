import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> spottedGullySharkHookKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SGS-HOOK-0001',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.hook,
    title: 'Circle Hook 6/0-8/0',
    description:
    'A strong, forged circle hook in 6/0-8/0 sets reliably in the jaw scissors, reducing deep-hooking and making unhooking faster and safer for catch-and-release.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-009',
        reliability: 0.91,
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
      'hook',
      'circle hook',
      'catch and release',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SGS-HOOK-0002',
    species: 'Spotted Gully Shark',
    targetSpecies: const ['Spotted Gully Shark'],
    category: KnowledgeCategory.hook,
    title: 'Single Strand Wire-Free Rig',
    description:
    'Blunt teeth mean wire is unnecessary; a single strong hook on heavy monofilament reduces terminal tackle bulk while still holding up to sustained bottom fights.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SGS-010',
        reliability: 0.82,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'hook',
      'rig',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
