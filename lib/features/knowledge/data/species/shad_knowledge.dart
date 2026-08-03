import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> shadKnowledge = [
  KnowledgeRecord(
    id: 'NKB-SHD-BAIT-0001',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.bait,
    title: 'Fresh Sardine',
    description:
    'Fresh sardine is one of the highest confidence natural baits for targeting Shad along the KwaZulu-Natal coastline.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-001',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'bait',
      'fresh sardine',
      'shad',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 27),
    updatedAt: DateTime(2026, 7, 27),
  ),
  KnowledgeRecord(
    id: 'NKB-SHD-LURE-0001',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.lure,
    title: 'Metal Spoon',
    description:
    'Metal spoons are among the most widely used artificial lures for targeting Shad from the South African surf, particularly when fish are actively feeding.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-002',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'lure',
      'metal spoon',
      'shad',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 27),
    updatedAt: DateTime(2026, 7, 27),
  ),
  KnowledgeRecord(
    id: 'NKB-SHD-PRESENTATION-0001',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.presentation,
    title: 'Fast Retrieve',
    description:
    'A consistently fast retrieve is commonly effective when Shad are actively hunting baitfish in the surf zone.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-003',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'presentation',
      'fast retrieve',
      'shad',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 27),
    updatedAt: DateTime(2026, 7, 27),
  ),
  KnowledgeRecord(
    id: 'NKB-SHD-PRESENTATION-0002',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.presentation,
    title: 'Erratic Retrieve',
    description:
    'Introducing pauses and changes in retrieve speed may trigger strikes from following Shad under suitable conditions.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-004',
        reliability: 0.82,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'presentation',
      'erratic retrieve',
      'shad',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 27),
    updatedAt: DateTime(2026, 7, 27),
  ),
];