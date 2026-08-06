import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> blacktailExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BLK-TIP-0001',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.technique,
    title: 'Go Light and Stay Stealthy',
    description:
    'Blacktail are easily spooked by heavy tackle, footfall and shadow near the water. Light line, small hooks and a quiet approach consistently outperform heavier setups.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BLK-TIP-0001',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'blacktail',
      'stealth',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BLK-TIP-0002',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.technique,
    title: 'Wait Out the Mouthing Bites',
    description:
    'Blacktail frequently mouth bait several times before taking it properly. Resisting the urge to strike early and waiting for a firm pull improves hook-up rates significantly.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BLK-TIP-0002',
        reliability: 0.91,
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
      'blacktail',
      'bite detection',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
