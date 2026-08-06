import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> guitarfishExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKB-GTF-TIP-0001',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.technique,
    title: 'A Reliable Species to Introduce New Anglers',
    description:
    'Its willingness to bite, manageable fight and lack of teeth or spines make the Guitarfish an ideal first catch-and-release species for junior anglers.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-013',
        reliability: 0.82,
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
      'technique',
      'beginner',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GTF-TIP-0002',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.technique,
    title: 'Fish Close-In Gutters at First and Last Light',
    description:
    'Bite rates peak in shallow gutters at dawn and dusk when Guitarfish move in to feed on worms and crustaceans exposed by the tide.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-014',
        reliability: 0.86,
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
      'technique',
      'timing',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-GTF-TIP-0003',
    species: 'Guitarfish',
    targetSpecies: const ['Guitarfish'],
    category: KnowledgeCategory.technique,
    title: 'Handle Gently for a Quick Release',
    description:
    'Despite being hardy, avoid unnecessary handling time; unhook over wet sand or in the shallows and return the fish to the water promptly.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-GTF-015',
        reliability: 0.88,
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
      'technique',
      'fish care',
      'release',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
