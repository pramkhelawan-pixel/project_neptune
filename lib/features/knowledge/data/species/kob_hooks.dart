import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> kobHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-HOOK-0001',
    species: 'Dusky Kob',
    category: KnowledgeCategory.hooks,
    title: '6/0 Circle Hook',
    description:
    'A 6/0 circle hook is widely used for targeting Dusky Kob with natural baits. It promotes solid corner-of-the-mouth hook-ups and reduces deep hooking when allowed to set naturally.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.98,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-HOOK-0001',
        reliability: 0.98,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: [
      'Summer',
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: [
      'kob',
      'circle hook',
      '6/0',
      'natural bait',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),

  KnowledgeRecord(
    id: 'NKS-KOB-HOOK-0002',
    species: 'Dusky Kob',
    category: KnowledgeCategory.hooks,
    title: '8/0 Circle Hook',
    description:
    'An 8/0 circle hook is suitable when presenting larger baits for trophy Dusky Kob, particularly where larger baitfish or whole squid are used.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.94,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-HOOK-0002',
        reliability: 0.95,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: [
      'Summer',
      'Autumn',
    ],
    tags: [
      'kob',
      'circle hook',
      '8/0',
      'large bait',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),

  KnowledgeRecord(
    id: 'NKS-KOB-HOOK-0003',
    species: 'Dusky Kob',
    category: KnowledgeCategory.hooks,
    title: '6/0 J Hook',
    description:
    'A 6/0 J hook remains a popular choice among many surf anglers targeting Dusky Kob with chokka and sardine combinations, particularly where an active strike-and-set technique is preferred.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.91,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-HOOK-0003',
        reliability: 0.92,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Western Cape',
    ],
    seasons: [
      'Summer',
      'Autumn',
      'Winter',
    ],
    tags: [
      'kob',
      'j hook',
      '6/0',
      'chokka',
      'sardine',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),
];