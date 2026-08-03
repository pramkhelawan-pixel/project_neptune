import '../../domain/entities/knowledge_record.dart';
import '../../domain/entities/knowledge_source.dart';

import '../../domain/enums/confidence_level.dart';
import '../../domain/enums/evidence_level.dart';
import '../../domain/enums/knowledge_category.dart';

final List<KnowledgeRecord> shadBaitKnowledge = [
  KnowledgeRecord(
    id: 'NKS-SHD-BAIT-0001',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.bait,
    title: 'Fresh Sardine',
    description:
    'Fresh sardine is regarded by experienced South African surf anglers as the primary natural bait for targeting Shad. It produces excellent results during active feeding periods and can be presented whole, as a fillet or as a butterfly bait.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.veryHigh,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-BAIT-0001',
        reliability: 0.99,
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
      'shad',
      'bait',
      'sardine',
      'natural bait',
      'beginner',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
  KnowledgeRecord(
    id: 'NKS-SHD-BAIT-0002',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.bait,
    title: 'Sardine Fillet',
    description:
    'A sardine fillet provides an aerodynamic bait presentation that casts well into surf conditions while maintaining an attractive natural profile.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-BAIT-0002',
        reliability: 0.95,
      ),
    ],
    regions: const [
      'KwaZulu-Natal',
    ],
    seasons: const [
      'Autumn',
      'Winter',
      'Spring',
    ],
    tags: const [
      'fillet',
      'sardine',
      'casting',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
  KnowledgeRecord(
    id: 'NKS-SHD-BAIT-0003',
    species: 'Shad',
    targetSpecies: const ['Shad'],
    category: KnowledgeCategory.bait,
    title: 'Whole Sardine',
    description:
    'A whole sardine creates a larger profile and is often selected when targeting bigger Shad or when baitfish are abundant.',
    evidenceLevel: EvidenceLevel.expert,
    confidenceLevel: ConfidenceLevel.high,
    sources: const [
      KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-BAIT-0003',
        reliability: 0.93,
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
      'whole sardine',
      'large bait',
      'natural bait',
    ],
    verified: true,
    createdAt: DateTime(2026, 7, 29),
    updatedAt: DateTime(2026, 7, 29),
  ),
];