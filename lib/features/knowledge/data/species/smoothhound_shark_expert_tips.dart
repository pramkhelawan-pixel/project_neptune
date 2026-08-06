import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> smoothhoundSharkExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SHS-TIP-0001',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.technique,
    title: 'A Great Light-Tackle Introduction',
    description:
    'The Smoothhound\'s willingness to bite and lack of sharp teeth make it an ideal species for introducing new anglers to shark fishing on light spinning tackle.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-013',
        reliability: 0.80,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
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
    id: 'NKB-SHS-TIP-0002',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.technique,
    title: 'Fish the Push of the Tide',
    description:
    'Bite activity noticeably increases as the tide pushes in over shallow flats, carrying scent from buried crustaceans and drawing Smoothhounds within casting range.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-014',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'technique',
      'tide',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-SHS-TIP-0003',
    species: 'Smoothhound Shark',
    targetSpecies: const ['Smoothhound Shark'],
    category: KnowledgeCategory.technique,
    title: 'Support the Fish During Release',
    description:
    'Cradle the shark horizontally and support its weight fully when handling; Smoothhounds can be injured internally if held vertically by the tail.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-SHS-015',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'technique',
      'fish care',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
