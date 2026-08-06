import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> bronzeWhalerExpertTipKnowledge = [
  KnowledgeRecord(
    id: 'NKB-BWS-TIP-0001',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.technique,
    title: 'Watch for Diving Birds',
    description:
    'Diving birds working a bait shoal close to shore are a strong indicator that Bronze Whalers are pushing baitfish up, and a well-placed cast nearby often produces a quick bite.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-013',
        reliability: 0.86,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'technique',
      'baitfish',
      'observation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BWS-TIP-0002',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.technique,
    title: 'Use a Heavy Drag and Locked Rod Holder',
    description:
    'Secure the rod in a sand spike or gimbal with the drag set firm; a Bronze Whaler\'s first run is fast and powerful enough to pull an unattended rod into the surf.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-014',
        reliability: 0.89,
      ),
    ],
    regions: const [
      'Western Cape',
      'Eastern Cape',
    ],
    seasons: const [
      'Summer',
      'Autumn',
    ],
    tags: const [
      'technique',
      'tackle',
      'safety',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKB-BWS-TIP-0003',
    species: 'Bronze Whaler',
    targetSpecies: const ['Bronze Whaler'],
    category: KnowledgeCategory.technique,
    title: 'Release Larger Fish in the Shallows',
    description:
    'For larger specimens, avoid dragging the shark fully onto sand; work it into knee-deep water, unhook it there and let it swim off under its own power.',
    evidenceLevel: EvidenceLevel.regulatory,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Research',
        type: 'Knowledge',
        reference: 'NKB-BWS-015',
        reliability: 0.90,
      ),
    ],
    regions: const [
      'Eastern Cape',
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'technique',
      'fish care',
      'release',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
