import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> kobLeaderKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-LEADER-0001',
    species: 'Dusky Kob',
    category: KnowledgeCategory.leader,
    title: '0.80 mm Nylon Leader',
    description:
    'A 0.80 mm abrasion-resistant nylon leader is a dependable choice for targeting Dusky Kob from the surf. It offers excellent abrasion resistance around sandbanks, rocks and structure while maintaining good casting performance.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.98,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-LEADER-0001',
        reliability: 0.98,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: [
      'Summer',
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: [
      'kob',
      'leader',
      '0.80 mm',
      'nylon',
      'abrasion resistant',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),

  KnowledgeRecord(
    id: 'NKS-KOB-LEADER-0002',
    species: 'Dusky Kob',
    category: KnowledgeCategory.leader,
    title: '1.00 mm Nylon Leader',
    description:
    'A 1.00 mm nylon leader is recommended when fishing heavy structure, strong surf or when presenting large baits for trophy Dusky Kob.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.94,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-LEADER-0002',
        reliability: 0.95,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: [
      'Summer',
      'Autumn',
      'Winter',
    ],
    tags: [
      'kob',
      'leader',
      '1.00 mm',
      'heavy surf',
      'large bait',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),
];