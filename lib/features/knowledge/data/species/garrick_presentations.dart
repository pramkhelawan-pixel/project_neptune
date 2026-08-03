import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> garrickPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRK-PRES-0001',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.presentation,
    title: 'Free Swimming Live Mullet',
    description:
    'A free-swimming live mullet presented naturally is one of the most effective presentations for Garrick. Allowing the bait to swim freely creates a natural presentation that attracts actively hunting fish.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-PRES-0001',
        reliability: 0.98,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'garrick',
      'presentation',
      'live mullet',
      'free swimming',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-PRES-0002',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.presentation,
    title: 'Drifted Live Bait',
    description:
    'Presenting a live bait in the current allows it to move naturally with the water, making it attractive to Garrick patrolling current lines and estuary mouths.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-PRES-0002',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: const [
      'garrick',
      'presentation',
      'current',
      'live bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-PRES-0003',
    species: 'Garrick',
    targetSpecies: const ['Garrick'],
    category: KnowledgeCategory.presentation,
    title: 'Slow-Retrieved Soft Plastic',
    description:
    'A slow, steady retrieve with a paddle-tail soft plastic can imitate an injured baitfish and trigger strikes from Garrick in clean water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-PRES-0003',
        reliability: 0.91,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Spring',
      'Summer',
    ],
    tags: const [
      'garrick',
      'soft plastic',
      'retrieve',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 2),
    updatedAt: DateTime(2026, 8, 2),
  ),
];