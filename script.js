fetch('notes.md')
  .then(r => r.text())
  .then(src => {
    const content = document.getElementById('content');
    content.innerHTML = DOMPurify.sanitize(marked.parse(src));

    const h1 = content.querySelector('h1');
    if (h1) { document.getElementById('page-title').innerText = h1.innerText; h1.remove(); }

    // Custom Accordion Creation
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

    renderMathInElement(content, { delimiters: [{ left: '$$', right: '$$', display: true }, { left: '$', right: '$', display: false }], throwOnError: false });
  });

const navBtn = document.getElementById('prev-nav');
window.addEventListener('scroll', () => {
  const sections = document.querySelectorAll('.custom-section');
  let currentSection = null;
  sections.forEach(s => {
    const rect = s.getBoundingClientRect();
    if (rect.top <= 100 && rect.bottom > 100) currentSection = s;
  });

  if (currentSection && currentSection.classList.contains('active')) {
    navBtn.style.display = 'block';
    navBtn.onclick = () => currentSection.scrollIntoView({ behavior: 'smooth' });
  } else {
    navBtn.style.display = 'none';
  }
});