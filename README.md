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

In addition to the CCADB roots, Eiger also accepts the following roots:

- Google's Merge Delay Monitor Root
- SwissSign's Merge Delay Monitor Root

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

To get your root accepted by Rotstock, open a new issue.

#### Accepted Roots

Rotstock accepts roots that are not publicly trusted and that were submitted by the community.

To suggest a new root, create a MR with the certificate correctly formated into the [`additional_roots`](./rotstock/additional_roots) folder.

#### Active Shards

| Name           | Monitoring prefix                       | Submission prefix                       | Interval                                    |    
|----------------|-----------------------------------------|-----------------------------------------|---------------------------------------------|
| rotstock2026h2 | mon.rotstock2026h2.pre.ct.swisssign.com | log.rotstock2026h2.pre.ct.swisssign.com | 2026-07-01T00:00:00Z – 2027-01-01T00:00:00Z |
| rotstock2027h1 | mon.rotstock2027h1.pre.ct.swisssign.com | log.rotstock2027h1.pre.ct.swisssign.com | 2027-01-01T00:00:00Z – 2027-07-01T00:00:00Z |
| rotstock2027h2 | mon.rotstock2027h2.pre.ct.swisssign.com | log.rotstock2027h2.pre.ct.swisssign.com | 2027-07-01T00:00:00Z – 2028-01-01T00:00:00Z |


## Building the Roots File

[`build-roots.sh`](./build-roots.sh) combines every `.crt` (PEM) certificate in a folder into a single CA roots file, sorted by file name:

```sh
./build-roots.sh -in rotstock/additional_roots -out pem/rotstock-ca-roots.pem
```

Both `-in` (folder containing the `.crt` files) and `-out` (file to write) are required. The output folder is created if it doesn't exist.