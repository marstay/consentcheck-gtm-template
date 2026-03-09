# Submitting to the GTM Community Template Gallery

## Before you submit

1. **Test the template in GTM**
   - In GTM, go to Templates → More Actions (⋮) → Import
   - Select `template.tpl`
   - Create a tag using the template, trigger it on Consent Initialization - All Pages
   - Test in Preview mode

2. **Push to GitHub**
   - Create a new repo (e.g. `consentcheck-gtm-template`)
   - Add all files: `template.tpl`, `metadata.yaml`, `LICENSE`, `README.md`
   - Push to `main` branch

3. **Update metadata.yaml**
   - Get the first commit SHA (e.g. from GitHub commit view)
   - Replace `PLACEHOLDER_REPLACE_WITH_FIRST_COMMIT_SHA` with that SHA

4. **Agree to Terms**
   - In GTM Template Editor, open the template and check "Agree to the Community Template Gallery Terms of Service" under the Info tab
   - Re-export and replace `template.tpl` if needed

## Submit

1. Go to [tagmanager.google.com/gallery](https://tagmanager.google.com/gallery)
2. Sign in with a GitHub account that has access to the repo
3. Click "Submit Template"
4. Enter your repository URL (e.g. `https://github.com/yourusername/consentcheck-gtm-template`)
5. Click Submit

## After approval

- Template appears in the Gallery (typically 2–3 days)
- Users can search for "ConsentCheck" or "Consent Mode"
- To update: add a new version entry to `metadata.yaml` with the new commit SHA and change notes, then push
