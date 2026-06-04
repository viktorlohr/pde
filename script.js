fetch('notes.md')
  .then(r => r.text())
  .then(src => {
    // 1. MASKING: Convert math to a temporary tag
    // We use a custom <math-mask> tag that DOMPurify will allow.
    const mathBlocks = [];
    const maskedSrc = src.replace(/\$\$(.*?)\$\$|\$(.*?)\$/gs, (match) => {
      const id = `MATH_BLOCK_${mathBlocks.length}`;
      mathBlocks.push(match);
      return `<math-mask id="${id}"></math-mask>`;
    });

    // 2. PARSING & SANITIZING
    const content = document.getElementById('content');
    content.innerHTML = DOMPurify.sanitize(marked.parse(maskedSrc), {
      ADD_TAGS: ['math-mask'],
      ADD_ATTR: ['id']
    });

    // 3. UNMASKING: Replace the temporary tags with the original LaTeX text
    mathBlocks.forEach((math, index) => {
      const el = content.querySelector(`#MATH_BLOCK_${index}`);
      if (el) {
        el.outerHTML = math;
      }
    });

    // 4. POST-PROCESSING: Callouts
    content.querySelectorAll('blockquote').forEach(bq => {
      const text = bq.innerText;
      if (text.includes('[!NOTE]')) bq.classList.add('callout', 'callout-note');
      else if (text.includes('[!TIP]')) bq.classList.add('callout', 'callout-tip');
      else if (text.includes('[!WARNING]')) bq.classList.add('callout', 'callout-warning');
      else if (text.includes('[!IMPORTANT]')) bq.classList.add('callout', 'callout-important');
      else if (text.includes('[!CAUTION]')) bq.classList.add('callout', 'callout-caution');
      bq.innerHTML = bq.innerHTML.replace(/\[!.*?\]\n?/g, '');
    });

    // 5. POST-PROCESSING: Accordions
    content.querySelectorAll('h2').forEach((h2) => {
      const section = document.createElement('div');
      section.className = 'custom-section';
      const header = document.createElement('div');
      header.className = 'custom-header';
      header.innerHTML = `<span>${h2.innerText}</span><span class="arrow">▼</span>`;
      const wrapper = document.createElement('div');
      wrapper.className = 'content-wrapper';
      const inner = document.createElement('div');
      inner.className = 'content-inner';

      let next = h2.nextElementSibling;
      while (next && next.tagName !== 'H2') {
        inner.appendChild(next);
        next = h2.nextElementSibling;
      }
      wrapper.appendChild(inner);
      section.append(header, wrapper);
      h2.replaceWith(section);

      header.onclick = () => {
        section.classList.toggle('active');
        wrapper.style.height = section.classList.contains('active') ? inner.scrollHeight + 'px' : '0px';
      };
    });

    // 6. RENDER MATH: Final pass
    renderMathInElement(content, {
      delimiters: [
        { left: '$$', right: '$$', display: true },
        { left: '$', right: '$', display: false }
      ],
      throwOnError: false
    });
  });

// Navigation Button Logic
const navBtn = document.getElementById('prev-nav');
window.addEventListener('scroll', () => {
  const sections = document.querySelectorAll('.custom-section');
  let currentSection = null;
  sections.forEach(s => {
    const rect = s.getBoundingClientRect();
    if (rect.top <= 100 && rect.bottom > 100) currentSection = s;
  });
  navBtn.style.display = (currentSection && currentSection.classList.contains('active')) ? 'block' : 'none';
  if (navBtn.style.display === 'block') {
    navBtn.onclick = () => currentSection.scrollIntoView({ behavior: 'smooth' });
  }
}); 