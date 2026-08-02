import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> garrickHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRK-HOOK-0001',
    species: 'Garrick',
    category: KnowledgeCategory.hooks,
    title: '6/0 Circle Hook',
    description:
    'A 6/0 circle hook is widely used when targeting Garrick with live bait. It promotes secure corner-of-the-mouth hook-ups and supports responsible catch-and-release fishing.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.97,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-HOOK-0001',
        reliability: 0.97,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'garrick',
      'circle hook',
      '6/0',
      'live bait',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),

  KnowledgeRecord(
    id: 'NKS-GRK-HOOK-0002',
    species: 'Garrick',
    category: KnowledgeCategory.hooks,
    title: '8/0 Circle Hook',
    description:
    'An 8/0 circle hook is suitable when presenting larger live baits for trophy Garrick, particularly in areas where larger baitfish are available.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.95,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-HOOK-0002',
        reliability: 0.95,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'garrick',
      'circle hook',
      '8/0',
      'large bait',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),

  KnowledgeRecord(
    id: 'NKS-GRK-HOOK-0003',
    species: 'Garrick',
    category: KnowledgeCategory.hooks,
    title: '7/0 J Hook',
    description:
    'A 7/0 J hook is commonly used by experienced anglers when fishing live bait for Garrick. It requires an effective strike to achieve a solid hook set.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.91,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-HOOK-0003',
        reliability: 0.91,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'garrick',
      'j hook',
      '7/0',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),
];