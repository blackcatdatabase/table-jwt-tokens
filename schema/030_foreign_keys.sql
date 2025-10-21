-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00)
-- table: jwt_tokens
ALTER TABLE jwt_tokens ADD CONSTRAINT fk_jwt_tokens_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE jwt_tokens ADD CONSTRAINT fk_jwt_tokens_replaced_by FOREIGN KEY (replaced_by) REFERENCES jwt_tokens(id) ON DELETE SET NULL;
