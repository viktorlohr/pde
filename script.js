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

    // 5. POST-PROCESSING: Accordions & TOC
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

      // Collect elements and identify H3s
      const subHeadings = [];
      let next = h2.nextElementSibling;

      while (next && next.tagName !== 'H2') {
        if (next.tagName === 'H3') {
          subHeadings.push(next);
        }
        inner.appendChild(next);
        next = h2.nextElementSibling;
      }

      // If we found H3s, build the TOC list and prepend to the 'inner' container
      if (subHeadings.length > 0) {
        const tocList = document.createElement('ul');
        tocList.className = 'toc-list';
        subHeadings.forEach(h3 => {
          if (!h3.id) h3.id = h3.textContent.toLowerCase().replace(/\s+/g, '-');
          const li = document.createElement('li');
          li.innerHTML = `<a href="#${h3.id}">${h3.textContent}</a>`;
          tocList.appendChild(li);
        });

        inner.prepend(tocList);
      }

      wrapper.appendChild(inner);
      section.append(header, wrapper);
      h2.replaceWith(section);

      // RESTORED: Click logic with height animation
      header.onclick = () => {
        section.classList.toggle('active');

        if (section.classList.contains('active')) {
          const height = inner.scrollHeight;
          wrapper.style.height = height + 'px';

          setTimeout(() => {
            if (section.classList.contains('active')) {
              wrapper.style.height = 'auto';
            }
          }, 300);
        } else {
          wrapper.style.height = inner.scrollHeight + 'px';
          wrapper.offsetHeight; // Force reflow
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
// const navBtn = document.getElementById('prev-nav');

navBtn.addEventListener('click', () => {
  // 1. Get all H2 headers and filter for those above the current scroll position
  const headers = Array.from(document.querySelectorAll('h2'));
  const currentScroll = window.scrollY;

  // Find the header closest to the current position that is above us
  const targetHeader = headers
    .reverse() // Look from bottom to top
    .find(h2 => h2.getBoundingClientRect().top + window.scrollY < currentScroll - 10);

  // 2. Decide where to jump
  if (targetHeader) {
    // Jump to the header
    window.scrollTo({
      top: targetHeader.offsetTop,
      behavior: 'smooth'
    });
  } else {
    // No more headers above? Jump to the very top
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  }
});