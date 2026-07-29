import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> shadKnotKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-KNOT-0001',
    species: 'Shad',
    category: KnowledgeCategory.knots,
    title: 'Figure Eight Knot',
    description:
    'The Figure Eight Knot is commonly used to form secure loops in trace construction. It is easy to tie, reliable and retains a high percentage of line strength.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.97,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-KNOT-0001',
        reliability: 0.97,
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
      'Summer',
    ],
    tags: [
      'knot',
      'figure eight',
      'loop',
      'trace',
      'shad',
    ],
    lastUpdated: DateTime(2026, 7, 29),
  ),
  KnowledgeRecord(
    id: 'NKS-SHD-KNOT-0002',
    species: 'Shad',
    category: KnowledgeCategory.knots,
    title: 'Improved Clinch Knot',
    description:
    'The Improved Clinch Knot is a dependable choice for securing hooks and swivels when targeting Shad with light to medium tackle.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.95,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-KNOT-0002',
        reliability: 0.95,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: [
      'knot',
      'clinch',
      'hook',
      'swivel',
      'shad',
    ],
    lastUpdated: DateTime(2026, 7, 29),
  ),
];