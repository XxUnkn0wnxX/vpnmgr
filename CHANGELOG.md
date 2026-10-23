# Changelog

Changes that reach routers, and changes to how providers are maintained. Each release is published as a [GitHub release](https://github.com/h0me5k1n/vpnmgr/releases) from its section below.

Versions before v3.4.0 have no entries here; see the [commit history](https://github.com/h0me5k1n/vpnmgr/commits/main).

<!--
Contributors: record changes in the same PR as the change, under a
"## Unreleased" heading at the top of the list (add the heading if it isn't
there). At release it is renamed to the version and date. Never leave an
empty "## Unreleased" heading; the smoke test rejects one.
-->

## Unreleased

### Fixed

- Load Merlin's `httpApi.js` before `client_function.js` so the VPN Manager page can initialize on firmware versions that defer loading the API.

## v3.4.0 (2026-10-18)

### Added

- **Searchable country and city picker** in slot setup. Type part of a name to filter, use Tab or the arrow keys to move, Enter to pick and Esc to cancel. Matching ignores case, spaces and punctuation. Terminals without raw key input get a numbered list that can be narrowed by typing. (#49)
- **Installed commit shown for `develop` installs.** After `vpnmgr develop`, the CLI header and the WebUI version show which commit is installed, for example `v3.4.0 (develop@9a18d5f)`, and every file in the install comes from that one commit. Installs from `main` (`vpnmgr stable` or a normal update) show only the version. (#53)
- **`API_TESTED` provider status**, for providers that pass the automated API check, including an OpenVPN handshake, but have not been connected with a live account. On the router it behaves like `UNTESTED`: not installed by default and not shown in the WebUI. Surfshark and PIA move to this status. (#48)

### Fixed

- **PIA:** all 112 countries in PIA's server list can be selected. 21 of them were listed as bare country codes with no cities. (#50, #52)
- **PIA:** tls-auth is disabled, since PIA's configs have no tls-auth key. (#51, #52)

### Repository

- A scheduled workflow checks every provider against its live API daily, with a weekly OpenVPN handshake check, and opens an `api-check` issue when an `ACTIVE` or `API_TESTED` provider breaks. (#48)
- Each release is tagged and published as a GitHub release from this changelog.
