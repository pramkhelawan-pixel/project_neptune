import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> blackMusselcrackerHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BMC-HOOK-0001',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.hook,
    title: '6/0 Forged Hook',
    description:
    'A strong 6/0 forged hook is recommended for Black Musselcracker, providing the strength needed to control powerful fish close to reef.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BMC-HOOK-0001',
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
      'black musselcracker',
      'forged hook',
      '6/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BMC-HOOK-0002',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.hook,
    title: '8/0 Forged Hook',
    description:
    'An 8/0 forged hook is well suited to larger crab or mussel baits when targeting trophy Black Musselcracker.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BMC-HOOK-0002',
        reliability: 0.87,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'black musselcracker',
      'forged hook',
      '8/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
