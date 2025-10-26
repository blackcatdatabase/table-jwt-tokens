<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\JwtTokens\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class JwtTokenDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $jti,
        public readonly ?int $userId,
        public readonly string $tokenHash,
        public readonly ?string $tokenHashAlgo,
        public readonly ?string $tokenHashKeyVersion,
        public readonly string $type,
        public readonly ?string $scopes,
        public readonly \DateTimeImmutable $createdAt,
        public readonly int $version,
        public readonly ?\DateTimeImmutable $expiresAt,
        public readonly ?\DateTimeImmutable $lastUsedAt,
        public readonly ?string $ipHash,
        public readonly ?string $ipHashKeyVersion,
        public readonly ?int $replacedBy,
        public readonly bool $revoked,
        public readonly array|null $meta
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}
