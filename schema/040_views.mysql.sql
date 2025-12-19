-- Auto-generated from schema-views-mysql.yaml (map@sha1:39CF23914A48753BF55EEB1F38DDBA21AB1DBBB7)
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
  CAST(UPPER(SHA2(token_hash, 256)) AS CHAR(64)) AS token_hash_hex,
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
