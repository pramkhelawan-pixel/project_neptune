import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> kobHookKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-HOOK-0001',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.hook,
    title: '6/0 Circle Hook',
    description:
    'A 6/0 circle hook is widely used for targeting Dusky Kob with natural baits. It promotes solid corner-of-the-mouth hook-ups and reduces deep hooking when allowed to set naturally.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-HOOK-0001',
        reliability: 0.98,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'kob',
      'circle hook',
      '6/0',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
  KnowledgeRecord(
    id: 'NKS-KOB-HOOK-0002',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.hook,
    title: '8/0 Circle Hook',
    description:
    'An 8/0 circle hook is suitable when presenting larger baits for trophy Dusky Kob, particularly where larger baitfish or whole squid are used.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-HOOK-0002',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'kob',
      'circle hook',
      '8/0',
      'large bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
  KnowledgeRecord(
    id: 'NKS-KOB-HOOK-0003',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.hook,
    title: '6/0 J Hook',
    description:
    'A 6/0 J hook remains a popular choice among many surf anglers targeting Dusky Kob with chokka and sardine combinations, particularly where an active strike-and-set technique is preferred.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-HOOK-0003',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Western Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
      'Winter',
    ],
    tags: const [
      'kob',
      'j hook',
      '6/0',
      'chokka',
      'sardine',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
];