import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> karanteenExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KRN-TIP-0001',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.technique,
    title: 'Berley to Hold the Shoal',
    description:
    'A light, steady berley trail keeps a Karanteen shoal feeding in position, often turning a slow session into consistent action.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KRN-TIP-0001',
        reliability: 0.94,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'karanteen',
      'berley',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-KRN-TIP-0002',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.technique,
    title: 'Keep Caught Fish Fresh for Live Bait',
    description:
    'When catching Karanteen specifically for live bait, keep fish in an aerated bucket or live bait tank to maintain vigour for later use targeting Garrick or Kob.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KRN-TIP-0002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'karanteen',
      'live bait',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
