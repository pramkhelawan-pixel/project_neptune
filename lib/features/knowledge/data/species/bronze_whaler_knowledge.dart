import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> bronzeWhalerKnowledge = [
  KnowledgeRecord(
    id: 'NKB-BWS-IDENTITY-0001',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Bronze Whaler (Carcharhinus brachyurus), also known as Copper Shark, is a fast, powerful predator and one of the most commonly encountered sharks along the South African coast, frequently targeted from surf and estuary mouths.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-001',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'identity',
      'bronze whaler',
      'copper shark',
      'shark',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BWS-HABITAT-0001',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Bronze Whalers patrol the surf zone, estuary mouths and sandy bays, often moving in close to shore when baitfish shoals are present.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-002',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'habitat',
      'surf zone',
      'estuary',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BWS-BEHAVIOUR-0001',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.behaviour,
    title: 'Hunting and Fighting Behaviour',
    description:
    'A fast, aggressive hunter that pursues bait shoals into shallow water, giving powerful, sustained runs once hooked that can strip significant line.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-003',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'behaviour',
      'fight',
      'runs',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BWS-FEEDING-0001',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Feeds primarily on shoaling fish and squid, often following bait balls close to shore, with feeding activity increasing sharply around dawn and dusk.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-004',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'feeding',
      'baitfish',
      'squid',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BWS-SEASON-0001',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Numbers build inshore through spring and peak in summer and early autumn as bait shoals move along the coast, tapering off as water temperatures drop in winter.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-005',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
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
