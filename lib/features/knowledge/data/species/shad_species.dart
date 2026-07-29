import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> shadSpeciesKnowledge = [
  KnowledgeRecord(
    id: 'NKR-SPC-000001',
    species: 'Shad',
    category: KnowledgeCategory.identity,
    title: 'Shad (Elf)',
    description:
    'Shad (Pomatomus saltatrix), also known as Elf in the Western Cape, '
        'is South Africa\'s most popular surf predatory game fish. It is an '
        'aggressive shoaling hunter that feeds primarily on sardine, anchovy '
        'and other baitfish close to the shoreline.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.99,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Species Intelligence',
        reference: 'NKS-SPC-000001',
        reliability: 0.99,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: [
      'species',
      'predator',
      'surf',
      'gamefish',
      'shad',
      'elf',
    ],
    lastUpdated: DateTime(2026, 7, 29),
  ),
];