import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> garrickBiologyKnowledge = [
  KnowledgeRecord(
    id: 'NKB-GRK-BIO-0001',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.taxonomy,
    title: 'Taxonomy',
    description:
    'Garrick (Lichia amia) is a large predatory marine fish belonging to the family Carangidae (jacks and trevallies).',
    evidenceLevel: EvidenceLevel.scientific,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'FishBase',
        type: 'Scientific Database',
        reference: 'Lichia amia',
        reliability: 1.00,
      ),
    ],
    regions: const [
      'South Africa',
    ],
    seasons: const [],
    tags: const [
      'biology',
      'taxonomy',
      'carangidae',
      'lichia amia',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 3),
    updatedAt: DateTime(2026, 8, 3),
  ),
  KnowledgeRecord(
    id: 'NKB-GRK-BIO-0002',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.anatomy,
    title: 'Growth',
    description:
    'Garrick are a relatively fast-growing coastal predator capable of exceeding one metre in length under favourable conditions.',
    evidenceLevel: EvidenceLevel.scientific,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'FishBase',
        type: 'Scientific Database',
        reference: 'Growth Characteristics',
        reliability: 0.98,
      ),
    ],
    regions: const [
      'South Africa',
    ],
    seasons: const [],
    tags: const [
      'growth',
      'biology',
      'length',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 3),
    updatedAt: DateTime(2026, 8, 3),
  ),
  KnowledgeRecord(
    id: 'NKB-GRK-BIO-0003',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.behaviour,
    title: 'Life History',
    description:
    'Juvenile Garrick commonly utilise estuaries as nursery habitats before moving into coastal marine environments as they mature.',
    evidenceLevel: EvidenceLevel.scientific,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'South African Marine Research',
        type: 'Scientific Literature',
        reference: 'Estuarine Nursery Function',
        reliability: 0.98,
      ),
    ],
    regions: const [
      'South Africa',
    ],
    seasons: const [],
    tags: const [
      'nursery',
      'juvenile',
      'estuary',
      'life history',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 3),
    updatedAt: DateTime(2026, 8, 3),
  ),
  KnowledgeRecord(
    id: 'NKB-GRK-BIO-0004',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.anatomy,
    title: 'Predatory Adaptation',
    description:
    'Garrick possess a streamlined body, powerful caudal fin and excellent vision, enabling rapid pursuit of schooling baitfish in surf and estuarine environments.',
    evidenceLevel: EvidenceLevel.scientific,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Scientific Review',
        type: 'Scientific Summary',
        reference: 'Predatory Adaptations',
        reliability: 0.96,
      ),
    ],
    regions: const [
      'South Africa',
    ],
    seasons: const [],
    tags: const [
      'predator',
      'adaptation',
      'biology',
      'anatomy',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 3),
    updatedAt: DateTime(2026, 8, 3),
  ),
];