import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> kobPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-PRES-0001',
    species: 'Dusky Kob',
    category: KnowledgeCategory.presentation,
    title: 'Chokka and Sardine Wrap',
    description:
    'A chokka and sardine wrap is one of the most productive natural bait presentations for Dusky Kob. The chokka secures the bait while the sardine provides scent and oil, creating an attractive presentation in the surf.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.99,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-PRES-0001',
        reliability: 0.99,
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
      'presentation',
      'chokka',
      'sardine',
      'combo bait',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),

  KnowledgeRecord(
    id: 'NKS-KOB-PRES-0002',
    species: 'Dusky Kob',
    category: KnowledgeCategory.presentation,
    title: 'Whole Sardine Presentation',
    description:
    'A whole sardine presentation is effective when larger Dusky Kob are actively feeding on sizeable baitfish. It provides a substantial bait profile while releasing a strong scent trail.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.94,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-PRES-0002',
        reliability: 0.95,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Western Cape',
    ],
    seasons: [
      'Winter',
      'Spring',
    ],
    tags: [
      'kob',
      'whole sardine',
      'presentation',
      'natural bait',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),
];