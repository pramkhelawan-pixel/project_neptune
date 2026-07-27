import '../domain/evidence_level.dart';
import '../domain/knowledge_category.dart';
import '../domain/knowledge_record.dart';
import '../domain/knowledge_source.dart';

final shadKnowledge = <KnowledgeRecord>[
  KnowledgeRecord(
    id: 'NKB-SHD-BAIT-0001',
    species: 'Shad',
    category: KnowledgeCategory.bait,
    title: 'Fresh Sardine',
    description:
    'Fresh sardine is one of the highest confidence natural baits for targeting Shad along the KwaZulu-Natal coastline.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.94,
    sources: [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-001',
        reliability: 0.90,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Winter',
    ],
    tags: [
      'bait',
      'fresh sardine',
      'shad',
    ],
    lastUpdated: DateTime(
      2026,
      7,
      27,
    ),
  ),
  KnowledgeRecord(
    id: 'NKB-SHD-LURE-0001',
    species: 'Shad',
    category: KnowledgeCategory.lure,
    title: 'Metal Spoon',
    description:
    'Metal spoons are among the most widely used artificial lures for targeting Shad from the South African surf, particularly when fish are actively feeding.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.93,
    sources: [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-002',
        reliability: 0.91,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: [
      'lure',
      'metal spoon',
      'shad',
    ],
    lastUpdated: DateTime(
      2026,
      7,
      27,
    ),
  ),
  KnowledgeRecord(
    id: 'NKB-SHD-PRESENTATION-0001',
    species: 'Shad',
    category: KnowledgeCategory.presentation,
    title: 'Fast Retrieve',
    description:
    'A consistently fast retrieve is commonly effective when Shad are actively hunting baitfish in the surf zone.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.89,
    sources: [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-003',
        reliability: 0.89,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: [
      'presentation',
      'fast retrieve',
      'shad',
    ],
    lastUpdated: DateTime(
      2026,
      7,
      27,
    ),
  ),
  KnowledgeRecord(
    id: 'NKB-SHD-PRESENTATION-0002',
    species: 'Shad',
    category: KnowledgeCategory.presentation,
    title: 'Erratic Retrieve',
    description:
    'Introducing pauses and changes in retrieve speed may trigger strikes from following Shad under suitable conditions.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.79,
    sources: [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-004',
        reliability: 0.82,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
    ],
    seasons: [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: [
      'presentation',
      'erratic retrieve',
      'shad',
    ],
    lastUpdated: DateTime(
      2026,
      7,
      27,
    ),
  ),
];