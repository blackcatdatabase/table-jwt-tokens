-- Auto-generated from schema-views-postgres.psd1 (map@c5e4097)
-- engine: postgres
-- table:  jwt_tokens
-- Contract view for [jwt_tokens]
-- Hides token_hash; adds hex helper and jti as text.
CREATE OR REPLACE VIEW vw_jwt_tokens AS
SELECT
  id,
  jti,
  jti::text AS jti_text,
  user_id,
  token_hash_algo,
  token_hash_key_version,
  type,
  scopes,
  created_at,
  version,
  expires_at,
  last_used_at,
  ip_hash,
  encode(ip_hash, 'hex') AS ip_hash_hex,
  ip_hash_key_version,
  replaced_by,
  revoked,
  meta,
  encode(token_hash, 'hex') AS token_hash_hex
FROM jwt_tokens;
