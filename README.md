# SwissSign CT Logs

Certificate Transparency logs operated by SwissSign.

## Overview

- **On-premises hosting:** all logs run in SwissSign's own data centers in north-central Switzerland.
- **Software:** powered by [TesseraCT](https://github.com/transparency-dev/tesseract), an implementation of the [Static CT API](https://c2sp.org/static-ct-api).
- **Storage:** TesseraCT's POSIX backend implementation

## Production Logs

### Eiger

Our production CT log. It's named after the Eiger, the best-known peak in the Bernese Oberland, as a symbol of strength and stability.

Shards are served under `ct.swisssign.com` and split into half-year intervals.

#### Accepted Roots

Eiger accepts all roots from the CCADB repository with the Server Authentication (TLS) key usage.

#### Active Shards

| Name        | Monitoring prefix                | Submission prefix                    | Interval                                    |
|-------------|----------------------------------|--------------------------------------|---------------------------------------------|
| eiger2026h2 | mon.eiger2026h2.ct.swisssign.com | log.eiger2026h2.ct.swisssign.com | 2026-07-01T00:00:00Z – 2027-01-01T00:00:00Z |
| eiger2027h1 | mon.eiger2027h1.ct.swisssign.com | log.eiger2027h1.ct.swisssign.com | 2027-01-01T00:00:00Z – 2027-07-01T00:00:00Z |
| eiger2027h2 | mon.eiger2027h2.ct.swisssign.com | log.eiger2027h2.ct.swisssign.com | 2027-07-01T00:00:00Z – 2028-01-01T00:00:00Z |
| eiger2028h1 | mon.eiger2028h1.ct.swisssign.com | log.eiger2028h1.ct.swisssign.com | 2028-01-01T00:00:00Z – 2028-07-01T00:00:00Z |
| eiger2028h2 | mon.eiger2028h2.ct.swisssign.com | log.eiger2028h2.ct.swisssign.com | 2028-07-01T00:00:00Z – 2029-01-01T00:00:00Z |

## Test Logs

### Rotstock

Our test log, named after the Eiger's little sibling, where climbers go to practice before the real thing. Fall off here and nobody writes a mountaineering book about it.

Rotstock runs in our pre-production environment, under `pre.ct.swisssign.com`. We use it to validate new software releases, network hardening and operational procedures before they reach production. Incidents are handled during CET business hours only.

#### Accepted Roots

Rotstock accepts variout roots that that were submitted by the community.

We’re adding root CA certificates to our test log. To have yours included, open a new issue and attach your root certificate in PEM format.

#### Active Shards

| Name           | Monitoring prefix                       | Submission prefix                       | Interval                                    |    
|----------------|-----------------------------------------|-----------------------------------------|---------------------------------------------|
| rotstock2026h2 | mon.rotstock2026h2.pre.ct.swisssign.com | log.rotstock2026h2.pre.ct.swisssign.com | 2026-07-01T00:00:00Z – 2027-01-01T00:00:00Z |
| rotstock2027h1 | mon.rotstock2027h1.pre.ct.swisssign.com | log.rotstock2027h1.pre.ct.swisssign.com | 2027-01-01T00:00:00Z – 2027-07-01T00:00:00Z |
| rotstock2027h2 | mon.rotstock2027h2.pre.ct.swisssign.com | log.rotstock2027h2.pre.ct.swisssign.com | 2027-07-01T00:00:00Z – 2028-01-01T00:00:00Z |
