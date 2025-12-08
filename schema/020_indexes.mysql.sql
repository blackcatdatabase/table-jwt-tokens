-- Auto-generated from schema-map-mysql.yaml (map@sha1:09DF9CA612D1573E058190CC207FA257C05AEC1F)
-- engine: mysql
-- table:  jwt_tokens

CREATE INDEX idx_jwt_user ON jwt_tokens (user_id);

CREATE INDEX idx_jwt_expires ON jwt_tokens (expires_at);

CREATE INDEX idx_jwt_revoked_user ON jwt_tokens (revoked, user_id);

CREATE INDEX idx_jwt_last_used ON jwt_tokens (last_used_at);

CREATE INDEX idx_jwt_replaced_by ON jwt_tokens (replaced_by);

CREATE INDEX idx_jwt_active_sweep ON jwt_tokens (revoked, expires_at);
