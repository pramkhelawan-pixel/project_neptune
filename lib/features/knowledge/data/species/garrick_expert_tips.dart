import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> garrickExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRK-TIP-0001',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.technique,
    title: 'Follow the Baitfish',
    description:
    'Garrick are highly mobile predators. Concentrations of baitfish around estuary mouths, surf gutters and current lines are often a stronger indicator of potential success than repeatedly fishing the same location.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-TIP-0001',
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
      'expert tip',
      'baitfish',
      'estuary',
      'surf',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-TIP-0002',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.technique,
    title: 'Present Live Baits Naturally',
    description:
    'When fishing with live bait, minimise resistance so the bait can swim naturally. A healthy, naturally presented bait is generally more effective than excessive casting or constant repositioning.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-TIP-0002',
        reliability: 0.96,
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
      'live bait',
      'presentation',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-TIP-0003',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.technique,
    title: 'Observe Water Movement',
    description:
    'Current lines, colour changes and areas where waves funnel baitfish often provide productive ambush points for Garrick. Spend time reading the water before making repeated casts.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-TIP-0003',
        reliability: 0.95,
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
      'water movement',
      'current',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
];