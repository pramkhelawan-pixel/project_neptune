import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> zebraKnowledge = [
  KnowledgeRecord(
    id: 'NKB-ZBR-IDENTITY-0001',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Zebra (Diplodus cervinus hottentotus) is a distinctively striped reef sparid found along the South African coastline, closely related to Blacktail but generally found in deeper, more structure-rich water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-ZBR-001',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'Western Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'identity',
      'zebra',
      'sparid',
      'reef',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-ZBR-HABITAT-0001',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Zebra hold close to reef ledges and deep gullies, generally in deeper, more structure-rich water than Blacktail.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-ZBR-002',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'habitat',
      'reef ledge',
      'deep gully',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-ZBR-BEHAVIOUR-0001',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.behaviour,
    title: 'Structure-Oriented Behaviour',
    description:
    'Zebra remain close to reef structure at all times and will typically dive for cover immediately when hooked, requiring firm early pressure from the angler.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-ZBR-003',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'behaviour',
      'structure',
      'fight',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-ZBR-FEEDING-0001',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Zebra feed close to reef structure and ledges on mussel, red bait and small crustaceans, generally within a short distance of cover.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-ZBR-004',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'feeding',
      'mussel',
      'red bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-ZBR-SEASON-0001',
    species: 'Zebra',
    targetSpecies: const ['Zebra'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Zebra are most reliably targeted during the cooler winter and spring months, similar to Blacktail and other rock and reef sparids.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-ZBR-005',
        reliability: 0.82,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'season',
      'winter',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
