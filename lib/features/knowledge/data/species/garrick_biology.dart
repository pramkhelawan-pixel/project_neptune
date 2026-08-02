import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> garrickBiologyKnowledge = [
  KnowledgeRecord(
    id: 'NKB-GRK-BIO-0001',
    species: 'Garrick',
    category: KnowledgeCategory.species,
    title: 'Taxonomy',
    description:
    'Garrick (Lichia amia) is a large predatory marine fish belonging to the family Carangidae (jacks and trevallies).',
    evidenceLevel: EvidenceLevel.scientific,
    confidence: 1.00,
    sources: [
      KnowledgeSource(
        name: 'FishBase',
        type: 'Scientific Database',
        reference: 'Lichia amia',
        reliability: 1.00,
      ),
    ],
    regions: [
      'South Africa',
    ],
    seasons: const [],
    tags: [
      'biology',
      'taxonomy',
      'carangidae',
      'lichia amia',
    ],
    lastUpdated: DateTime(2026, 8, 3),
  ),
  KnowledgeRecord(
    id: 'NKB-GRK-BIO-0002',
    species: 'Garrick',
    category: KnowledgeCategory.fishAnatomy,
    title: 'Growth',
    description:
    'Garrick are a relatively fast-growing coastal predator capable of exceeding one metre in length under favourable conditions.',
    evidenceLevel: EvidenceLevel.scientific,
    confidence: 0.97,
    sources: [
      KnowledgeSource(
        name: 'FishBase',
        type: 'Scientific Database',
        reference: 'Growth Characteristics',
        reliability: 0.98,
      ),
    ],
    regions: [
      'South Africa',
    ],
    seasons: const [],
    tags: [
      'growth',
      'biology',
      'length',
    ],
    lastUpdated: DateTime(2026, 8, 3),
  ),
  KnowledgeRecord(
    id: 'NKB-GRK-BIO-0003',
    species: 'Garrick',
    category: KnowledgeCategory.fishBehaviour,
    title: 'Life History',
    description:
    'Juvenile Garrick commonly utilise estuaries as nursery habitats before moving into coastal marine environments as they mature.',
    evidenceLevel: EvidenceLevel.scientific,
    confidence: 0.98,
    sources: [
      KnowledgeSource(
        name: 'South African Marine Research',
        type: 'Scientific Literature',
        reference: 'Estuarine Nursery Function',
        reliability: 0.98,
      ),
    ],
    regions: [
      'South Africa',
    ],
    seasons: const [],
    tags: [
      'nursery',
      'juvenile',
      'estuary',
      'life history',
    ],
    lastUpdated: DateTime(2026, 8, 3),
  ),
  KnowledgeRecord(
    id: 'NKB-GRK-BIO-0004',
    species: 'Garrick',
    category: KnowledgeCategory.fishAnatomy,
    title: 'Predatory Adaptation',
    description:
    'Garrick possess a streamlined body, powerful caudal fin and excellent vision, enabling rapid pursuit of schooling baitfish in surf and estuarine environments.',
    evidenceLevel: EvidenceLevel.scientific,
    confidence: 0.96,
    sources: [
      KnowledgeSource(
        name: 'Neptune Scientific Review',
        type: 'Scientific Summary',
        reference: 'Predatory Adaptations',
        reliability: 0.96,
      ),
    ],
    regions: [
      'South Africa',
    ],
    seasons: const [],
    tags: [
      'predator',
      'adaptation',
      'biology',
      'anatomy',
    ],
    lastUpdated: DateTime(2026, 8, 3),
  ),
];