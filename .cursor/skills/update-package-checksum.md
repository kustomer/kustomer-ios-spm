# Update Package.swift checksum

**When to use:** When this file is @ mentioned, or when the user asks to update the checksum (or bump the version) in Package.swift for the kustomer-ios zip.

**Input (optional):**
- **`latest`** – Resolve the latest tag from the repo (see step 1 below), then use that tag for the zip URL and update both `url:` and `checksum:` in Package.swift.
- **Version string** (e.g. `7.1.2`) – Use this version to build the zip URL and update both `url:` and `checksum:` in Package.swift.
- **Nothing** – Read the zip URL from the current `Package.swift` and only update the checksum.

---

## Steps

1. **Determine the zip URL**
   - If the user said **`latest`**: get the latest tag from the repo. Call the GitHub API:
     ```bash
     curl -sL https://api.github.com/repos/kustomer/kustomer-ios/releases/latest
     ```
     From the JSON response, use the `tag_name` value (e.g. `7.1.2` or `v7.1.2`). Build the zip URL:
     `https://github.com/kustomer/kustomer-ios/archive/refs/tags/{tag_name}.zip`
     (Use `tag_name` exactly as returned; some repos use a leading `v`, some don’t.)
   - If the user provided a **version** (e.g. `7.1.2`): use  
     `https://github.com/kustomer/kustomer-ios/archive/refs/tags/{version}.zip`
   - If **no version or “latest”** was given: read the URL from `Package.swift` (the line `url: "https://github.com/kustomer/kustomer-ios/archive/refs/tags/...zip",` around lines 7–8).

2. **Download the zip** to a temporary file, e.g.:
   ```bash
   TMP=$(mktemp)
   curl -sL -o "$TMP" "<url from step 1>"
   ```

3. **Compute SHA-256** of the temp file:
   ```bash
   shasum -a 256 "$TMP"
   ```
   Use the first field (the hex digest) as the new checksum value.

4. **Update Package.swift**
   - Replace the value of `checksum: "..."` (around line 8) with the digest from step 3. Keep the rest of the line unchanged (e.g. the closing `")`).
   - If **`latest`** or a **version** was used in step 1: also replace the `url:` value so it points to that tag’s zip (e.g. `url: "https://github.com/kustomer/kustomer-ios/archive/refs/tags/7.1.2.zip",`).

5. **Remove the temp file**:
   ```bash
   rm -f "$TMP"
   ```

---

**Examples of how to call this (e.g. in chat):**
- `@update-package-checksum.md` → update checksum using the version/URL already in Package.swift
- `@update-package-checksum.md latest` → resolve latest tag from GitHub, then update both the zip URL and the checksum in Package.swift
- `@update-package-checksum.md 7.1.2` → use version 7.1.2: update both the zip URL and the checksum in Package.swift
