import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> raggedtoothSharkHookKnowledge = [
  KnowledgeRecord(
    id: 'NKB-RTS-HOOK-0001',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.hook,
    title: 'Circle Hook 10/0-12/0',
    description:
    'A large circle hook in 10/0-12/0 is mandatory best practice, ensuring the hook sets in the jaw rather than being swallowed, allowing a fast, safe release.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-010',
        reliability: 0.93,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
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
    id: 'NKB-RTS-HOOK-0002',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.hook,
    title: 'Wire Trace Rig',
    description:
    'A heavy wire trace ahead of the hook is essential to prevent bite-offs from the Raggie\'s protruding teeth during the fight.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-011',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'hook',
      'wire trace',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
