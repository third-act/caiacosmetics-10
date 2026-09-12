# BRIEF — CAIA Cosmetics (caiacosmetics-10)

Draft for Demo QA port. Research date: **12 September 2026**. English (skills). App UI: **Swedish**.

**Build gate:** OPEN — Norway Scout **DESIGN-BAKEOFF #4** 12 Sep 2026 (Composer Max).

**Track:** **design-bakeoff #4 / Cursor-only**. **Composer Max** default on all design steps. Soft depth. Gold bar: **caiacosmetics-4** (densitet). Product-integration bar: **caiacosmetics-5**. Splash + 3–5 tab roots; functions need not work. No Opus. No Mail 1/2.

**New project.** Slug `caiacosmetics-10`, repo `third-act/caiacosmetics-10`. Do **not** reuse `-9` or earlier code, seed, photos, or URLs. QA: https://www.thirdact.no/demo/caiacosmetics-10 (no `?v=` on Webflow). Customer: https://www.thirdact.se/caiacosmetics-10. Skills pin: `31ea1b2` (PR #29 face≠flatlay + postage-stamp STOP; keep densitet, imagery-audit, TabPill bleed, zero-gap, Composer Max).

Never contact the brand. Never put `info@caiacosmetics.com` or `pal@` in UI.

---

## 0. HARD REQUIREMENT — onske (verbatim)

Confirmed character-for-character with Norway Scout **12 Sep 2026** (91 chars):

> **Man ska kunna scanna ansiktet och få rekommendationer på vilka produkter som passar min hud**

Visual ship: face scan → resultat → rekommendationer → produkt-detalj + favoritter/profil. Swedish UI. Never dump raw onske as labeled Hem section.

---

## 1. Client

| | |
|---|---|
| Name | Beauty Icons AB (CAIA Cosmetics) |
| Org | 559153-2493 |
| Site | https://caiacosmetics.se/ |
| Audience | KUNDE — ansiktsscan → produktanbefaling |
| Slug | caiacosmetics-10 |
| Market | **SE** |
| Form To | pal@thirdact.se — never in UI |
| Customer URL | https://www.thirdact.se/caiacosmetics-10 |
| QA | https://www.thirdact.no/demo/caiacosmetics-10 |

**Tokens (live site):** blush `#E0CCC7`, cream `#FFFCF7`, secondary pink `#F4EFEB`, ink `#333333`, grey `#C5C3BD`, hover `#6F6464`, campaign `#996466`. Soft cream/blush photography; dewy/glow; Scandi-minimal. Informal *du*. Wordmark **CAIA** (Artico).

**Harvest roles:** lifestyle/store + face close-ups + packshots + category tiles. Bundle assets only (`Image.network` = STOP).

---

## 2c. Art direction

Soft depth **LOCKED**. Soft depth ≠ sparse (densitet STOP).

---

## 5. Job flows (visual)

**A.** Face scan → resultat → rekommendationer  
**B.** Rekommendation → produkt-detalj  
Favoritter / profil = shallow under Mina.

---

## 6. Features (design-bakeoff — thin)

**Tabs (4):** Hem · Hudscan · För dig · Mina  
Signature mock: Hudscan (static OK). Product-detalj optional push.

**Must follow tip `31ea1b2`:**
- **Densitet:** first fold = hero + primary CTA + ≥1 secondary row; no large empty stripe vs caiacosmetics-4
- **Imagery-audit:** **face/scan ≠ flatlay/produkt/brush/logo/geometri** in Hudscan oval; lifestyle/editorial Hem hero; splash harvest photo; distinct För dig; image↔label match
- **Postage-stamp STOP:** no hard-corner white packshot plate inside tinted rounded well — same radius clip **or** edge-to-edge fill (bar = caiacosmetics-5). Match % / price meta **inside** the card
- No accent panel under TabPill; no zero-gap stacked cards
- AppShadows on cards (not chips); break-the-stack once per screen
- First paint: no black frame

**§6e:** Soft depth. One accent-owned surface on one screen. Bar: caiacosmetics-4.

---

## Screens

face scan · resultat · rekommendationer · produkt-detalj · favoritter · profil

Splash → logged-in. No login / Firebase / Azure / TestFlight.
