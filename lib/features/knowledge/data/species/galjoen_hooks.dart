import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> galjoenHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GLJ-HOOK-0001',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.hook,
    title: 'Size 1 Forged Hook',
    description:
    'A strong, small size 1 forged hook is a traditional choice for Galjoen, balancing a compact profile with the strength needed for rough water fishing.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GLJ-HOOK-0001',
        reliability: 0.92,
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
      'forged hook',
      'size 1',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-GLJ-HOOK-0002',
    species: 'Galjoen',
    targetSpecies: const ['Galjoen'],
    category: KnowledgeCategory.hook,
    title: 'Size 2 Forged Hook',
    description:
    'A size 2 forged hook is well suited to smaller red bait or mussel presentations when Galjoen are feeding cautiously.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GLJ-HOOK-0002',
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
      'galjoen',
      'forged hook',
      'size 2',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
