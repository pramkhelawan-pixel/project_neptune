import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> blackMusselcrackerBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BMC-BAIT-0001',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.bait,
    title: 'Cracked Mussel',
    description:
    'Cracked mussel is the classic and most trusted bait for Black Musselcracker, fished hard against reef structure where fish are known to hold.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BMC-BAIT-0001',
        reliability: 0.97,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'Western Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'black musselcracker',
      'mussel',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BMC-BAIT-0002',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.bait,
    title: 'Red Bait',
    description:
    'Red bait is a strong secondary choice for Black Musselcracker, particularly effective when fished in combination with mussel on the same hook.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BMC-BAIT-0002',
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
      'black musselcracker',
      'red bait',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BMC-BAIT-0003',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.bait,
    title: 'Live Crab',
    description:
    'A live crab is a productive bait for trophy Black Musselcracker, particularly effective around deep gullies and reef ledges.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BMC-BAIT-0003',
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
      'crab',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
