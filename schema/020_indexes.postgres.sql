-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  jwt_tokens
CREATE INDEX idx_jwt_user ON jwt_tokens (user_id);

CREATE INDEX idx_jwt_expires ON jwt_tokens (expires_at);

CREATE INDEX idx_jwt_revoked_user ON jwt_tokens (revoked, user_id);

CREATE INDEX idx_jwt_last_used ON jwt_tokens (last_used_at);
