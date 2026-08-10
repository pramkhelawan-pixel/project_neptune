-- Seed data transcribed from the SA coastal fishing spots research report
-- (2026-08-10). Coordinates are approximate (~1km) per the report's own
-- caveats - the following pins are explicitly flagged there as
-- town-centre/derived estimates needing map verification before launch:
-- Cape Vidal, Mapelane, Blythedale, Salt Rock, The Bluff, Amanzimtoti,
-- Hibberdene, Southbroom, Kleinemonde, Storms River, Wilderness, Gansbaai,
-- Hermanus, Strand, Strandfontein, Langebaan, Paternoster.
--
-- Nationwide regulatory constants (shad/galjoen closed seasons, red
-- steenbras no-take) are NOT columns here - they're not per-spot facts and
-- live in RegulatoryRules instead. is_mpa/mpa_name/is_no_take below only
-- capture genuinely per-spot facts (which park/reserve a spot sits in,
-- and whether the whole spot is closed to fishing, as with Sardinia Bay).
--
-- Spot-checked by the user against the source report (2026-08-10):
-- Ballito, Umkomaas, Margate Pier, Port St Johns - confirmed matching.
--
-- Known gap, deliberately deferred: "Boulders" (Cape Peninsula, near
-- Miller's Point/Simon's Town) is a real spot not covered by the source
-- report and is not included here. Track as a follow-up addition, sourced
-- directly (coordinates/species/access notes/regulatory flags) rather than
-- fabricated, before adding.

insert into public.fishing_spots
  (province, region, name, latitude, longitude, spot_type, access_notes, target_species, is_mpa, mpa_name, is_no_take, safety_flags)
values

-- ===== KWAZULU-NATAL =====

-- iSimangaliso / Far North (Zululand)
('KwaZulu-Natal', 'iSimangaliso / Far North (Zululand)', 'Kosi Bay Mouth', -26.9600, 32.8100, 'Estuary mouth / interconnected lake system', 'Within iSimangaliso Wetland Park; 4x4 typically required; park entry and permits apply; guided access common', ARRAY['Giant Kingfish','Rock Salmon','Springer','Stumpnose'], true, 'iSimangaliso Wetland Park', false, ARRAY['4x4-required','remote-access']),
('KwaZulu-Natal', 'iSimangaliso / Far North (Zululand)', 'Sodwana Bay', -27.5400, 32.6800, 'Surf/beach with rocky gutters; ski-boat launch', 'Within iSimangaliso/Sodwana Bay National Park; entry fee, permits, size/bag limits enforced; Red Sands sanctuary zone (south of bay) is no-take', ARRAY['Pompano','Kingfish','Marlin','Sailfish','King Mackerel','Tuna','Dorado'], true, 'iSimangaliso / Sodwana Bay National Park', false, ARRAY[]::text[]),
('KwaZulu-Natal', 'iSimangaliso / Far North (Zululand)', 'Cape Vidal', -28.1300, 32.5600, 'Sheltered bay, surf, rock pools', 'Inside iSimangaliso; park gate/permit; Leven Point sanctuary (north) is no-take', ARRAY['Wave Garrick','Shad','Bronze Bream','Small Sharks'], true, 'iSimangaliso / St Lucia Marine Reserve', false, ARRAY[]::text[]),
('KwaZulu-Natal', 'iSimangaliso / Far North (Zululand)', 'St Lucia estuary mouth', -28.3800, 32.4200, 'Estuary mouth / lagoon', 'Park permits required; Mission Rocks reached via Cape Vidal road; mouth position shifts with tides/rainfall', ARRAY['Kob','Garrick','Natal Stumpnose','Skates','Rays','Sandsharks'], true, 'iSimangaliso Wetland Park', false, ARRAY[]::text[]),
('KwaZulu-Natal', 'iSimangaliso / Far North (Zululand)', 'Mapelane', -28.4000, 32.4200, 'Surf/beach, high dunes', '4x4 recommended; iSimangaliso reserve, permits; southern limit of the protected coastline', ARRAY['Kob','Stumpnose','Sharks','Flatfish'], true, 'iSimangaliso Wetland Park', false, ARRAY['4x4-required','remote-access']),
('KwaZulu-Natal', 'iSimangaliso / Far North (Zululand)', 'Richards Bay', -28.7700, 32.0600, 'Harbour walls, breakwaters, surf, nearby reefs', 'Some areas require a Transnet bay permit for boats; harbour walls generally accessible; busy port, observe port/security rules', ARRAY['King Mackerel','Tuna','Queenfish','Kob','Grunter'], false, null, false, ARRAY[]::text[]),

-- North Coast (Dolphin Coast)
('KwaZulu-Natal', 'North Coast (Dolphin Coast)', 'Zinkwazi Beach', -29.2900, 31.4400, 'Surf/beach and lagoon/estuary', 'Public', ARRAY['Shad','Kob','Stumpnose','Garrick','Sandsharks','Skates'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'North Coast (Dolphin Coast)', 'Blythedale Beach', -29.4000, 31.2400, 'Surf/beach', 'Public; gentle family beach', ARRAY['Shad','Kob','Stumpnose','Flatfish'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'North Coast (Dolphin Coast)', 'Salt Rock / Shaka''s Rock', -29.4900, 31.2400, 'Rock/ledge, tidal pools, sandy bays', 'Public; parking security is a reported concern on quiet days', ARRAY['Shad','Blacktail','Strepie','Kob','Natal Stumpnose','Garrick','Kingfish'], false, null, false, ARRAY['crime-advisory']),
('KwaZulu-Natal', 'North Coast (Dolphin Coast)', 'Ballito (Willard Beach / Thompson''s Bay)', -29.5300, 31.2200, 'Beach and rocky bays', 'Public; permits from Post Office', ARRAY['Shad','Blacktail','Stumpnose','Kob'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'North Coast (Dolphin Coast)', 'Umdloti', -29.6700, 31.1200, 'Rock/ledge, steep beaches, river mouth', 'Public but locally restricted - North Beach fishing only 05:00-08:00 and 16:00-19:00; parts of coast protected (no-take) for snorkelling', ARRAY['Shad','Natal Stumpnose','Kob','Dusky Shark','Blacktail','Banded Galjoen','Strepie','Rockcod'], true, 'uMdloti protected snorkelling zone', false, ARRAY['time-restricted-access']),
('KwaZulu-Natal', 'North Coast (Dolphin Coast)', 'Umhlanga Rocks', -29.7300, 31.0700, 'Beach, rocks, tidal pool (Granny''s Pool), lagoon', 'Public; uMhlanga UIP requests catch-for-food-only and a permit', ARRAY['Blacktail','Strepie','Shad','Kob','Natal Stumpnose'], false, null, false, ARRAY[]::text[]),

-- Durban Metro
('KwaZulu-Natal', 'Durban Metro', 'Vetch''s Pier / Golden Mile', -29.8600, 31.0400, 'Man-made pier/artificial reef, surf beach, sheltered launch', 'Public; daylight recommended; designated launch/bathing zones demarcated; multi-use zone with divers/ski-boats/seine netters; other city piers now closed to anglers', ARRAY['Shad','Garrick','Kob','Kingfish','Rockcod','Couta'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'Durban Metro', 'The Bluff', -29.9200, 31.0300, 'Surf beaches, rocky sections', 'Public; check local safety advice', ARRAY['Shad','Garrick','Kob','Rockcod','Kingfish'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'Durban Metro', 'Isipingo / Amanzimtoti (Nyoni Rocks)', -30.0500, 30.8800, 'Surf/beach and rocky points', 'Public', ARRAY['Shad','Kob','Pompano','Stumpnose','Sharks','Skates'], false, null, false, ARRAY[]::text[]),

-- South Coast (Scottburgh to Port Edward)
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Umkomaas', -30.2000, 30.8000, 'Estuary mouth, beach, rocky coast; major Aliwal Shoal launch', 'Public shore; experienced skippers for launch; Aliwal Shoal MPA lies offshore - check zone rules', ARRAY['Kob','Shad','Queenfish','Snoek'], true, 'Aliwal Shoal MPA (offshore)', false, ARRAY[]::text[]),
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Scottburgh (Point)', -30.2800, 30.7500, 'Rock point and surf beach', 'Public, all levels; famous shark-from-beach history; permits/limits apply', ARRAY['Sharks','Shad','Garrick','Kob'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Park Rynie / Rocky Bay', -30.3200, 30.7300, 'Beach, rocky bay, ski-boat club launch', 'Public; Rocky Bay resort has campsites/shop; family-friendly', ARRAY['Shad','Garrick','Kob','Stumpnose','King Mackerel','Dorado','Tuna'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Pennington / Umdoni Point', -30.3800, 30.7000, 'Rocky points', 'For experienced anglers; deeper-water points', ARRAY['Queen Mackerel','Kingfish','Sharks'], false, null, false, ARRAY['experienced-anglers-only']),
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Hibberdene', -30.5800, 30.5800, 'Beach, lagoon, rocky sections; ski-boat club', 'Public; Hibberdene Ski Boat Club launch', ARRAY['Shad','Kob','Garrick','Pompano','Sharks'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Port Shepstone (Sandspit Beach)', -30.7500, 30.4500, 'Beach and river mouth', 'Public, all levels', ARRAY['Kob','Shad','Garrick'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Shelly Beach', -30.8000, 30.4100, 'Beach, rocky reef, major Protea Banks launch', 'Public; Shelly Beach Ski Boat Club; Protea Banks MPA - check rules; winter sardine run drives big predator action', ARRAY['Shad','Snoek','Yellowfin Tuna','Garrick','Musselcracker','Cape Salmon','Kob','Rockcod','Geelbek','Billfish'], true, 'Protea Banks MPA', false, ARRAY[]::text[]),
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Uvongo (Pier)', -30.8200, 30.3800, 'Fishing pier, beach, lagoon', 'Public pier, all levels', ARRAY['Shad','Garrick','Kob'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Margate (Pier)', -30.8500, 30.3700, 'Fishing pier and beach', 'Public; arrive early for pier space; one of the coast''s most popular piers', ARRAY['Shad','Kob','Garrick'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Southbroom / Orange Rocks (St Michael''s)', -30.9300, 30.3300, 'Rocky points and beaches', 'Public', ARRAY['Sharks','Gamefish','Shad','Kob'], false, null, false, ARRAY[]::text[]),
('KwaZulu-Natal', 'South Coast (Scottburgh to Port Edward)', 'Port Edward (Splash Rock / Ladder Rock at Glenmore)', -31.0500, 30.2200, 'Rock ledges, beach', 'For experienced anglers; some spots require rock scrambling; Marlin Ski Boat Club nearby', ARRAY['Sharks','Gamefish','Shad','Kob','Garrick'], false, null, false, ARRAY['hazardous-rocks','experienced-anglers-only']),

-- ===== EASTERN CAPE =====

-- Wild Coast (KZN border to Kei Mouth)
('Eastern Cape', 'Wild Coast (KZN border to Kei Mouth)', 'Port St Johns (Mzimvubu mouth) / Brazen Head', -31.6300, 29.5400, 'Estuary mouth, rocky headlands', 'Brazen Head (~20km south) requires 4x4 and a long walk down; remote, strong safety caution on ledges', ARRAY['Blacktail','Garrick','Kob','Bronze Whaler','Sharks'], false, null, false, ARRAY['4x4-required','remote-access','hazardous-rocks']),
('Eastern Cape', 'Wild Coast (KZN border to Kei Mouth)', 'Coffee Bay / Hole in the Wall', -31.9900, 29.1500, 'Rock-and-surf gullies and points, reef', 'Generally driveable to Coffee Bay; remote; local knowledge advised', ARRAY['Kob','White Musselcracker','Shad','Garrick','Reef Fish'], false, null, false, ARRAY['remote-access']),
('Eastern Cape', 'Wild Coast (KZN border to Kei Mouth)', 'Mazeppa Bay', -32.4800, 28.6500, 'Rocky bay with an island (suspension bridge), surf', 'Remote village, some gravel roads; permits/licences hard to obtain locally - buy in advance', ARRAY['White Steenbras','Kob','Shad','Yellowtail Amberjack','Sharks','Garrick'], false, null, false, ARRAY['remote-access']),
('Eastern Cape', 'Wild Coast (KZN border to Kei Mouth)', 'Kei Mouth', -32.6800, 28.3800, 'Estuary mouth, small sandy beaches, cliffs; pontoon ferry', 'R349 from the N2; licences/bait often scarce locally', ARRAY['Shad','Garrick','Kob','Blacktail','Bronze Bream'], false, null, false, ARRAY[]::text[]),
('Eastern Cape', 'Wild Coast (KZN border to Kei Mouth)', 'Morgan Bay', -32.7000, 28.3400, 'Sandy beach, lagoon, dolerite cliffs', '7km off the R349; Great Kei launch nearby; fishing licences reported scarce locally', ARRAY['Kob','Shad','Garrick','Blacktail','Bronze Bream','Sharks','Rays'], false, null, false, ARRAY[]::text[]),

-- East London Coast (Cintsa to Kidd's Beach)
('Eastern Cape', 'East London Coast (Cintsa to Kidd''s Beach)', 'Gonubie', -32.9400, 27.9800, 'River mouth, reef, main beach, tidal pool, point, gullies', 'Public; boat launch at nearby Yellow Sands; blue-flag beach', ARRAY['Shad','Kob','Garrick'], false, null, false, ARRAY[]::text[]),
('Eastern Cape', 'East London Coast (Cintsa to Kidd''s Beach)', 'Nahoon', -32.9800, 27.9500, 'Point, reef, estuary', 'Public; Nahoon Reef also a noted surf/dive site', ARRAY['Kob','Grunter','Shad','Bronze Bream'], false, null, false, ARRAY[]::text[]),
('Eastern Cape', 'East London Coast (Cintsa to Kidd''s Beach)', 'Kidd''s Beach', -33.1500, 27.7000, 'Beach and rocky sections', 'Public; quiet holiday village', ARRAY['Kob','Shad','Bronze Bream','Blacktail'], false, null, false, ARRAY[]::text[]),

-- Sunshine Coast (Fish River to Kenton)
('Eastern Cape', 'Sunshine Coast (Fish River to Kenton)', 'Kleinemonde / Three Sisters', -33.5400, 27.0500, 'Rock point (Three Sisters), estuaries', 'Long walk over dune field to Three Sisters; Clayton''s Beach rocks difficult to access - good footwear needed; a "hit and miss" venue', ARRAY['Kob','Blacktail','White Steenbras','Klipfish','Rockcod','Zebra','Bronze Bream','Shyshark'], false, null, false, ARRAY['remote-access']),
('Eastern Cape', 'Sunshine Coast (Fish River to Kenton)', 'Port Alfred (Kowie River mouth & piers) / Sharks Bay', -33.6000, 26.9000, 'Estuary/river, west pier, surf beaches, rocky points', 'Public; raggedtooth sharks run up the Kowie Oct-Mar - caution with live bait', ARRAY['Grunter','Steenbras','Kob','Stumpnose','Rockcod','Strepie','Geelbek','Roman','Dageraad','Santer','Carpenter'], false, null, false, ARRAY[]::text[]),
('Eastern Cape', 'Sunshine Coast (Fish River to Kenton)', 'Kenton-on-Sea (Kariega & Bushmans River mouths)', -33.6800, 26.6600, 'Twin estuary mouths, sandbanks, surf', 'Public; wading and small-boat drifting productive; watch for electric rays when wading the flats', ARRAY['Grunter','Garrick','Kob','Raggedtooth Shark'], false, null, false, ARRAY[]::text[]),

-- Algoa Bay (Gqeberha / Port Elizabeth)
('Eastern Cape', 'Algoa Bay (Gqeberha / Port Elizabeth)', 'Sundays River mouth (Colchester)', -33.7200, 25.8500, 'Estuary mouth, surf', 'Public; upriver drifting/trolling productive', ARRAY['Spotted Grunter','Kob','Garrick','Shad','Steenbras'], false, null, false, ARRAY[]::text[]),
('Eastern Cape', 'Algoa Bay (Gqeberha / Port Elizabeth)', 'Cape Recife', -34.0300, 25.7000, 'Rocky point, reefs, harbour wall/dolosse nearby', 'Public shore; reserve areas nearby; adjacent Sardinia Bay is a Marine Reserve - no fishing there', ARRAY['Shad','Garrick','Roman','Black Musselcracker','Kob'], false, null, false, ARRAY[]::text[]),
('Eastern Cape', 'Algoa Bay (Gqeberha / Port Elizabeth)', 'Sardinia Bay', -34.0500, 25.5500, 'Beach/rocky coast within a Marine Reserve', 'NO fishing - declared a Marine Reserve; snorkelling/diving only', ARRAY[]::text[], true, 'Sardinia Bay Marine Reserve', true, ARRAY[]::text[]),

-- Kouga / St Francis (Jeffreys Bay area)
('Eastern Cape', 'Kouga / St Francis (Jeffreys Bay area)', 'Jeffreys Bay', -34.0300, 24.9200, 'Long surf beaches, rocky reef sections, river mouths', 'Public; guided rock-and-surf common; world-famous surf town', ARRAY['Kob','Garrick','White Steenbras','Grunter','Blacktail','Musselcracker','Baardman','Poenskop'], false, null, false, ARRAY[]::text[]),
('Eastern Cape', 'Kouga / St Francis (Jeffreys Bay area)', 'Cape St Francis / St Francis Bay (Kromme mouth)', -34.2000, 24.8400, 'Rocky points, main beach, estuary', 'Public shore; Port St Francis (private) for launches; strong shark-fishing reputation', ARRAY['Kob','Grunter','Garrick','Cape Salmon','Musselcracker','Roman','Yellowtail'], false, null, false, ARRAY[]::text[]),

-- ===== WESTERN CAPE =====

-- Garden Route (Storms River to Mossel Bay)
('Western Cape', 'Garden Route (Storms River to Mossel Bay)', 'Storms River Mouth / Tsitsikamma', -34.0200, 23.9000, 'Rugged rock ledges meeting deep water, river mouth', 'Within Tsitsikamma section of Garden Route NP - large no-take MPA; shore angling only where permitted - check park rules', ARRAY['Yellowtail','Blacktail','Galjoen','Shad','Garrick'], true, 'Tsitsikamma MPA (Garden Route National Park)', false, ARRAY['hazardous-rocks']),
('Western Cape', 'Garden Route (Storms River to Mossel Bay)', 'Nature''s Valley', -33.9800, 23.5600, 'Beach, lagoon', 'Public; part of Garden Route NP; check MPA boundaries', ARRAY['Shad','Kob','Galjoen','Blacktail'], true, 'Garden Route National Park', false, ARRAY[]::text[]),
('Western Cape', 'Garden Route (Storms River to Mossel Bay)', 'Plettenberg Bay', -34.0500, 23.3700, 'Beaches, rocky Robberg peninsula, Keurbooms estuary', 'Public; Robberg Nature Reserve has restrictions', ARRAY['Kob','Garrick','Shad','Galjoen','Blacktail','Grunter'], true, 'Robberg MPA', false, ARRAY[]::text[]),
('Western Cape', 'Garden Route (Storms River to Mossel Bay)', 'Knysna Heads / Estuary', -34.0800, 23.0700, 'Estuary mouth (hazardous Heads), lagoon', 'Public shore; the Heads are dangerous; zoned no-take areas within the estuary; strong currents', ARRAY['Garrick','Kob','White Steenbras','Grunter'], false, null, false, ARRAY['hazardous-rocks']),
('Western Cape', 'Garden Route (Storms River to Mossel Bay)', 'Sedgefield / Wilderness', -34.0200, 22.8000, 'Beaches, lagoons/estuaries (Swartvlei, Touw)', 'Public; estuary zonation may apply', ARRAY['Kob','Shad','Galjoen','Grunter','Garrick'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'Garden Route (Storms River to Mossel Bay)', 'Mossel Bay', -34.1800, 22.1300, 'Rocky points, sheltered bays, beaches', 'Public; caution near the St Blaize/Tunnel Caves blowhole - dangerous, fatalities recorded', ARRAY['Snoek','Yellowtail','Kob','Shad','Galjoen'], false, null, false, ARRAY['hazardous-rocks']),

-- Overberg / Agulhas
('Western Cape', 'Overberg / Agulhas', 'Witsand (Breede River mouth)', -34.4000, 20.8400, 'Estuary mouth, sandy beaches', 'Public; boating popular; renowned kob estuary - size/bag limits critical', ARRAY['Kob','Grunter','Garrick','Steenbras'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'Overberg / Agulhas', 'Arniston / Waenhuiskrans', -34.6700, 20.2300, 'Rocky coast, surf, historic line-fishing village', 'Public; within one of the world''s richest marine zones; galjoen closed season applies', ARRAY['Yellowtail','Kob','Shad','White Musselcracker','Galjoen','Belman'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'Overberg / Agulhas', 'Struisbaai', -34.8000, 20.0600, 'Harbour wall, long surf beach (Plaat), Skulpiesbaai', 'Public; harbour wall best at high tide/night', ARRAY['Kob','Kolstert','Spotted Grunter','Galjoen','White Musselcracker','Belman','Shad','Steenbras','Blacktail','Sharks'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'Overberg / Agulhas', 'Cape Agulhas / L''Agulhas Point & Suiderstrand', -34.8200, 20.0200, 'Rocky point, ledges, reefs', 'Public; Agulhas National Park nearby; galjoen closed 15 Oct - last day Feb; red bait is a key bait here', ARRAY['Galjoen','Kob','Shad','Steenbras'], true, 'Agulhas National Park', false, ARRAY[]::text[]),
('Western Cape', 'Overberg / Agulhas', 'Die Dam', -34.7600, 19.6900, 'Rocky coast, gullies', 'Private/paid coastal resort access; renowned musselcracker venue', ARRAY['White Musselcracker','Kob','Elf','Steenbras','Belman','Galjoen'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'Overberg / Agulhas', 'Gansbaai', -34.5800, 19.3500, 'Kelp-line rocks, ledges, reefs; boat launches', 'Public; fishes well through winter fronts', ARRAY['Galjoen','Musselcracker','Hottentot','Yellowtail','Roman'], false, null, false, ARRAY[]::text[]),

-- False Bay & Cape Peninsula
('Western Cape', 'False Bay & Cape Peninsula', 'Hermanus', -34.4200, 19.2300, 'Rocky coast, cliffs, New Harbour', 'Public; whale-watching town; observe seasonal closures', ARRAY['Galjoen','Hottentot','Kob','Elf','Yellowtail'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'False Bay & Cape Peninsula', 'Gordon''s Bay', -34.1500, 18.8700, 'Harbour, rocky coast, protected bay', 'Public; shore and boat; sheltered False Bay waters', ARRAY['Yellowtail','Tuna','Snoek','Galjoen','Elf','Kob','Hottentot'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'False Bay & Cape Peninsula', 'Strand', -34.1100, 18.8200, 'Long surf beach', 'Public; reported safer than Macassar/Monwabisi/Strandfontein by local guides; family-friendly urban beach', ARRAY['Kob','Elf','Galjoen','Steenbras'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'False Bay & Cape Peninsula', 'Strandfontein (False Bay)', -34.0900, 18.5600, 'Surf beach and rocky sections', 'Public but with safety concerns; go with others', ARRAY['Galjoen','Steenbras','Kob'], false, null, false, ARRAY['crime-advisory']),
('Western Cape', 'False Bay & Cape Peninsula', 'Muizenberg', -34.1100, 18.4700, 'Long sandy surf beach (Surfers'' Corner)', 'Public; iconic surf beach, busy', ARRAY['Kob','Elf','White Steenbras','Galjoen'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'False Bay & Cape Peninsula', 'Kalk Bay (Harbour Wall)', -34.1300, 18.4500, 'Working harbour wall, rocky coast', 'Public harbour wall; historic fishing village; seals present', ARRAY['Stumpnose','Kob','Harders'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'False Bay & Cape Peninsula', 'Fish Hoek / Clovelly', -34.1400, 18.4300, 'Surf beach, rocky corners', 'Public; parts of Fish Hoek are within an MPA - not open to fishing; check signage', ARRAY['Galjoen','Steenbras','Kob','Sharks'], true, 'Table Mountain National Park MPA', false, ARRAY[]::text[]),
('Western Cape', 'False Bay & Cape Peninsula', 'Miller''s Point', -34.2300, 18.4700, 'Rocky boulder coves, kelp forests; boat launch', 'Public; sheltered from westerlies; within Table Mountain NP MPA zones - check', ARRAY['Hottentot','Red Roman','Snoek','Bonito','Yellowtail'], true, 'Table Mountain National Park MPA', false, ARRAY[]::text[]),
('Western Cape', 'False Bay & Cape Peninsula', 'Cape Point / Rooikrans (Cape of Good Hope)', -34.3400, 18.4800, 'High rock ledges/cliffs', 'Inside Table Mountain NP (Cape of Good Hope section) - entry fee, gate hours; extreme caution - anglers have been washed off', ARRAY['Blacktail','Hottentot','Kob','Galjoen','Snoek','Yellowtail'], true, 'Table Mountain National Park MPA', false, ARRAY['hazardous-rocks']),
('Western Cape', 'False Bay & Cape Peninsula', 'Kommetjie', -34.1400, 18.3300, 'Rocky bay/points, kelp', 'Public; winter snoek run', ARRAY['White Steenbras','Stumpnose','Galjoen','Snoek','Tuna','Albacore'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'False Bay & Cape Peninsula', 'Hout Bay', -34.0300, 18.3500, 'Harbour, rocky coast; major boat-launch for snoek/tuna', 'Public; harbour launches; rich tuna grounds offshore', ARRAY['Snoek','Yellowtail','Tuna','Kob','Elf','Galjoen'], false, null, false, ARRAY[]::text[]),

-- West Coast (Atlantic)
('Western Cape', 'West Coast (Atlantic)', 'Bloubergstrand', -33.8000, 18.4600, 'Open surf beaches, rocky points', 'Public; wind-exposed; iconic Table Mountain view', ARRAY['Kob','Elf','Galjoen'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'West Coast (Atlantic)', 'Yzerfontein', -33.7300, 18.1600, 'Rocky headland with deep gullies/points, long beaches, small harbour', 'Public; a productive rocky headland', ARRAY['Galjoen','Hottentot','Snoek','Kob','Stumpnose'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'West Coast (Atlantic)', 'Langebaan Lagoon', -33.0900, 18.0300, 'Sheltered lagoon/estuary, sand flats', 'Within West Coast National Park - zoned; light-tackle/fly popular; some no-take zones - check', ARRAY['Elf','Kob','Garrick','White Steenbras'], true, 'West Coast National Park', false, ARRAY[]::text[]),
('Western Cape', 'West Coast (Atlantic)', 'Saldanha Bay', -33.0300, 18.0100, 'Largest natural bay in SA; rocky outcrops, protected beaches, harbour walls', 'Public shore and small boats within the bay; industrial harbour zones - observe restrictions', ARRAY['Kob','White Stumpnose','Galjoen','Hottentot','Shad','Garrick'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'West Coast (Atlantic)', 'Paternoster / Cape Columbine', -32.8100, 17.8900, 'Rocky bays, points, beaches; oldest West Coast fishing village', 'Public; Columbine Nature Reserve (Tietiesbaai) nearby', ARRAY['Galjoen','Hottentot','Snoek','Kob','White Steenbras'], true, 'Columbine Nature Reserve (Tietiesbaai)', false, ARRAY[]::text[]),
('Western Cape', 'West Coast (Atlantic)', 'St Helena Bay', -32.7600, 18.0300, 'Sheltered bay, beaches, rocky points', 'Public; major commercial fishing hub', ARRAY['Snoek','Hottentot','Galjoen','Kob','Harders'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'West Coast (Atlantic)', 'Elands Bay', -32.3000, 18.3200, 'Rocky points, long beaches; Verlorenvlei estuary nearby', 'Public; also a surf mecca; cold Benguela water', ARRAY['Galjoen','Hottentot','Kob','White Stumpnose','Shad','Sharks','Rays'], false, null, false, ARRAY[]::text[]),
('Western Cape', 'West Coast (Atlantic)', 'Lambert''s Bay', -32.0800, 18.3000, 'Harbour, rocky coast, Bird Island', 'Public; known for fishing and birding', ARRAY['Snoek','Galjoen','Hottentot','Kob'], false, null, false, ARRAY[]::text[]);
