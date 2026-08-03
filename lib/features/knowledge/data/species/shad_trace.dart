import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> shadTraceKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-RIG-0001',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.rig,
    title: 'Single Hook Throw Bait Trace',
    description:
    'The standard trace used by experienced South African surf anglers when targeting Shad with natural bait. It provides excellent bait presentation, long casting ability and quick hook penetration.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-RIG-0001',
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
      'shad',
      'rig',
      'throw bait',
      'single hook',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
  KnowledgeRecord(
    id: 'NKS-SHD-RIG-0002',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.rig,
    title: 'Double Hook Throw Bait Trace',
    description:
    'A double hook trace improves bait security during repeated casting and helps keep longer sardine presentations streamlined in rougher surf.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-RIG-0002',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'double hook',
      'rig',
      'throw bait',
      'rough surf',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
  KnowledgeRecord(
    id: 'NKS-SHD-RIG-0003',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.rig,
    title: 'Light Spoon Trace',
    description:
    'A light spinning trace designed for casting spoons when Shad are actively feeding near the surface. Best suited to clean water and visible feeding activity.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-RIG-0003',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'spinning',
      'spoon',
      'lure',
      'trace',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
];