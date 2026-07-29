import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> shadTraceKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-RIG-0001',

    species: 'Shad',

    category: KnowledgeCategory.rig,

    title: 'Single Hook Throw Bait Trace',

    description:
    'The standard trace used by experienced South African surf anglers when targeting Shad with natural bait. It provides excellent bait presentation, long casting ability and quick hook penetration.',

    evidenceLevel: EvidenceLevel.experiencedAngler,

    confidence: 0.99,

    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-RIG-0001',
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
      'shad',
      'rig',
      'throw bait',
      'single hook',
      'natural bait',
    ],

    lastUpdated: DateTime(2026, 7, 29),
  ),

  KnowledgeRecord(
    id: 'NKS-SHD-RIG-0002',

    species: 'Shad',

    category: KnowledgeCategory.rig,

    title: 'Double Hook Throw Bait Trace',

    description:
    'A double hook trace improves bait security during repeated casting and helps keep longer sardine presentations streamlined in rougher surf.',

    evidenceLevel: EvidenceLevel.experiencedAngler,

    confidence: 0.94,

    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-RIG-0002',
        reliability: 0.95,
      ),
    ],

    regions: [
      'KwaZulu-Natal',
    ],

    seasons: [
      'Winter',
      'Spring',
    ],

    tags: [
      'double hook',
      'rig',
      'throw bait',
      'rough surf',
    ],

    lastUpdated: DateTime(2026, 7, 29),
  ),

  KnowledgeRecord(
    id: 'NKS-SHD-RIG-0003',

    species: 'Shad',

    category: KnowledgeCategory.rig,

    title: 'Light Spoon Trace',

    description:
    'A light spinning trace designed for casting spoons when Shad are actively feeding near the surface. Best suited to clean water and visible feeding activity.',

    evidenceLevel: EvidenceLevel.experiencedAngler,

    confidence: 0.90,

    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-RIG-0003',
        reliability: 0.91,
      ),
    ],

    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],

    seasons: [
      'Autumn',
      'Winter',
    ],

    tags: [
      'spinning',
      'spoon',
      'lure',
      'trace',
    ],

    lastUpdated: DateTime(2026, 7, 29),
  ),
];