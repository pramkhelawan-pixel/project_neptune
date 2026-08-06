import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> blacktailPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BLK-PRES-0001',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.presentation,
    title: 'Light Running Sinker Close to Rocks',
    description:
    'A light running sinker rig fished tight against washing water at the base of rocks presents bait naturally where Blacktail feed most confidently.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BLK-PRES-0001',
        reliability: 0.93,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'blacktail',
      'running sinker',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BLK-PRES-0002',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.presentation,
    title: 'No-Weight Free-Line Presentation',
    description:
    'In calmer gullies, a free-lined bait with minimal or no added weight allows the most natural drift and is often more effective on cautious Blacktail.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BLK-PRES-0002',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'blacktail',
      'free-line',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
