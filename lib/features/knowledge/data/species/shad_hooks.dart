import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> shadHookKnowledge = [

  KnowledgeRecord(
    id: 'NKS-SHD-HOOK-0001',

    species: 'Shad',

    category: KnowledgeCategory.hooks,

    title: '2/0 Kendal Round Hook',

    description:
    'The most widely used hook for targeting Shad with sardine fillets and butterfly baits. It provides reliable hook penetration while preserving a natural bait presentation.',

    evidenceLevel: EvidenceLevel.experiencedAngler,

    confidence: 0.98,

    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-HOOK-0001',
        reliability: 0.98,
      ),
    ],

    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],

    seasons: [
      'Autumn',
      'Winter',
      'Spring',
    ],

    tags: [
      'hook',
      'kendal',
      '2/0',
      'shad',
      'sardine',
    ],

    lastUpdated: DateTime(2026, 7, 29),
  ),

  KnowledgeRecord(
    id: 'NKS-SHD-HOOK-0002',

    species: 'Shad',

    category: KnowledgeCategory.hooks,

    title: '3/0 Kendal Round Hook',

    description:
    'Preferred when using larger whole sardines or when specifically targeting bigger Shad. Offers greater holding power while maintaining good bait presentation.',

    evidenceLevel: EvidenceLevel.experiencedAngler,

    confidence: 0.94,

    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-HOOK-0002',
        reliability: 0.95,
      ),
    ],

    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],

    seasons: [
      'Winter',
      'Spring',
    ],

    tags: [
      'hook',
      'kendal',
      '3/0',
      'large bait',
    ],

    lastUpdated: DateTime(2026, 7, 29),
  ),

];