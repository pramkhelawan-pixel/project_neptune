import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> blackMusselcrackerPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BMC-PRES-0001',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.presentation,
    title: 'Heavy Rig Tight to Reef',
    description:
    'A heavy sliding sinker rig presented as close to reef structure as safely possible gives the best chance of tempting Black Musselcracker from cover.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BMC-PRES-0001',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'black musselcracker',
      'heavy rig',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BMC-PRES-0002',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.presentation,
    title: 'Drift Bait Into Deep Gullies',
    description:
    'Allowing bait to drift naturally into deep gullies with the current can draw Black Musselcracker out of cover more effectively than a static presentation.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BMC-PRES-0002',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'black musselcracker',
      'drift',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
