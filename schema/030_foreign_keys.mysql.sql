-- Auto-generated from schema-map-mysql.yaml (map@sha1:09DF9CA612D1573E058190CC207FA257C05AEC1F)
-- engine: mysql
-- table:  jwt_tokens

ALTER TABLE jwt_tokens ADD CONSTRAINT fk_jwt_tokens_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE jwt_tokens ADD CONSTRAINT fk_jwt_tokens_replaced_by FOREIGN KEY (replaced_by) REFERENCES jwt_tokens(id) ON DELETE SET NULL;
