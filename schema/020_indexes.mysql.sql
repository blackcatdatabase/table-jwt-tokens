-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  jwt_tokens

CREATE INDEX idx_jwt_replaced_by ON jwt_tokens (replaced_by);
