import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> diamondRayBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKB-DMR-BAIT-0001',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.bait,
    title: 'Live Prawn',
    description:
    'A live prawn fished on the bottom in shallow estuary water is the standard bait for Diamond Ray, mimicking its natural prey closely.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-006',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'bait',
      'prawn',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DMR-BAIT-0002',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.bait,
    title: 'Small Live Baitfish',
    description:
    'A small live baitfish such as glassie or mullet fry drifted through a known channel can trigger an ambush strike from a buried Diamond Ray.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-007',
        reliability: 0.78,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'bait',
      'baitfish',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DMR-BAIT-0003',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.bait,
    title: 'Bloodworm',
    description:
    'Bloodworm fished on a small hook works well on shallow sandbanks, particularly for smaller Diamond Rays feeding close to the bank edges.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-008',
        reliability: 0.76,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'bait',
      'bloodworm',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
