-- Auto-generated from schema-map-mysql.yaml (map@74ce4f4)
-- engine: mysql
-- table:  jwt_tokens

CREATE INDEX idx_jwt_replaced_by ON jwt_tokens (replaced_by);
