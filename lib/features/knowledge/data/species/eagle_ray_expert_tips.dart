import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> eagleRayExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKB-EGR-TIP-0001',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.technique,
    title: 'Expect Surface Activity',
    description:
    'Unlike bottom-hugging rays, a hooked Eagle Ray will often surface and even leap; keep the rod tip up and be ready to absorb sudden changes in direction.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-013',
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
      'technique',
      'fight',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-EGR-TIP-0002',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.technique,
    title: 'Use a De-Hooking Tool for the Venomous Spine',
    description:
    'Carry a long-handled de-hooker and avoid handling near the tail; the Eagle Ray carries a venomous spine that can cause a painful puncture wound.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-014',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
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
    id: 'NKB-EGR-TIP-0003',
    species: 'Eagle Ray',
    targetSpecies: const ['Eagle Ray'],
    category: KnowledgeCategory.technique,
    title: 'Fish the Edges of Sandbanks',
    description:
    'Eagle Rays commonly patrol the drop-off edges of sandbanks where crustaceans concentrate; targeting these transition zones improves hook-up rates.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-EGR-015',
        reliability: 0.78,
      ),
    ],
    regions: const [
      'Western Cape',
    ],
    seasons: const [
      'Spring',
    ],
    tags: const [
      'technique',
      'sandbank',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
