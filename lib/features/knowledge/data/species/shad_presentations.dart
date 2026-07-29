import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> shadPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-PRES-0001',
    species: 'Shad',
    category: KnowledgeCategory.presentation,
    title: 'Butterfly Sardine Presentation',
    description:
    'Butterflying a fresh sardine produces a natural profile while exposing scent and oils. It is one of the most productive presentations for Shad in South African surf fishing.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.99,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-PRES-0001',
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
      'presentation',
      'butterfly',
      'sardine',
      'natural bait',
      'shad',
    ],
    lastUpdated: DateTime(2026, 7, 29),
  ),

  KnowledgeRecord(
    id: 'NKS-SHD-PRES-0002',
    species: 'Shad',
    category: KnowledgeCategory.presentation,
    title: 'Fillet Presentation',
    description:
    'A streamlined sardine fillet is ideal when longer casts are required and a more aerodynamic bait is preferred.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.95,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-PRES-0002',
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
      'presentation',
      'fillet',
      'casting',
      'shad',
    ],
    lastUpdated: DateTime(2026, 7, 29),
  ),
];