<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->
# Definition – jwt_tokens

Refresh/API token registry with revocation support.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| jti | CHAR(36) | NO | — | JWT ID (unique). |  |
| user_id | BIGINT UNSIGNED | YES | — | User (FK users.id), optional. |  |
| token_hash | BINARY(32) | NO | — | Hashed token. | PII: hashed |
| token_hash_algo | VARCHAR(50) | YES | — | Hash algorithm. |  |
| token_hash_key_version | VARCHAR(64) | YES | — | Key version used for token hashing. |  |
| type | ENUM('refresh','api') | NO | 'refresh' | Token kind. | enum: refresh, api |
| scopes | VARCHAR(255) | YES | — | Space/comma separated scopes. |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| expires_at | DATETIME(6) | YES | — | Expiration timestamp (UTC). |  |
| last_used_at | DATETIME(6) | YES | — | Last usage (UTC). |  |
| ip_hash | BINARY(32) | YES | — | Hashed client IP. | PII: hashed |
| ip_hash_key_version | VARCHAR(64) | YES | — | Key version for ip_hash. |  |
| replaced_by | BIGINT UNSIGNED | YES | — | Newer token id (token rotation). |  |
| revoked | BOOLEAN | NO | 0 | Revocation flag. |  |
| meta | JSON | YES | — | Additional JSON metadata. |  |