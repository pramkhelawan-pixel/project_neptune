import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> raggedtoothSharkKnowledge = [
  KnowledgeRecord(
    id: 'NKB-RTS-IDENTITY-0001',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'The Ragged-tooth Shark (Carcharias taurus), or "Raggie", is a large, slow-moving shark instantly recognisable by its protruding, needle-like teeth. It forms famous winter aggregations off the KwaZulu-Natal and Eastern Cape coast.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-001',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'identity',
      'raggie',
      'shark',
      'protected',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-RTS-CONSERVATION-0001',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.conservation,
    title: 'Protected Species: Catch and Release Only',
    description:
    'The Ragged-tooth Shark is a protected species under South African fisheries regulations. It may not be targeted with intent to retain and must never be removed from the water. All captures must be released immediately using safe handling practices.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-002',
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
    ],
    tags: const [
      'conservation',
      'protected species',
      'regulations',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-RTS-HABITAT-0001',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Ragged-tooth Sharks aggregate around reef systems, sandy-bottomed gullies and offshore ridges, with Aliwal Shoal and Protea Banks among the best-known aggregation sites in South Africa.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-003',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'habitat',
      'reef',
      'aggregation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-RTS-BEHAVIOUR-0001',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.behaviour,
    title: 'Aggregation and Fighting Behaviour',
    description:
    'Despite its fearsome teeth, the Raggie is a placid species, often gathering in large numbers over winter. It fights with sustained, heavy pressure rather than fast runs.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-004',
        reliability: 0.88,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'behaviour',
      'fight',
      'docile',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-RTS-FEEDING-0001',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Feeds primarily on small shoaling fish, becoming most active around dawn and dusk when baitfish activity increases along the reef edge.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-005',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'feeding',
      'baitfish',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-RTS-SEASON-0001',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.seasonality,
    title: 'Winter Sardine Run Aggregations',
    description:
    'Large seasonal aggregations form along the KwaZulu-Natal and Eastern Cape coast during the annual winter sardine run, making this the peak encounter window.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-006',
        reliability: 0.90,
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
      'season',
      'winter',
      'sardine run',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
