import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> blackMusselcrackerExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BMC-TIP-0001',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.technique,
    title: 'Use Heavy Tackle Without Exception',
    description:
    'Black Musselcracker are exceptionally powerful for their size and will reach reef cover within seconds if given any slack. Heavy tackle and immediate pressure are essential.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BMC-TIP-0001',
        reliability: 0.95,
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
      'heavy tackle',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BMC-TIP-0002',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.technique,
    title: 'Confirm Regulations Before Targeting',
    description:
    'Given the species\' vulnerability to overfishing, confirm current size, bag and possession limits before setting out, and practise careful release where required.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Regulatory Guidance',
        reference: 'NKS-BMC-TIP-0002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'South Africa',
    ],
    seasons: const [],
    tags: const [
      'black musselcracker',
      'conservation',
      'expert tip',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
