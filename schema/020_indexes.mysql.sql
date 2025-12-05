-- Auto-generated from schema-map-mysql.yaml (map@sha1:5E62933580349BE7C623D119AC9D1301A62F03EF)
-- engine: mysql
-- table:  jwt_tokens

CREATE INDEX idx_jwt_replaced_by ON jwt_tokens (replaced_by);
