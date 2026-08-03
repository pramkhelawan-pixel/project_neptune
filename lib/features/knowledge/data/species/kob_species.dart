import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> kobSpeciesKnowledge = [
  KnowledgeRecord(
    id: 'NKS-KOB-SPC-0001',
    species: 'Dusky Kob',
    targetSpecies: const ['Dusky Kob'],
    category: KnowledgeCategory.identity,
    title: 'Dusky Kob',
    description:
    'The Dusky Kob (Argyrosomus japonicus) is one of South Africa\'s most sought-after surf species. It inhabits surf zones, estuaries and deeper coastal waters, feeding primarily on baitfish, squid and crustaceans.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Species Intelligence',
        reference: 'NKS-KOB-SPC-0001',
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
      'dusky kob',
      'species',
      'predator',
      'surf',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 30),
    updatedAt: DateTime(2026, 7, 30),
  ),
];