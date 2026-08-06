import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> diamondRayHookKnowledge = [
  KnowledgeRecord(
    id: 'NKB-DMR-HOOK-0001',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.hook,
    title: 'Circle Hook 3/0-5/0',
    description:
    'A circle hook in 3/0-5/0 matches the Diamond Ray\'s ambush bite and keeps hook-ups clean in the jaw for a quick, safe release.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-009',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'hook',
      'circle hook',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DMR-HOOK-0002',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.hook,
    title: '50lb Monofilament Leader',
    description:
    'A 50lb monofilament leader provides sufficient abrasion resistance for shallow, sandy estuary terrain without overpowering light tackle.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-010',
        reliability: 0.78,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'hook',
      'leader',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
