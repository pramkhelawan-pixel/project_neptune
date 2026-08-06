import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> grunterKnowledge = [
  KnowledgeRecord(
    id: 'NKB-GRN-IDENTITY-0001',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Spotted Grunter (Pomadasys commersonnii) is a popular estuary and surf species found along the KwaZulu-Natal and Eastern Cape coastline, prized for its powerful fight and its habit of feeding by rooting in sand and mud.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRN-001',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'identity',
      'grunter',
      'spotted grunter',
      'estuary',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GRN-HABITAT-0001',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Grunter are closely tied to estuaries and river mouths, frequently moving between muddy channels and adjacent surf, particularly where sediment discolours the water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRN-002',
        reliability: 0.90,
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
      'estuary',
      'murky water',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GRN-BEHAVIOUR-0001',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.behaviour,
    title: 'Rooting Feeding Behaviour',
    description:
    'Grunter feed by rooting nose-down in sand and mud for buried prawns and worms, a behaviour that gives the species its name from the grunting sound made when handled.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRN-003',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'behaviour',
      'rooting',
      'estuary',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GRN-FEEDING-0001',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Grunter feed primarily on prawns and marine worms buried in sand and mud, becoming notably more active in discoloured water and after rainfall.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRN-004',
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
      'feeding',
      'prawn',
      'worm',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GRN-SEASON-0001',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Grunter fishing is typically most productive during the warmer summer and autumn months, coinciding with peak estuary prawn and worm activity.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GRN-005',
        reliability: 0.84,
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
      'season',
      'summer',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
