import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> shadSpeciesKnowledge = [
  KnowledgeRecord(
    id: 'NKR-SPC-000001',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.identity,
    title: 'Shad (Elf)',
    description:
    'Shad (Pomatomus saltatrix), also known as Elf in the Western Cape, is South Africa\'s most popular surf predatory game fish. It is an aggressive shoaling hunter that feeds primarily on sardine, anchovy and other baitfish close to the shoreline.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Species Intelligence',
        reference: 'NKS-SPC-000001',
        reliability: 0.99,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'species',
      'predator',
      'surf',
      'gamefish',
      'shad',
      'elf',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
];