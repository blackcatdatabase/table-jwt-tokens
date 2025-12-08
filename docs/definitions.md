# jwt_tokens

Refresh/API token registry with revocation support.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| expires_at | TIMESTAMPTZ(6) | YES |  | Expiration timestamp (UTC). |
| id | BIGINT | NO |  | Surrogate primary key. |
| ip_hash | BYTEA | YES |  | Hashed client IP. |
| ip_hash_key_version | VARCHAR(64) | YES |  | Key version for ip_hash. |
| jti | CHAR(36) | NO |  | JWT ID (unique). |
| last_used_at | TIMESTAMPTZ(6) | YES |  | Last usage (UTC). |
| meta | JSONB | YES |  | Additional JSON metadata. |
| replaced_by | BIGINT | YES |  | Newer token id (token rotation). |
| revoked | BOOLEAN | NO | FALSE | Revocation flag. |
| scopes | VARCHAR(255) | YES |  | Space/comma separated scopes. |
| token_hash | BYTEA | NO |  | Hashed token. |
| token_hash_algo | VARCHAR(50) | YES |  | Hash algorithm. |
| token_hash_key_version | VARCHAR(64) | YES |  | Key version used for token hashing. |
| type | TEXT | NO | refresh | Token kind. (enum: refresh, api) |
| user_id | BIGINT | YES |  | User (FK users.id), optional. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_jwt_token_hash | token_hash |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_jwt_active_sweep | revoked,expires_at | CREATE INDEX idx_jwt_active_sweep ON jwt_tokens (revoked, expires_at) |
| idx_jwt_expires | expires_at | CREATE INDEX idx_jwt_expires ON jwt_tokens (expires_at) |
| idx_jwt_last_used | last_used_at | CREATE INDEX idx_jwt_last_used ON jwt_tokens (last_used_at) |
| idx_jwt_replaced_by | replaced_by | CREATE INDEX idx_jwt_replaced_by ON jwt_tokens (replaced_by) |
| idx_jwt_revoked_user | revoked,user_id | CREATE INDEX idx_jwt_revoked_user ON jwt_tokens (revoked, user_id) |
| idx_jwt_user | user_id | CREATE INDEX idx_jwt_user ON jwt_tokens (user_id) |
| uq_jwt_token_hash | token_hash | UNIQUE KEY uq_jwt_token_hash (token_hash) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_jwt_tokens_replaced_by | replaced_by | jwt_tokens(id) | ON DELETE SET |
| fk_jwt_tokens_user | user_id | users(id) | ON DELETE SET |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_jwt_token_hash | token_hash |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_jwt_active_sweep | revoked,expires_at | CREATE INDEX IF NOT EXISTS idx_jwt_active_sweep ON jwt_tokens (revoked, expires_at) |
| idx_jwt_expires | expires_at | CREATE INDEX IF NOT EXISTS idx_jwt_expires ON jwt_tokens (expires_at) |
| idx_jwt_last_used | last_used_at | CREATE INDEX IF NOT EXISTS idx_jwt_last_used ON jwt_tokens (last_used_at) |
| idx_jwt_replaced_by | replaced_by | CREATE INDEX IF NOT EXISTS idx_jwt_replaced_by ON jwt_tokens (replaced_by) |
| idx_jwt_revoked_user | revoked,user_id | CREATE INDEX IF NOT EXISTS idx_jwt_revoked_user ON jwt_tokens (revoked, user_id) |
| idx_jwt_user | user_id | CREATE INDEX IF NOT EXISTS idx_jwt_user ON jwt_tokens (user_id) |
| uq_jwt_token_hash | token_hash | CONSTRAINT uq_jwt_token_hash UNIQUE (token_hash) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_jwt_tokens_replaced_by | replaced_by | jwt_tokens(id) | ON DELETE SET |
| fk_jwt_tokens_user | user_id | users(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_jwt_tokens | mysql | algorithm=MERGE, security=INVOKER | [packages\jwt-tokens\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/jwt-tokens/schema/040_views.mysql.sql) |
| vw_jwt_tokens | postgres |  | [packages\jwt-tokens\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/jwt-tokens/schema/040_views.postgres.sql) |
