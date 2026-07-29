import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> shadSinkerKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-SINKER-0001',
    species: 'Shad',
    category: KnowledgeCategory.tackle,
    title: '4 oz Grapnel Sinker',
    description:
    'A 4 oz grapnel sinker provides reliable holding power in light to moderate surf while allowing natural bait presentations for Shad.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.96,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-SINKER-0001',
        reliability: 0.96,
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
      'sinker',
      'grapnel',
      '4 oz',
      'shad',
    ],
    lastUpdated: DateTime(2026, 7, 29),
  ),
  KnowledgeRecord(
    id: 'NKS-SHD-SINKER-0002',
    species: 'Shad',
    category: KnowledgeCategory.tackle,
    title: '5 oz Grapnel Sinker',
    description:
    'A 5 oz grapnel sinker is preferred when stronger currents or heavier surf require additional holding power while maintaining bait position.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.94,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-SINKER-0002',
        reliability: 0.95,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: [
      'Winter',
      'Spring',
    ],
    tags: [
      'sinker',
      'grapnel',
      '5 oz',
      'heavy surf',
    ],
    lastUpdated: DateTime(2026, 7, 29),
  ),
];