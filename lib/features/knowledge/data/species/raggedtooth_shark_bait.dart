import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> raggedtoothSharkBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKB-RTS-BAIT-0001',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.bait,
    title: 'Fresh Mullet',
    description:
    'A fresh, whole mullet is the standard bait for Ragged-tooth Shark, presented on heavy tackle in known reef aggregation areas.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-007',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
    ],
    tags: const [
      'bait',
      'mullet',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-RTS-BAIT-0002',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.bait,
    title: 'Mackerel Cutlet',
    description:
    'An oily mackerel cutlet fished hard on the bottom near reef structure produces a strong scent trail effective in attracting Raggies from a distance.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-008',
        reliability: 0.85,
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
      'bait',
      'mackerel',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-RTS-BAIT-0003',
    species: 'Ragged-tooth Shark',
    targetSpecies: const ['Ragged-tooth Shark'],
    category: KnowledgeCategory.bait,
    title: 'Fish Head',
    description:
    'A large fish head, such as geelbek or kob, provides bulk and scent for extended soak times when fishing dedicated shark marks from a ski-boat or shore reef point.',
    evidenceLevel: EvidenceLevel.community,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-RTS-009',
        reliability: 0.80,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'bait',
      'fish head',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
