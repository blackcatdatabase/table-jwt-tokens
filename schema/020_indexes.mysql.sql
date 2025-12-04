-- Auto-generated from schema-map-mysql.yaml (map@4ae85c5)
-- engine: mysql
-- table:  jwt_tokens

CREATE INDEX idx_jwt_replaced_by ON jwt_tokens (replaced_by);
