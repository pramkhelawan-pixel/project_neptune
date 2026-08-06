import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> blackMusselcrackerKnowledge = [
  KnowledgeRecord(
    id: 'NKB-BMC-IDENTITY-0001',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Black Musselcracker (Cymatoceps nasutus), known locally as Poenskop, is a large, powerful reef predator with crushing jaws adapted for mussel and crustaceans. It is one of South Africa\'s most sought-after and respected reef species.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BMC-001',
        reliability: 0.92,
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
      'identity',
      'black musselcracker',
      'poenskop',
      'reef',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BMC-HABITAT-0001',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Black Musselcracker are closely associated with reef, deep gullies and rocky structure, typically holding close to cover where they can quickly retreat when hooked.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BMC-002',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'habitat',
      'reef',
      'structure',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BMC-BEHAVIOUR-0001',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.behaviour,
    title: 'Powerful Reef Fighter',
    description:
    'Black Musselcracker are exceptionally powerful for their size and immediately drive for the nearest reef structure once hooked, demanding heavy tackle to control.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BMC-003',
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
      'behaviour',
      'fight',
      'reef',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BMC-FEEDING-0001',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Black Musselcracker possess powerful crushing jaws adapted for mussel, crab and urchin, feeding close to reef structure rather than actively hunting.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BMC-004',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'feeding',
      'mussel',
      'crab',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BMC-CONSERVATION-0001',
    species: 'Black Musselcracker',
    targetSpecies: const ['Black Musselcracker'],
    category: KnowledgeCategory.conservation,
    title: 'Conservation Status',
    description:
    'Black Musselcracker is slow-growing and long-lived, making it particularly vulnerable to overfishing. It is subject to strict conservation regulation in South Africa, and current size and bag limits should always be confirmed before targeting.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Regulatory Guidance',
        reference: 'NKB-BMC-006',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'South Africa',
    ],
    seasons: const [],
    tags: const [
      'conservation',
      'regulations',
      'poenskop',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
