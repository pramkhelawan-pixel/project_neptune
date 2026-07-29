import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> kobSpeciesKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-SPC-0001',
    species: 'Dusky Kob',
    category: KnowledgeCategory.identity,
    title: 'Dusky Kob',
    description:
    'The Dusky Kob (Argyrosomus japonicus) is one of South Africa\'s most sought-after surf species. It inhabits surf zones, estuaries and deeper coastal waters, feeding primarily on baitfish, squid and crustaceans.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.99,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Species Intelligence',
        reference: 'NKS-KOB-SPC-0001',
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
      'dusky kob',
      'species',
      'predator',
      'surf',
    ],
    lastUpdated: DateTime(2026, 7, 30),
  ),
];