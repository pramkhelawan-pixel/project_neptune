# Neptune Task: Implement 12-Hour Tide Data Caching

You are the Lead Software Architect for Neptune. Implement a production-grade tide caching system using Supabase and Flutter.

## Objective

Reduce WorldTides API usage by caching tide data for 12 hours. The mobile application must never call the WorldTides API directly. All requests must flow through the Neptune backend.

## Architecture

```
Flutter App
      ↓
Supabase Edge Function
      ↓
Supabase PostgreSQL Cache
      ↓
WorldTides API (only when cache has expired)
```

## Requirements

### Security

- Store the WorldTides API key only as a Supabase Secret.
- Never expose the API key to the Flutter application.
- All API communication must occur through the backend.

### Database

Create a table named "tide_cache" with appropriate indexes.

Suggested fields:

- id (UUID)
- location_name
- latitude
- longitude
- request_hash (unique key for location and request parameters)
- tide_data (JSONB)
- last_updated
- expires_at
- created_at

Add indexes for:

- request_hash
- expires_at

### Cache Logic

When the Flutter app requests tide information:

1. Generate a request hash based on latitude, longitude, date, and relevant parameters.
2. Search "tide_cache".
3. If a valid record exists and "expires_at" is greater than the current time:
   - Return the cached JSON immediately.
   - Do not call WorldTides.
4. If no valid cache exists:
   - Call the WorldTides API.
   - Save the response in "tide_cache".
   - Set:
     - "last_updated = NOW()"
     - "expires_at = NOW() + INTERVAL '12 hours'"
   - Return the fresh data.

### Flutter Integration

Create a service that:

- Calls the Supabase Edge Function.
- Never communicates directly with WorldTides.
- Uses the returned JSON to populate the UI.
- Handles loading, timeout, offline, and retry states gracefully.

### Performance

Optimise for:

- Minimum API calls.
- Fast response times.
- Efficient database queries.
- Clean repository architecture.
- SOLID principles.
- Production readiness.

### Error Handling

Handle:

- API timeouts.
- Invalid responses.
- Missing cache.
- Expired cache.
- Network failures.
- Database errors.

If WorldTides is unavailable but cached data exists (even if slightly expired), return the cached data with a warning flag instead of failing.

## Deliverables

Implement:

- SQL migration.
- Supabase Edge Function.
- Repository layer.
- Service layer.
- Flutter integration.
- Unit tests.
- Logging.
- Documentation.
- Clean architecture consistent with the existing Neptune project.

Ensure the implementation is modular, scalable, and suitable for thousands of concurrent users.
