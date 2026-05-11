

// Mettre la bonné année dans le footer
document.addEventListener('DOMContentLoaded', () => {
  const yearSpan = document.getElementById('current-year');
  const currentYear = new Date().getFullYear();
  yearSpan.textContent = currentYear;
});

// Animated typing effect
document.addEventListener('DOMContentLoaded', function () {
  const rotatingTexts = [
    'Jean Julio',
    'Alternant',
    'En reconversion',
    '23 ans',
    'Passionné de développement',
    'Curieux et motivé'
  ];
  const animHead = document.getElementById('anim-head');
  let currentIndex = 0;

  function updateText() {
    animHead.textContent = rotatingTexts[currentIndex];
    animHead.classList.remove('typing-text');
    void animHead.offsetWidth; // Trigger reflow
    animHead.classList.add('typing-text');
    currentIndex = (currentIndex + 1) % rotatingTexts.length;
    setTimeout(updateText, 3000); // Change every 3 seconds
  }

  updateText();
});

document.addEventListener('DOMContentLoaded', function () {
  const input = document.querySelector('input');
  const greetings = document.querySelectorAll('.greeting');
  const savedName = localStorage.getItem('username');
  const isHomePage = document.body.classList.contains('home');

  if (input) {
    input.addEventListener('keyup', function () {
      const name = input.value.trim();

      localStorage.setItem('username', name);

      greetings.forEach(function (greeting) {
        if (name) {
          greeting.textContent = isHomePage
            ? `Hello, ${name}`
            : name;
        } else {
          greeting.textContent = isHomePage
            ? 'Hello, whoever you are'
            : '';
        }
      });
    });
  }

  if (savedName && greetings.length > 0) {
    greetings.forEach(function (greeting) {
      greeting.textContent = isHomePage
        ? `Hello, ${savedName}`
        : savedName;
    });
  }
});