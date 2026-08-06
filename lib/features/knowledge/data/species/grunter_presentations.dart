import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> grunterPresentationKnowledge = [
  KnowledgeRecord(
    id: 'NKS-GRN-PRES-0001',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.presentation,
    title: 'Static Bait in Estuary Channel',
    description:
    'A static, bottom-fished live prawn presented in an estuary channel and left undisturbed for extended periods is a highly effective approach for Grunter.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRN-PRES-0001',
        reliability: 0.93,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Summer',
    ],
    tags: const [
      'grunter',
      'static bait',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
  KnowledgeRecord(
    id: 'NKS-GRN-PRES-0002',
    species: 'Grunter',
    targetSpecies: const ['Grunter'],
    category: KnowledgeCategory.presentation,
    title: 'Light Running Sinker in Murky Surf',
    description:
    'A light running sinker rig is effective when Grunter push into surf adjacent to estuary mouths, allowing bait to sit naturally in discoloured water.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.moderate,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-GRN-PRES-0002',
        reliability: 0.85,
      ),
    ],
    regions: const [
      'Eastern Cape',
    ],
    seasons: const [
      'Autumn',
    ],
    tags: const [
      'grunter',
      'running sinker',
      'presentation',
    ],
    verified: true,
    createdAt: DateTime(2026, 8, 6),
    updatedAt: DateTime(2026, 8, 6),
  ),
];
