-- Auto-generated from schema-views-postgres.psd1 (map@mtime:2025-10-24T09:45:40Z)
-- engine: postgres
-- table:  jwt_tokens
-- Contract view for [jwt_tokens]
-- Hides token_hash.
CREATE OR REPLACE VIEW vw_jwt_tokens AS
SELECT
  id,
  jti,
  user_id,
  token_hash_algo,
  token_hash_key_version,
  type,
  scopes,
  created_at,
  expires_at,
  last_used_at,
  ip_hash,
  ip_hash_key_version,
  replaced_by,
  revoked,
  meta
FROM jwt_tokens;
