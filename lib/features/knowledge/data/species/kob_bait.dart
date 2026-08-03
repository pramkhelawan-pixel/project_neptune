import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> kobBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-BAIT-0001',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.bait,
    title: 'Chokka and Sardine Combo',
    description:
    'A combination of chokka and sardine is one of the most trusted natural bait presentations for Dusky Kob. The chokka provides durability while the sardine releases scent and oil into the water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-BAIT-0001',
        reliability: 0.99,
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
      'chokka',
      'sardine',
      'combo bait',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
  KnowledgeRecord(
    id: 'NKS-KOB-BAIT-0002',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.bait,
    title: 'Live Mullet',
    description:
    'A live mullet is highly effective when targeting larger Dusky Kob in estuaries, river mouths and surf zones where live bait can be presented naturally.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-BAIT-0002',
        reliability: 0.96,
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
      'live bait',
      'mullet',
      'estuary',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
  KnowledgeRecord(
    id: 'NKS-KOB-BAIT-0003',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.bait,
    title: 'Whole Sardine',
    description:
    'A whole sardine is an effective bait for Dusky Kob in surf conditions, particularly when fish are actively hunting larger baitfish.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-BAIT-0003',
        reliability: 0.94,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Western Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'kob',
      'whole sardine',
      'surf bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
];