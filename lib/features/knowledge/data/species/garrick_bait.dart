import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> garrickBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRK-BAIT-0001',
    species: 'Garrick',
    category: KnowledgeCategory.bait,
    title: 'Live Mullet',
    description:
    'Live mullet is regarded by experienced South African anglers as one of the premier natural baits for Garrick. A healthy, naturally presented mullet is particularly effective around estuary mouths, surf zones and river systems.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.99,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-BAIT-0001',
        reliability: 0.99,
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
      'mullet',
      'natural bait',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),

  KnowledgeRecord(
    id: 'NKS-GRK-BAIT-0002',
    species: 'Garrick',
    category: KnowledgeCategory.bait,
    title: 'Live Shad',
    description:
    'Where legally permitted and used in accordance with current regulations, live Shad is regarded by experienced anglers as an effective bait for targeting larger Garrick.',
    evidenceLevel: EvidenceLevel.regulation,
    confidence: 0.90,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-BAIT-0002',
        reliability: 0.90,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Summer',
      'Autumn',
    ],
    tags: [
      'garrick',
      'live shad',
      'legal',
      'bait',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),

  KnowledgeRecord(
    id: 'NKS-GRK-BAIT-0003',
    species: 'Garrick',
    category: KnowledgeCategory.bait,
    title: 'Live Karanteen',
    description:
    'Live karanteen is a durable baitfish that is regularly used by experienced anglers when targeting Garrick in surf and estuarine environments.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.93,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-BAIT-0003',
        reliability: 0.93,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'garrick',
      'karanteen',
      'live bait',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),

  KnowledgeRecord(
    id: 'NKS-GRK-BAIT-0004',
    species: 'Garrick',
    category: KnowledgeCategory.bait,
    title: 'Sardine Fillet',
    description:
    'A fresh sardine fillet can be an effective natural bait when Garrick are actively feeding in the surf, particularly where baitfish are abundant.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.88,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-BAIT-0004',
        reliability: 0.88,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: [
      'Spring',
      'Summer',
    ],
    tags: [
      'garrick',
      'sardine',
      'fillet',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),

  KnowledgeRecord(
    id: 'NKS-GRK-BAIT-0005',
    species: 'Garrick',
    category: KnowledgeCategory.bait,
    title: 'Live Pinkie',
    description:
    'Live pinkies are occasionally used by experienced anglers when available and can be highly effective for larger Garrick.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.86,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-BAIT-0005',
        reliability: 0.86,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Summer',
      'Autumn',
    ],
    tags: [
      'garrick',
      'pinkie',
      'live bait',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),
];