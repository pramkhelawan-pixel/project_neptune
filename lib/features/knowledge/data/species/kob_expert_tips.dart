import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> kobExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-TIP-0001',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.technique,
    title: 'Fish the Structure, Not Just the Beach',
    description:
    'Dusky Kob frequently patrol gutters, channels, points and areas where moving water concentrates baitfish. Identifying productive structure is often more important than covering long distances along the beach.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-TIP-0001',
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
      'expert tip',
      'structure',
      'gutters',
      'channels',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
  KnowledgeRecord(
    id: 'NKS-KOB-TIP-0002',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.technique,
    title: 'Slow Down the Retrieve',
    description:
    'When fishing artificial lures for Dusky Kob, a slower and more deliberate retrieve often produces better results than a fast retrieve, particularly in cooler water or low-light conditions.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-TIP-0002',
        reliability: 0.95,
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
      'kob',
      'retrieve',
      'lures',
      'expert tip',
      'low light',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
  KnowledgeRecord(
    id: 'NKS-KOB-TIP-0003',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.technique,
    title: 'Fresh Bait Makes a Difference',
    description:
    'Fresh chokka and sardine generally outperform bait that has deteriorated through repeated thawing. Good bait quality often has a greater impact than changing tackle unnecessarily.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-TIP-0003',
        reliability: 0.97,
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
      'bait',
      'fresh bait',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
];