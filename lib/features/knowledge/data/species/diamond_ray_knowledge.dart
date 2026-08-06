import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> diamondRayKnowledge = [
  KnowledgeRecord(
    id: 'NKB-DMR-IDENTITY-0001',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Diamond Ray (Gymnura natalensis), also called Backwater Butterfly Ray, is a broad, near-tailless ray found in shallow KwaZulu-Natal estuaries and a distinctive light-tackle catch.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-001',
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
      'identity',
      'diamond ray',
      'butterfly ray',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DMR-HABITAT-0001',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Prefers shallow estuary channels, sandbanks and mangrove-fringed water, where it buries itself in sand to ambush passing prey.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-002',
        reliability: 0.85,
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
      'mangrove',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DMR-BEHAVIOUR-0001',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.behaviour,
    title: 'Ambush and Fighting Behaviour',
    description:
    'An ambush feeder that lies buried in sand or mud, striking quickly at prey that passes close by, and gives a powerful, low pulling fight typical of its broad body shape.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-003',
        reliability: 0.85,
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
      'behaviour',
      'ambush',
      'fight',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DMR-FEEDING-0001',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Feeds on small fish and crustaceans that stray close to its buried ambush position, most active in shallow water after dark.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-004',
        reliability: 0.81,
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
      'ambush',
      'nocturnal',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DMR-SEASON-0001',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Most active in warm summer and autumn months when it moves further into shallow estuary sandbanks to feed.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-005',
        reliability: 0.77,
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
