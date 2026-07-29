import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> kobExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-TIP-0001',
    species: 'Dusky Kob',
    category: KnowledgeCategory.expertTip,
    title: 'Fish the Structure, Not Just the Beach',
    description:
    'Dusky Kob frequently patrol gutters, channels, points and areas where moving water concentrates baitfish. Identifying productive structure is often more important than covering long distances along the beach.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.98,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-TIP-0001',
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
      'expert tip',
      'structure',
      'gutters',
      'channels',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),

  KnowledgeRecord(
    id: 'NKS-KOB-TIP-0002',
    species: 'Dusky Kob',
    category: KnowledgeCategory.expertTip,
    title: 'Slow Down the Retrieve',
    description:
    'When fishing artificial lures for Dusky Kob, a slower and more deliberate retrieve often produces better results than a fast retrieve, particularly in cooler water or low-light conditions.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.95,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-TIP-0002',
        reliability: 0.95,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: [
      'kob',
      'retrieve',
      'lures',
      'expert tip',
      'low light',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),

  KnowledgeRecord(
    id: 'NKS-KOB-TIP-0003',
    species: 'Dusky Kob',
    category: KnowledgeCategory.expertTip,
    title: 'Fresh Bait Makes a Difference',
    description:
    'Fresh chokka and sardine generally outperform bait that has deteriorated through repeated thawing. Good bait quality often has a greater impact than changing tackle unnecessarily.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.97,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-TIP-0003',
        reliability: 0.97,
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
      'bait',
      'fresh bait',
      'expert tip',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),
];