import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> diamondRayExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKB-DMR-TIP-0001',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.technique,
    title: 'Look for Sand Disturbance',
    description:
    'A patch of disturbed, cloudy sand in shallow water can mark a buried Diamond Ray; a bait presented nearby often draws an immediate reaction.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-013',
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
      'technique',
      'observation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DMR-TIP-0002',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.technique,
    title: 'Mind the Venomous Tail Spine',
    description:
    'Despite its short tail, the Diamond Ray still carries a venomous spine near the base; approach from the front and use a de-hooking tool when unhooking.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-014',
        reliability: 0.90,
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
      'technique',
      'safety',
      'venomous spine',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-DMR-TIP-0003',
    species: 'Diamond Ray',
    targetSpecies: const ['Diamond Ray'],
    category: KnowledgeCategory.technique,
    title: 'Fish Light for a Better Fight',
    description:
    'Light estuary spinning tackle gives a far more sporting account of the Diamond Ray\'s flat, powerful pulling fight than heavy surf gear.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-DMR-015',
        reliability: 0.77,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'technique',
      'tackle',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
