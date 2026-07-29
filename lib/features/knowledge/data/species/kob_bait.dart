import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> kobBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-BAIT-0001',
    species: 'Dusky Kob',
    category: KnowledgeCategory.bait,
    title: 'Chokka and Sardine Combo',
    description:
    'A combination of chokka and sardine is one of the most trusted natural bait presentations for Dusky Kob. The chokka provides durability while the sardine releases scent and oil into the water.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.99,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-BAIT-0001',
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
      'chokka',
      'sardine',
      'combo bait',
      'natural bait',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),

  KnowledgeRecord(
    id: 'NKS-KOB-BAIT-0002',
    species: 'Dusky Kob',
    category: KnowledgeCategory.bait,
    title: 'Live Mullet',
    description:
    'A live mullet is highly effective when targeting larger Dusky Kob in estuaries, river mouths and surf zones where live bait can be presented naturally.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.96,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-BAIT-0002',
        reliability: 0.96,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: [
      'Summer',
      'Autumn',
    ],
    tags: [
      'kob',
      'live bait',
      'mullet',
      'estuary',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),

  KnowledgeRecord(
    id: 'NKS-KOB-BAIT-0003',
    species: 'Dusky Kob',
    category: KnowledgeCategory.bait,
    title: 'Whole Sardine',
    description:
    'A whole sardine is an effective bait for Dusky Kob in surf conditions, particularly when fish are actively hunting larger baitfish.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.93,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-KOB-BAIT-0003',
        reliability: 0.94,
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
      'surf bait',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),
];