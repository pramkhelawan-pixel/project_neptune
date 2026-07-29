import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> shadLeaderKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-LEADER-0001',
    species: 'Shad',
    category: KnowledgeCategory.leader,
    title: '0.70 mm Nylon Leader',
    description:
    'A 0.70 mm abrasion-resistant nylon leader is a widely used choice for targeting Shad with natural baits from the surf. It offers a balance between casting performance, abrasion resistance and bite protection.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.98,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-LEADER-0001',
        reliability: 0.98,
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
      'leader',
      'nylon',
      '0.70 mm',
      'abrasion resistant',
      'shad',
    ],
    lastUpdated: DateTime(2026, 7, 29),
  ),

  KnowledgeRecord(
    id: 'NKS-SHD-LEADER-0002',
    species: 'Shad',
    category: KnowledgeCategory.leader,
    title: '0.80 mm Nylon Leader',
    description:
    'A 0.80 mm leader is preferred when heavy surf, rocky structure or larger fish require additional abrasion resistance and strength.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.93,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-LEADER-0002',
        reliability: 0.94,
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
      'leader',
      '0.80 mm',
      'heavy surf',
      'rock fishing',
    ],
    lastUpdated: DateTime(2026, 7, 29),
  ),
];