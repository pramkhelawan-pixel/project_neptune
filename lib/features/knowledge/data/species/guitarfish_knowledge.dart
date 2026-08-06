import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> guitarfishKnowledge = [
  KnowledgeRecord(
    id: 'NKB-GTF-IDENTITY-0001',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Guitarfish (Rhinobatos annulatus), also known as Lesser Sandshark, is a docile, shark-shaped ray and one of the most common and beginner-friendly catch-and-release species along the South African coast.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-001',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'identity',
      'guitarfish',
      'sandshark',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GTF-HABITAT-0001',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Common in the surf zone, estuaries and shallow sandy bays right along the coast, frequently caught within easy casting distance of the shore.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-002',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
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
    id: 'NKB-GTF-BEHAVIOUR-0001',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.behaviour,
    title: 'Feeding and Fighting Behaviour',
    description:
    'Docile and toothless, the Guitarfish bites readily and gives a steady, manageable fight, making it an approachable species for junior and novice anglers.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-003',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'behaviour',
      'docile',
      'beginner friendly',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GTF-FEEDING-0001',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Roots through sand for worms and small crustaceans, feeding actively both day and night in shallow water close to shore.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-004',
        reliability: 0.88,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'feeding',
      'worm',
      'crustacean',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GTF-SEASON-0001',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Caught consistently year-round, with numbers along the southern and eastern coast peaking during the cooler autumn to spring months.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-005',
        reliability: 0.83,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'season',
      'year-round',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
