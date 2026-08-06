import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> blacktailBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BLK-BAIT-0001',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.bait,
    title: 'Red Bait',
    description:
    'Red bait is widely regarded as the most effective natural bait for Blacktail, presented in small pieces on light tackle close to the rocks.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BLK-BAIT-0001',
        reliability: 0.96,
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
      'blacktail',
      'red bait',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BLK-BAIT-0002',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.bait,
    title: 'Black Mussel',
    description:
    'Black mussel, presented as a small, neat piece, is a highly effective and widely used bait for Blacktail around rocky gullies.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BLK-BAIT-0002',
        reliability: 0.92,
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
      'blacktail',
      'mussel',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BLK-BAIT-0003',
    species: 'Blacktail',
    targetSpecies: const ['Blacktail'],
    category: KnowledgeCategory.bait,
    title: 'Sea Lice',
    description:
    'Sea lice (isopods) are a productive light-tackle bait for Blacktail, particularly effective when fish are feeding cautiously in clear conditions.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BLK-BAIT-0003',
        reliability: 0.84,
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
      'blacktail',
      'sea lice',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
