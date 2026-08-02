import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> garrickPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRK-PRES-0001',
    species: 'Garrick',
    category: KnowledgeCategory.presentation,
    title: 'Free Swimming Live Mullet',
    description:
    'A free-swimming live mullet presented naturally is one of the most effective presentations for Garrick. Allowing the bait to swim freely creates a natural presentation that attracts actively hunting fish.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.98,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-PRES-0001',
        reliability: 0.98,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'garrick',
      'presentation',
      'live mullet',
      'free swimming',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-PRES-0002',
    species: 'Garrick',
    category: KnowledgeCategory.presentation,
    title: 'Drifted Live Bait',
    description:
    'Presenting a live bait in the current allows it to move naturally with the water, making it attractive to Garrick patrolling current lines and estuary mouths.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.95,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-PRES-0002',
        reliability: 0.95,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: [
      'Spring',
      'Summer',
      'Autumn',
    ],
    tags: [
      'garrick',
      'presentation',
      'current',
      'live bait',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),
  KnowledgeRecord(
    id: 'NKS-GRK-PRES-0003',
    species: 'Garrick',
    category: KnowledgeCategory.presentation,
    title: 'Slow-Retrieved Soft Plastic',
    description:
    'A slow, steady retrieve with a paddle-tail soft plastic can imitate an injured baitfish and trigger strikes from Garrick in clean water.',
    evidenceLevel: EvidenceLevel.experiencedAngler,
    confidence: 0.91,
    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRK-PRES-0003',
        reliability: 0.91,
      ),
    ],
    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: [
      'Spring',
      'Summer',
    ],
    tags: [
      'garrick',
      'soft plastic',
      'retrieve',
      'presentation',
    ],
    lastUpdated: DateTime(2026, 8, 2),
  ),
];