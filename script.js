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

        if (section.classList.contains('active')) {
          // 1. Get the real height of the inner container
          // We add a small buffer if needed, though scrollHeight is usually precise
          const height = inner.scrollHeight;

          // 2. Set the height dynamically
          wrapper.style.height = height + 'px';

          // 3. Optional: Set back to 'auto' after transition ends
          // This allows the section to stay responsive if the window resizes
          setTimeout(() => {
            if (section.classList.contains('active')) {
              wrapper.style.height = 'auto';
            }
          }, 300); // Wait for the 0.3s CSS transition to finish
        } else {
          // Force height back to specific value before animating to 0
          wrapper.style.height = inner.scrollHeight + 'px';

          // Force a reflow to ensure the transition triggers
          wrapper.offsetHeight;

          wrapper.style.height = '0px';
        }
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
document.getElementById('prev-nav').addEventListener('click', () => {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
});

const navBtn = document.getElementById('prev-nav');

window.addEventListener('scroll', () => {
  // Show button after scrolling down 300px
  if (window.scrollY > 200) {
    navBtn.classList.add('visible');
  } else {
    navBtn.classList.remove('visible');
  }
});

// Existing click event for smooth scroll
navBtn.addEventListener('click', () => {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
});