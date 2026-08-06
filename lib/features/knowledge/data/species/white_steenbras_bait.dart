import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> whiteSteenbrasBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-WST-BAIT-0001',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.bait,
    title: 'Live Sand Prawn',
    description:
    'Live sand prawn is regarded as the standout bait for White Steenbras, presented in surf gutters where fish are actively probing for prey.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-WST-BAIT-0001',
        reliability: 0.97,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'Western Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'white steenbras',
      'sand prawn',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-WST-BAIT-0002',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.bait,
    title: 'Bloodworm',
    description:
    'Bloodworm is an effective bait for White Steenbras, particularly when fished in combination with sand prawn on a cocktail hook.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-WST-BAIT-0002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'white steenbras',
      'bloodworm',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-WST-BAIT-0003',
    species: 'White Steenbras',
    targetSpecies: const ['White Steenbras'],
    category: KnowledgeCategory.bait,
    title: 'Beach Worm',
    description:
    'Beach worm is a productive alternative bait for White Steenbras when sand prawn is unavailable, particularly in clean surf gutters.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-WST-BAIT-0003',
        reliability: 0.84,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'white steenbras',
      'beach worm',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
