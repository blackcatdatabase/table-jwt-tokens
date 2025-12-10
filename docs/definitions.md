# jwt_tokens

Refresh/API token registry with revocation support.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| revoked | BOOLEAN | NO | mysql: 0 / postgres: FALSE | Revocation flag. |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| token_hash | mysql: BINARY(32) / postgres: BYTEA | NO |  | Hashed token. |
| replaced_by | BIGINT | YES |  | Newer token id (token rotation). |
| meta | mysql: JSON / postgres: JSONB | YES |  | Additional JSON metadata. |
| ip_hash | mysql: BINARY(32) / postgres: BYTEA | YES |  | Hashed client IP. |
| jti | CHAR(36) | NO |  | JWT ID (unique). |
| token_hash_algo | VARCHAR(50) | YES |  | Hash algorithm. |
| scopes | VARCHAR(255) | YES |  | Space/comma separated scopes. |
| ip_hash_key_version | VARCHAR(64) | YES |  | Key version for ip_hash. |
| expires_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | YES |  | Expiration timestamp (UTC). |
| last_used_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | YES |  | Last usage (UTC). |
| token_hash_key_version | VARCHAR(64) | YES |  | Key version used for token hashing. |
| type | mysql: ENUM('refresh','api') / postgres: TEXT | NO | refresh | Token kind. (enum: refresh, api) |
| user_id | BIGINT | YES |  | User (FK users.id), optional. |
| id | BIGINT | NO |  | Surrogate primary key. |

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
| vw_jwt_tokens | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_jwt_tokens | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
