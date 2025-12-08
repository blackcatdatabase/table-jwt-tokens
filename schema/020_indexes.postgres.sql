-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  jwt_tokens

CREATE INDEX IF NOT EXISTS idx_jwt_user ON jwt_tokens (user_id);

CREATE INDEX IF NOT EXISTS idx_jwt_expires ON jwt_tokens (expires_at);

CREATE INDEX IF NOT EXISTS idx_jwt_revoked_user ON jwt_tokens (revoked, user_id);

CREATE INDEX IF NOT EXISTS idx_jwt_last_used ON jwt_tokens (last_used_at);

CREATE INDEX IF NOT EXISTS idx_jwt_replaced_by ON jwt_tokens (replaced_by);

CREATE INDEX IF NOT EXISTS idx_jwt_active_sweep ON jwt_tokens (revoked, expires_at);
