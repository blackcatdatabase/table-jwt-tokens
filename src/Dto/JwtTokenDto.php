<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\JwtTokens\Dto;

/**
 * Simple immutable DTO with public readonly properties.
 * - No logic; just a data carrier.
 * - Strong types enforce the contract across layers.
 */
final class JwtTokenDto implements \JsonSerializable {
    public function __construct(
        public readonly int $id,
        public readonly string $jti,
        public readonly ?int $userId,
        #[\SensitiveParameter] public readonly string $tokenHash,
        public readonly ?string $tokenHashAlgo,
        public readonly ?string $tokenHashKeyVersion,
        public readonly string $type,
        public readonly ?string $scopes,
        public readonly \DateTimeImmutable $createdAt,
        public readonly int $version,
        public readonly ?\DateTimeImmutable $expiresAt,
        public readonly ?\DateTimeImmutable $lastUsedAt,
        #[\SensitiveParameter] public readonly ?string $ipHash,
        public readonly ?string $ipHashKeyVersion,
        public readonly ?int $replacedBy,
        public readonly bool $revoked,
        public readonly array|null $meta
    ) {}

    /** Suitable for serialization/logging (without large blobs). */
    public function toArray(): array {
        return get_object_vars($this);
    }

    /** toArray() without null values - for clean logging/diffs. */
    public function toArrayNonNull(): array {
        return array_filter(get_object_vars($this), static fn($v) => $v !== null);
    }

    public function jsonSerialize(): array {
       $a = $this->toArray();
       foreach ($a as $k => $v) {
           if ($v instanceof \DateTimeInterface) {
               // ISO-8601 with a timezone; switch to 'Y-m-d H:i:s.u' if needed
               $a[$k] = $v->format(\DateTimeInterface::ATOM);
           }
       }
       return $a;
   }
}
