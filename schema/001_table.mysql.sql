-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-10-24T09:13:35Z)
-- engine: mysql
-- table:  jwt_tokens
CREATE TABLE IF NOT EXISTS jwt_tokens (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  jti CHAR(36) NOT NULL UNIQUE,
  user_id BIGINT UNSIGNED NULL,
  token_hash BINARY(32) NOT NULL,
  token_hash_algo VARCHAR(50) NULL,
  token_hash_key_version VARCHAR(64) NULL,
  type ENUM('refresh','api') NOT NULL DEFAULT 'refresh',
  scopes VARCHAR(255) NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  expires_at DATETIME(6) NULL,
  last_used_at DATETIME(6) NULL,
  ip_hash BINARY(32) NULL,
  ip_hash_key_version VARCHAR(64) NULL,
  replaced_by BIGINT UNSIGNED NULL,
  revoked BOOLEAN NOT NULL DEFAULT 0,
  meta JSON NULL,
  UNIQUE KEY uq_jwt_token_hash (token_hash),
  INDEX idx_jwt_user (user_id),
  INDEX idx_jwt_expires (expires_at),
  INDEX idx_jwt_revoked_user (revoked, user_id),
  INDEX idx_jwt_last_used (last_used_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
