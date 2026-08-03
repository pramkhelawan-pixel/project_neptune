import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> garrickBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRK-BAIT-0001',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.bait,
    title: 'Live Mullet',
    description:
    'Live mullet is regarded by experienced South African anglers as one of the premier natural baits for Garrick. A healthy, naturally presented mullet is particularly effective around estuary mouths, surf zones and river systems.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-BAIT-0001',
        reliability: 0.99,
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
      'mullet',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-BAIT-0002',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.bait,
    title: 'Live Shad',
    description:
    'Where legally permitted and used in accordance with current regulations, live Shad is regarded as an effective bait for targeting larger Garrick.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-BAIT-0002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'garrick',
      'live shad',
      'legal',
      'bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-BAIT-0003',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.bait,
    title: 'Live Karanteen',
    description:
    'Live karanteen is a durable baitfish regularly used by experienced anglers when targeting Garrick in surf and estuarine environments.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-BAIT-0003',
        reliability: 0.93,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'garrick',
      'karanteen',
      'live bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-BAIT-0004',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.bait,
    title: 'Sardine Fillet',
    description:
    'Fresh sardine fillet can be an effective natural bait when Garrick are actively feeding in the surf, particularly where baitfish are abundant.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-BAIT-0004',
        reliability: 0.88,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'garrick',
      'sardine',
      'fillet',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-BAIT-0005',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.bait,
    title: 'Live Pinkie',
    description:
    'Live pinkies are occasionally used by experienced anglers when available and can be highly effective for larger Garrick.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-BAIT-0005',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'garrick',
      'pinkie',
      'live bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
];