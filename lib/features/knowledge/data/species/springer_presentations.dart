import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> springerPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SPR-PRES-0001',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.presentation,
    title: 'Free-Swimming Live Prawn Near Surface',
    description:
    'A live prawn free-lined or fished under a light float near the surface presents naturally to Springer feeding on baitfish and prawns close to estuary mouths.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SPR-PRES-0001',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'springer',
      'live prawn',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-SPR-PRES-0002',
    species: 'Springer',
    targetSpecies: const ['Springer'],
    category: KnowledgeCategory.presentation,
    title: 'Fast-Retrieved Small Spoon',
    description:
    'A small silver spoon retrieved quickly near the surface can trigger aggressive strikes from Springer actively hunting baitfish.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SPR-PRES-0002',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'springer',
      'spoon',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
