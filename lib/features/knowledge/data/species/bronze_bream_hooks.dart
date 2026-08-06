import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> bronzeBreamHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BRB-HOOK-0001',
    species: 'Bronze Bream',
    targetSpecies: const ['Bronze Bream'],
    category: KnowledgeCategory.hook,
    title: '1/0 Forged Hook',
    description:
    'A strong 1/0 forged hook is well suited to Bronze Bream, offering the strength needed to control fish that dive hard for reef structure.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BRB-HOOK-0001',
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
      'Spring',
    ],
    tags: const [
      'bronze bream',
      'forged hook',
      '1/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BRB-HOOK-0002',
    species: 'Bronze Bream',
    targetSpecies: const ['Bronze Bream'],
    category: KnowledgeCategory.hook,
    title: '2/0 Forged Hook',
    description:
    'A 2/0 forged hook is suitable when presenting larger mussel or red bait baits for bigger Bronze Bream close to structure.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BRB-HOOK-0002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'bronze bream',
      'forged hook',
      '2/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
