import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> bronzeBreamBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-BRB-BAIT-0001',
    species: 'Bronze Bream',
    targetSpecies: const ['Bronze Bream'],
    category: KnowledgeCategory.bait,
    title: 'Black Mussel',
    description:
    'Black mussel is regarded as the standout bait for Bronze Bream, presented cracked or shelled and fished hard against reef and gully structure.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BRB-BAIT-0001',
        reliability: 0.97,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'bronze bream',
      'mussel',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BRB-BAIT-0002',
    species: 'Bronze Bream',
    targetSpecies: const ['Bronze Bream'],
    category: KnowledgeCategory.bait,
    title: 'Red Bait',
    description:
    'Red bait (ascidian) is a highly effective natural bait for Bronze Bream, particularly when fished close to reef edges and gully mouths.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BRB-BAIT-0002',
        reliability: 0.92,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
      'Winter',
    ],
    tags: const [
      'bronze bream',
      'red bait',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-BRB-BAIT-0003',
    species: 'Bronze Bream',
    targetSpecies: const ['Bronze Bream'],
    category: KnowledgeCategory.bait,
    title: 'Sea Cockroach',
    description:
    'Sea cockroach is a productive alternative bait for Bronze Bream, especially effective when fish are feeding cautiously in clearer water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-BRB-BAIT-0003',
        reliability: 0.85,
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
      'bronze bream',
      'sea cockroach',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
