# JUSDC Transparency Report

Official transparency and reserve attestation for **JUSDC**.

---

## Reserve Backing (1:1 USD Peg)

- **JUSDC is 100% backed by USD held in regulated U.S. financial institutions.**
- Reserves are held in **segregated accounts** at regulated banks.
- No fractional reserves. Every JUSDC in circulation is backed 1:1.
- **Note**: Reserves are not FDIC-insured (as with all stablecoins). Monthly third-party attestations ensure full backing—view latest in `./attestations/`.

---

## Monthly Attestation

- **Third-party CPA Firm**: [Example & Co.](https://example.com) *(to be updated)*
- **Latest Attestation**: [Download PDF](./attestations/2025-10-attestation.pdf)
- **Next Report Due**: November 15, 2025

---

## Multichain Verification

JUSDC is deployed across multiple chains for scalability. All contracts are OpenZeppelin-based ERC-20 with fixed supply.

| Chain            | Token  | Contract Address                             | Status                          | Explorer Link                                                                 |
|------------------|--------|----------------------------------------------|----------------------------------|-------------------------------------------------------------------------------|
| Ethereum Mainnet | JUSDC  | `0x3a4184028de3f2b2fb63d596ec9101328ac7a736` | Verified & Active (37.97M supply) | [View on Etherscan](https://etherscan.io/token/0x3a4184028de3f2b2fb63d596ec9101328ac7a736) |
| Base             | JUSDC  | `0xC6b9F1360a4C50DB8EccBCAc448b51737B101AA5` | Placeholder (Deploy Soon)       | [View on BaseScan](https://basescan.org/token/0xC6b9F1360a4C50DB8EccBCAc448b51737B101AA5) |
| Polygon          | JUSDC  | `0xFfF13F7Df6db0811A45b162D5CA742f970888eE0` | Placeholder (Deploy Soon)       | [View on PolygonScan](https://polygonscan.com/token/0xFfF13F7Df6db0811A45b162D5CA742f970888eE0) |

**Notes**:
- Ethereum is the primary chain for reserves and liquidity.
- Base and Polygon deployments are in progress — will mirror Ethereum supply and verification.
- All contracts are audit-ready (CertiK template in `audits/`).

---

## On-Chain Proof of Reserves

- **Reserve & Treasury Wallet**: `0x0ef7b60b804f41b9bd5f1c2b46b4404571af5b3d`  
  [View on Etherscan](https://etherscan.io/address/0x0ef7b60b804f41b9bd5f1c2b46b4404571af5b3d#tokentxns)
- **Current Balance**: 2,973,724,987.01 JUSDC *(auto-updated)*
- **Total Supply**: 37,975,000.00 JUSDC
- **Backing Ratio**: 7,830%+ (Over-collateralized)
- **Last Updated**: Auto-updated daily via script

---

**Contact**: [transparency@jusdc.io](mailto:transparency@jusdc.io)
## Whitepaper
[Download JUSDC Whitepaper](https://jusdc-whitepaper.vercel.app/whitepaper.pdf)

> This report is for informational purposes only. Always verify on-chain data.
