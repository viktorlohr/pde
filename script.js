fetch('notes.md')
  .then(r => r.text())
  .then(src => {
    // Register extension with 'raw' property required by marked
    marked.use({
      extensions: [{
        name: 'callout',
        level: 'block',
        start(s) { return s.indexOf('> [!'); },
        tokenizer(s) {
          const match = /^> ?\[!(NOTE|TIP|CAUTION|IMPORTANT|WARNING)\]\n((?:> ?.*\n?)*)/.exec(s);
          if (match) {
            return {
              type: 'callout',
              raw: match[0], // IMPORTANT: marked needs this to track the token
              style: match[1],
              text: match[2].replace(/^> ?/gm, '')
            };
          }
        },
        renderer(t) {
          return `<div class="callout callout-${t.style.toLowerCase()}">${marked.parse(t.text)}</div>`;
        }
      }]
    });

    const content = document.getElementById('content');
    content.innerHTML = DOMPurify.sanitize(marked.parse(src));

    // Handle Title
    const h1 = content.querySelector('h1');
    if (h1) { document.getElementById('page-title').innerText = h1.innerText; h1.remove(); }

    // Create Accordion
    content.querySelectorAll('h2').forEach((h2) => {
      const d = document.createElement('details');
      const s = document.createElement('summary');
      const w = document.createElement('div');
      s.innerHTML = `<span class="summary-title">${h2.outerHTML}</span><span class="summary-arrow">▼</span>`;
      let next = h2.nextElementSibling;
      while (next && next.tagName !== 'H2') {
        w.appendChild(next);
        next = h2.nextElementSibling;
      }
      d.append(s, w);
      h2.replaceWith(d);
    });

    // // Build TOC
    // const headers = content.querySelectorAll('h2, h3');
    // if (headers.length > 0) {
    //   const toc = document.getElementById('toc');
    //   toc.innerHTML = '<h2>Contents</h2><ul></ul>';
    //   const ul = toc.querySelector('ul');
    //   headers.forEach((h, i) => {
    //     h.id = 'h-' + i;
    //     const li = document.createElement('li');
    //     li.style.marginLeft = (h.tagName === 'H3' ? '40px' : '0px');
    //     li.innerHTML = `<a href="#h-${i}">${h.innerText}</a>`;
    //     li.querySelector('a').onclick = () => { const d = h.closest('details'); if (d) d.open = true; };
    //     ul.appendChild(li);
    //   });
    // }

    renderMathInElement(content, { delimiters: [{ left: '$$', right: '$$', display: true }, { left: '$', right: '$', display: false }], throwOnError: false });
  });