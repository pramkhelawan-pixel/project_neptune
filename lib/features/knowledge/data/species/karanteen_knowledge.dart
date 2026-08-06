import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> karanteenKnowledge = [
  KnowledgeRecord(
    id: 'NKB-KRN-IDENTITY-0001',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Karanteen (Sarpa salpa) is a shoaling sea bream common around South African reef and rocky shorelines. It is targeted both as a light-tackle species in its own right and as prized live bait for predators such as Garrick and Kob.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-KRN-001',
        reliability: 0.90,
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
      'identity',
      'karanteen',
      'sea bream',
      'live bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-KRN-HABITAT-0001',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Karanteen shoal around reef, rocky gullies and harbour walls, frequently found in relatively shallow, clean water close to structure.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-KRN-002',
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
      'habitat',
      'reef',
      'harbour wall',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-KRN-BEHAVIOUR-0001',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.behaviour,
    title: 'Shoaling Behaviour',
    description:
    'Karanteen move in tight shoals around reef and structure, meaning a good bite can often produce multiple fish from the same spot in quick succession.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-KRN-003',
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
      'behaviour',
      'shoaling',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-KRN-FEEDING-0001',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Karanteen are primarily grazers, feeding on algae and small invertebrates around reef and rocky structure, and readily take bread and small natural baits.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-KRN-004',
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
      'feeding',
      'algae',
      'grazer',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-KRN-SEASON-0001',
    species: 'Karanteen',
    targetSpecies: const ['Karanteen'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Karanteen are present year-round but are most active and easiest to catch during the warmer spring, summer and autumn months.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-KRN-005',
        reliability: 0.82,
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
      'season',
      'summer',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
