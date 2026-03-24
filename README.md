# _Project_: Fedora RSS-Discovery & Environment Audit

**Project Purpose:** This project was developed as a practical exercise for the Anthropic AI Fluency Course. It serves as a demonstration of the Delegation competency—balancing human architectural discernment with AI technical precision to solve a real-world IT automation challenge.
## 1. The Role of Gemini (AI Collaboration)

This project was co-developed with Gemini, an AI collaborator.

**Why AI was used:** To provide rapid technical syntax for Bash Regular Expressions (RegEx) and Python system diagnostics, allowing the human lead to focus on high-level project vision and user experience (UX).

**Technical Validation:** Gemini provided the specific string manipulation logic (using grep and sed) required to filter out modern web "noise" that would otherwise overwhelm a general audience.

## 2. System Pre-requisites

This tool is designed specifically for Fedora Linux users.

**The Diagnostic Tool:** A Python script is included to check for curl and grep before execution.

**Recommended Readers:** * Graphical: NewsFlash (flatpak install flathub com.github.jangernert.FeedReader)

**Terminal:** Newsboat (sudo dnf install newsboat)

## 3. Technical Observations & Vetting

During the "Diligence" phase of this project, several key behaviors were identified through live vetting:

**Standard Success:** Sites following traditional web protocols (e.g., Fedora Magazine) return clean, direct links.

**Modern Web Complexity:** Sites like The Verge and IOL contain excessive metadata. The script was refined with a strict keyword filter (rss|xml|feed) to ensure the output remains accessible to users who are colorblind or using screen readers.

**Walled Gardens:** High-security or JavaScript-heavy platforms (e.g., Netflix, Reuters) may return no results, marking the boundary where automated scripting ends and human research begins.

## 4. Final Discovery Script (Version 2.0)

    #!/bin/bash
    #Clean, filtered RSS discovery for Fedora users.
    echo "Enter Website URL:"
    read TARGET_URL
    echo "--- Scanning $TARGET_URL ---"
    curl -sL "$TARGET_URL" | \
    grep -Ei '<link.*application/(rss|atom)\+xml' | \
    grep -oEi 'href="([^"]+)"' | \
    cut -d'"' -f2 | \
    grep -Ei 'rss|xml|feed'
    echo "--- Scan Complete ---"

