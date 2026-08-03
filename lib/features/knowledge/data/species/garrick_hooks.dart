import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> garrickHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRK-HOOK-0001',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.hook,
    title: '6/0 Circle Hook',
    description:
    'A 6/0 circle hook is widely used when targeting Garrick with live bait. It promotes secure corner-of-the-mouth hook-ups and supports responsible catch-and-release fishing.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-HOOK-0001',
        reliability: 0.97,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'garrick',
      'circle hook',
      '6/0',
      'live bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-HOOK-0002',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.hook,
    title: '8/0 Circle Hook',
    description:
    'An 8/0 circle hook is suitable when presenting larger live baits for trophy Garrick, particularly in areas where larger baitfish are available.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-HOOK-0002',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'garrick',
      'circle hook',
      '8/0',
      'large bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-HOOK-0003',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.hook,
    title: '7/0 J Hook',
    description:
    'A 7/0 J hook is commonly used by experienced anglers when fishing live bait for Garrick. It requires an effective strike to achieve a solid hook set.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-HOOK-0003',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'garrick',
      'j hook',
      '7/0',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
];