// Document template. Apply with `#show: conf` after importing; the contents
// page is generated for you, so a document is just its chapters.
//
// The document-facing vocabulary is `conf` and the `callout1`–`callout5`
// family; everything else is internal machinery that `import: *` happens to
// bring along too.

// ── Palette ────────────────────────────────────────────────────────────
// Single source of truth for every color used in the document.
// Only the contents-page title uses this — everything else stays on the
// body font. Not guaranteed to be available wherever this compiles: this
// document says it compiles to PDF in the browser, and a WASM/JS compiler
// only has whatever fonts are explicitly bundled into it, not what's
// installed on this machine. Falls back to the body font if missing.
#let title-font = "Palatino"

#let colors = (
  bg: rgb("#ffffff"),
  text: rgb("#515050"),
  accent1: rgb("#0066cc"),
  accent2: rgb("#1a8f4c"),
  accent3: rgb("#7b2fbf"),
  accent4: rgb("#fbcc53"),
  accent5: rgb("#cc3333"),
  box-bg: rgb("#f4f4f4"),
  muted: rgb("#667c93"),
)

// ── Internals ──────────────────────────────────────────────────────────

// Tags the contents page `conf` generates. Chapter back-links point at it,
// and `is-chapter` uses it to tell that page apart from a real chapter —
// by identity rather than by matching its title text, so a chapter legitimately
// called "Contents" is no longer mistaken for it.
#let contents-label = <contents>

// The contents page is the nav page itself, never a chapter: it must not link
// to itself, nor make the first real chapter look like it has a predecessor.
#let is-chapter(h) = (
  h.level == 1 and h.at("label", default: none) != contents-label
)

// Splits the document's headings around `it` so a show rule can look
// backwards (what came before me?) and forwards (what's nested under
// me?). Must be called from a `context`.
#let headings-around(it) = {
  let all = query(heading)
  let idx = all.position(h => h.location() == it.location())
  (before: all.slice(0, idx), after: all.slice(idx + 1))
}

// Shared look for the "list of headings behind a colored bar" nav
// blocks: the chapter list on the contents page and the sub-heading
// list under each chapter.
//
// Does NOT pull itself up toward whatever precedes it — callers that sit
// directly under a heading's trailing spacing do that themselves with their
// own `v(-12pt)` (see the level-1 show rule and `contents-page`). Baking that
// pull in here bit us once already: `contents-page` used to insert a second
// heading-shaped nav element (the subtitle) between the title and this box,
// and the box's own hard-coded `v(-12pt)` pulled it up by a fixed amount
// regardless of how tall that in-between element actually was — fine for one
// line, overlapping text once the subtitle wrapped to two. A single pull
// applied once, right after the heading, doesn't have that failure mode.
//
// Both the `above`/`below` spacing and the `set text(...)` must sit where
// they do, because this is called from two different ambient text sizes:
// from inside the level-1 heading's `set text(size: 24pt, ...)` scope, and
// from the body at 12pt. Anything left to resolve against the ambient `em`
// silently comes out twice as large in the heading case:
//   - spacing goes on the OUTERMOST element (the one actually in the flow).
//     Putting it on the inner block instead leaves `pad` to take Typst's
//     default `em`-relative block spacing.
//   - the list style is `set` inside the block rather than a `text(...)`
//     wrapper per item, since a wrapper overrides only glyph size/weight,
//     not the context that `em`-relative paragraph leading resolves against.
// Defaults describe the per-chapter box; `contents-page` overrides them to
// give the document-level list more presence. `set par` comes after `set text`
// so `leading`'s `em` resolves against this box's own `size`, not the ambient.
#let overview-box(
  items,
  size: 10.5pt,
  bar: 4pt,
  accent: colors.muted,
  fg: colors.muted,
  inset: 10pt,
  gap: 0pt,
) = if items.len() > 0 {
  block(above: 0pt, below: 16pt, pad(left: 4pt, block(inset: inset, stroke: (left: bar + accent))[
    #set text(size: size, weight: "regular", fill: fg)
    #set par(leading: 0.65em + gap)
    #for h in items [
      #link(h.location())[#h.body] \
    ]
  ]))
}

// A block, not inline content: a heading's back-link is emitted straight
// after whatever preceded the heading, so as inline content it would be
// swallowed into the tail of that paragraph whenever the source didn't
// happen to leave a blank line before the heading. Spacing is explicit
// for the reason given on `overview-box`.
#let back-link(dest, label) = block(above: 12pt, below: 0pt, link(dest)[
  #text(size: 9pt, fill: colors.muted)[← #label]
])

// The contents page: a title over an optional subtitle over a nav block
// listing every chapter. Emitted by `conf`, so a document never writes it
// itself.
//
// The title is drawn twice, for two different purposes that don't share a
// look: an invisible `heading` purely so the page gets a PDF bookmark (which
// is what the site reads to build its sidebar) and carries `contents-label`
// — the level-1 show rule renders nothing for it, since `is-chapter` is
// false — and a plain styled block for what's actually seen, sized to match
// a chapter title without inheriting the show rule's back-link/sub-heading
// logic, none of which applies to this page.
//
// The listing deliberately outweighs the per-chapter boxes: bigger type, a
// heavier bar, more inset and leading. The accent sits on the bar while the
// entries stay `text`-colored — coloring the entries `accent1` too would have
// them read as level-2 headings, which are already that blue.
#let contents-page(title: [Contents], subtitle: none) = {
  [#heading(level: 1, title) #contents-label]
  block(below: 12pt, {
    // `set par` after `set text`, not a `text(...)` wrapper, so `leading`'s
    // `em` resolves against this 24pt scope rather than the 12pt ambient —
    // the same trap `overview-box` documents.
    set text(size: 28pt, weight: "bold", font: (title-font, "Helvetica"))
    set par(leading: 0.3em)
    title
  })
  if subtitle != none {
    block(above: 0pt, below: 6pt, text(size: 14pt, fill: colors.accent1, subtitle))
  }
  context overview-box(
    query(heading).filter(is-chapter),
    size: 13pt,
    bar: 6pt,
    accent: colors.accent1,
    fg: colors.text,
    inset: 13pt,
    gap: 3pt,
  )
}

// ── Document styling ───────────────────────────────────────────────────

// Opens the document with a generated contents page. `title` names that page
// (a string or content, so `[My *Guide*]` works); `subtitle`, if given, sits
// below it in accent1, above the chapter list. `contents: false` drops the
// page entirely, and with it the chapter back-links that point at it.
#let conf(contents: true, title: [Contents], subtitle: none, body) = {
  // `title` doubles as the PDF's metadata title — what a viewer shows in its
  // tab or title bar. Left unset when there's no contents page, so a document
  // that never displays this title isn't stamped with it either. Must precede
  // any content, which is why it leads the block.
  set document(title: if contents { title })

  set page(fill: colors.bg, width: 250pt, height: auto, margin: (x: 12pt, y: 16pt))
  set text(size: 12pt, fill: colors.text, font: "Helvetica")
  set heading(numbering: none)

  // Page numbers are meaningless here (the whole doc is one auto-height
  // page), so outline entries are just an indented link, no leader/number.
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.body()),
  )

  // A chapter title, followed by a nav block listing its own "==" sub-headings.
  // The back-link is suppressed on the first chapter, where the contents
  // listing already sits directly above.
  //
  // The contents heading itself renders as nothing here: `contents-page`
  // draws its title as a plain block instead, so this `heading()` exists
  // solely to carry `contents-label` and hand the page a PDF bookmark
  // (outline entries come from the heading element regardless of what its
  // show rule renders, so an empty result here doesn't lose the bookmark).
  show heading.where(level: 1): it => if not is-chapter(it) {
    none
  } else {
    context {
      let (before, after) = headings-around(it)

      if contents and before.any(is-chapter) {
        back-link(contents-label, "Back to contents")
      }

      let subs = ()
      for h in after {
        if h.level == 1 { break }
        if h.level == 2 { subs.push(h) }
      }

      set text(size: 24pt, weight: "bold")
      block(below: 18pt, it.body)
      // Eats most of that trailing 18pt, so the box sits just under the title
      // with little more than its own inset providing the gap. Only when the
      // box will actually render something — a chapter with no "==" (like
      // "Conclusion") has none, and the pull would otherwise dent the space
      // before its body text for no reason.
      if subs.len() > 0 {
        v(-12pt)
      }
      overview-box(subs)
    }
  }

  // Links back to the enclosing "=" heading, where the nav block above lists
  // this heading's siblings. Suppressed on a chapter's *first* "==", which
  // already sits directly under that block — scoping the check to headings
  // since the parent, not the whole document, so it holds in every chapter
  // rather than only the first one.
  show heading.where(level: 2): it => context {
    let (before, ..) = headings-around(it)
    let back = before.rev()
    let steps = back.position(h => h.level == 1)

    if steps != none and back.slice(0, steps).any(h => h.level == 2) {
      back-link(back.at(steps).location(), "Back to section overview")
    }

    set text(size: 15pt, weight: "bold", fill: colors.accent1)
    block(above: 22pt, below: 10pt, it.body)
  }

  if contents { contents-page(title: title, subtitle: subtitle) }
  body
}

// ── Document API ───────────────────────────────────────────────────────

#let callout(accent: colors.accent1, body) = block(
  fill: colors.box-bg,
  stroke: (left: 4pt + accent),
  inset: 10pt,
  width: 100%,
  radius: 4pt,
  body,
)

#let callout1 = callout.with(accent: colors.accent1)
#let callout2 = callout.with(accent: colors.accent2)
#let callout3 = callout.with(accent: colors.accent3)
#let callout4 = callout.with(accent: colors.accent4)
#let callout5 = callout.with(accent: colors.accent5)
