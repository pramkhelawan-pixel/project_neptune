import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> kobPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-PRES-0001',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.presentation,
    title: 'Chokka and Sardine Wrap',
    description:
    'A chokka and sardine wrap is one of the most productive natural bait presentations for Dusky Kob. The chokka secures the bait while the sardine provides scent and oil, creating an attractive presentation in the surf.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-PRES-0001',
        reliability: 0.99,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'kob',
      'presentation',
      'chokka',
      'sardine',
      'combo bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
  KnowledgeRecord(
    id: 'NKS-KOB-PRES-0002',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.presentation,
    title: 'Whole Sardine Presentation',
    description:
    'A whole sardine presentation is effective when larger Dusky Kob are actively feeding on sizeable baitfish. It provides a substantial bait profile while releasing a strong scent trail.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-PRES-0002',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Western Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'kob',
      'whole sardine',
      'presentation',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
];