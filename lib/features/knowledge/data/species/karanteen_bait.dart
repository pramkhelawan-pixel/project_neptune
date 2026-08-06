import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> karanteenBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KRN-BAIT-0001',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.bait,
    title: 'White Bread',
    description:
    'A small ball of soft white bread is a classic and highly effective bait for Karanteen, often fished alongside a berley trail to draw a shoal within range.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KRN-BAIT-0001',
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
    ],
    tags: const [
      'karanteen',
      'bread',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-KRN-BAIT-0002',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.bait,
    title: 'Red Bait',
    description:
    'Red bait is a reliable natural bait choice for Karanteen, particularly effective around reef and rocky gullies.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KRN-BAIT-0002',
        reliability: 0.89,
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
      'red bait',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-KRN-BAIT-0003',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.bait,
    title: 'Small Green Weed',
    description:
    'Small pieces of green algae or weed can be highly effective given the species\' largely herbivorous diet, particularly in clean reef water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KRN-BAIT-0003',
        reliability: 0.80,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'karanteen',
      'weed',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
