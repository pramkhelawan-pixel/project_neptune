import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> bronzeBreamPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BRB-PRES-0001',
    species: 'Bronze Bream',
    targetSpecies: const ['Bronze Bream'],
    category: KnowledgeCategory.presentation,
    title: 'Sliding Sinker Rig Close to Structure',
    description:
    'A sliding sinker rig fished tight against reef and gully edges allows bait to sit naturally where Bronze Bream feed, while keeping the rig manageable in surge.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BRB-PRES-0001',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'bronze bream',
      'sliding sinker',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BRB-PRES-0002',
    species: 'Bronze Bream',
    targetSpecies: const ['Bronze Bream'],
    category: KnowledgeCategory.presentation,
    title: 'Running Paternoster Near Reef Edge',
    description:
    'A running paternoster rig cast just short of reef structure keeps bait in the strike zone while reducing the chance of snagging on structure during retrieval.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BRB-PRES-0002',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'bronze bream',
      'paternoster',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
