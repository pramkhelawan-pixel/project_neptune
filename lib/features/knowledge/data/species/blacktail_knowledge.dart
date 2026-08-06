import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> blacktailKnowledge = [
  KnowledgeRecord(
    id: 'NKB-BLK-IDENTITY-0001',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.identity,
    title: 'Species Overview',
    description:
    'Blacktail (Diplodus capensis), also known as Dassie, is a small, cautious sparid found close to rock and reef along the South African coastline. It is a popular light-tackle target for rock and ski-boat anglers.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BLK-001',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'identity',
      'blacktail',
      'dassie',
      'sparid',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BLK-HABITAT-0001',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.habitat,
    title: 'Preferred Habitat',
    description:
    'Blacktail hold close to rocky gullies and reef edges, particularly in washing white water directly against the rocks where dislodged food is abundant.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BLK-002',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'habitat',
      'rocky gully',
      'washing water',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BLK-BEHAVIOUR-0001',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.behaviour,
    title: 'Bait-Shy Feeding Behaviour',
    description:
    'Blacktail have small mouths and feed cautiously, frequently mouthing bait before committing. This makes them notoriously difficult to hook on anything but light, sensitive tackle.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BLK-003',
        reliability: 0.91,
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
      'behaviour',
      'bait-shy',
      'light tackle',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BLK-FEEDING-0001',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.feeding,
    title: 'Feeding Behaviour',
    description:
    'Blacktail graze on mussel, redbait and small invertebrates dislodged from rock and reef by wave wash, feeding most actively where white water meets the rocks.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BLK-004',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'feeding',
      'mussel',
      'redbait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BLK-SEASON-0001',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.seasonality,
    title: 'Seasonal Activity',
    description:
    'Blacktail are most reliably targeted during the cooler winter and spring months when they move into shallow rocky gullies in greater numbers.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BLK-005',
        reliability: 0.83,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Winter',
      'Spring',
    ],
    tags: const [
      'season',
      'winter',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
