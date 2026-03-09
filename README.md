# ConsentCheck – Consent Mode v2 Default (GTM Template)

A Google Tag Manager template that sets Consent Mode v2 default state to **denied** for all consent types. GDPR/CCPA compliant. Fire on **Consent Initialization - All Pages**.

## What it does

- Sets `ad_storage`, `ad_user_data`, `ad_personalization`, and `analytics_storage` to `denied` by default
- `wait_for_update` to give your CMP time to update consent (optional, default 500ms)
- Optional: ads data redaction, URL passthrough

## Setup

1. **Install the template** in GTM: Templates → Search Gallery → Search "ConsentCheck" (or import via Community Gallery)
2. **Create a tag** using this template
3. **Trigger**: Consent Initialization - All Pages
4. **Wire your CMP** to call `updateConsentState` when users accept or reject

## Verify

After setup, run a free scan at [consentcheck.online](https://consentcheck.online) to confirm Consent Mode v2 and tracking behave correctly.

## Generate snippet code

For a copy-paste snippet (instead of GTM), use the [Consent Mode Snippet Generator](https://consentcheck.online/consent-mode-snippet).

## Support

- [consentcheck.online](https://consentcheck.online)
- [GTM Consent Mode docs](https://support.google.com/tagmanager/answer/10718549)
