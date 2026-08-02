import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> garrickExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRK-TIP-0001',
    species: 'Garrick',
    category: KnowledgeCategory.expertTip,
    title: 'Follow the Baitfish',
    description:
    'Garrick are highly mobile predators. Concentrations of baitfish around estuary mouths, surf gutters and current lines are often a stronger indicator of potential success than repeatedly fishing the same location.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.97,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-TIP-0001',
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
      'expert tip',
      'baitfish',
      'estuary',
      'surf',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),

  KnowledgeRecord(
    id: 'NKS-GRK-TIP-0002',
    species: 'Garrick',
    category: KnowledgeCategory.expertTip,
    title: 'Present Live Baits Naturally',
    description:
    'When fishing with live bait, minimise resistance so the bait can swim naturally. A healthy, naturally presented bait is generally more effective than excessive casting or constant repositioning.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.96,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-TIP-0002',
        reliability: 0.96,
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
      'live bait',
      'presentation',
      'expert tip',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),

  KnowledgeRecord(
    id: 'NKS-GRK-TIP-0003',
    species: 'Garrick',
    category: KnowledgeCategory.expertTip,
    title: 'Observe Water Movement',
    description:
    'Current lines, colour changes and areas where waves funnel baitfish often provide productive ambush points for Garrick. Spend time reading the water before making repeated casts.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.95,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-TIP-0003',
        reliability: 0.95,
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
      'water movement',
      'current',
      'expert tip',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),
];