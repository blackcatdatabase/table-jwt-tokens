<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – jwt_tokens

Refresh/API token registry with revocation support.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| jti | CHAR(36) | NO | — | JWT ID (unique). |  |
| user_id | BIGINT | YES | — | User (FK users.id), optional. |  |
| token_hash | BYTEA | NO | — | Hashed token. | PII: hashed |
| token_hash_algo | VARCHAR(50) | YES | — | Hash algorithm. |  |
| token_hash_key_version | VARCHAR(64) | YES | — | Key version used for token hashing. |  |
| type | TEXT | NO | 'refresh' | Token kind. | enum: refresh, api |
| scopes | VARCHAR(255) | YES | — | Space/comma separated scopes. |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| version | INTEGER | NO | 0 |  |  |
| expires_at | TIMESTAMPTZ(6) | YES | — | Expiration timestamp (UTC). |  |
| last_used_at | TIMESTAMPTZ(6) | YES | — | Last usage (UTC). |  |
| ip_hash | BYTEA | YES | — | Hashed client IP. | PII: hashed |
| ip_hash_key_version | VARCHAR(64) | YES | — | Key version for ip_hash. |  |
| replaced_by | BIGINT | YES | — | Newer token id (token rotation). |  |
| revoked | BOOLEAN | NO | FALSE | Revocation flag. |  |
| meta | JSONB | YES | — | Additional JSON metadata. |  |