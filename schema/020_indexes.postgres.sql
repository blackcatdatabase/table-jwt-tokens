-- Auto-generated from schema-map-postgres.psd1 (map@38d5403)
-- engine: postgres
-- table:  jwt_tokens
CREATE INDEX IF NOT EXISTS idx_jwt_user ON jwt_tokens (user_id);

CREATE INDEX IF NOT EXISTS idx_jwt_expires ON jwt_tokens (expires_at);

CREATE INDEX IF NOT EXISTS idx_jwt_revoked_user ON jwt_tokens (revoked, user_id);

CREATE INDEX IF NOT EXISTS idx_jwt_last_used ON jwt_tokens (last_used_at);

CREATE INDEX IF NOT EXISTS idx_jwt_replaced_by ON jwt_tokens (replaced_by);
