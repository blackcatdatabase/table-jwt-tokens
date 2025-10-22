<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\JwtTokens;

final class Definitions {
    // --- základní metadata ---
    public static function table(): string { return 'jwt_tokens'; }
    public static function contractView(): string { return 'v_jwt_tokens_contract'; }
    /** @return string[] */
    public static function columns(): array { return [ 'id', 'jti', 'user_id', 'token_hash', 'token_hash_algo', 'token_hash_key_version', 'type', 'scopes', 'created_at', 'expires_at', 'last_used_at', 'ip_hash', 'ip_hash_key_version', 'replaced_by', 'revoked', 'meta' ]; }
    public static function pk(): string { return 'id'; }

    // --- volitelná metadata (mohou být prázdná) ---
    public static function softDeleteColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null;
    }
    public static function updatedAtColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null;
    }
    public static function versionColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null; // pro optimistic locking
    }
    /** např. "created_at DESC, id DESC" */
    public static function defaultOrder(): ?string {
        $c = 'created_at DESC, id DESC'; return $c !== '' ? $c : null;
    }
    /** @return array<int,array<int,string>> seznam unikátních klíčů (sloupcových kombinací) */
    public static function uniqueKeys(): array { return []; }
    /** @return string[] JSON sloupce kvůli castům/operacím */
    public static function jsonColumns(): array { return [ 'meta' ]; }

    // --- pomocníci ---
    public static function hasColumn(string $col): bool {
        static $set = null;
        if ($set === null) { $set = array_fill_keys(self::columns(), true); }
        return isset($set[$col]);
    }
}
