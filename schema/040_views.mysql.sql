-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  jwt_tokens
-- Contract view for [jwt_tokens]
-- Exposes token hash + hex helper and ip hash hex.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_jwt_tokens AS
SELECT
  id,
  jti,
  CAST(jti AS CHAR(36)) AS jti_text,
  user_id,
  token_hash_algo,
  token_hash_key_version,
  token_hash,
  CAST(LPAD(HEX(token_hash), 64, '0') AS CHAR(64)) AS token_hash_hex,
  `type`,
  scopes,
  created_at,
  version,
  expires_at,
  last_used_at,
  ip_hash,
  CAST(LPAD(HEX(ip_hash), 64, '0') AS CHAR(64)) AS ip_hash_hex,
  ip_hash_key_version,
  replaced_by,
  revoked,
  meta
FROM jwt_tokens;
