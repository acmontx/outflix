import "bootstrap";
//import '../../assets/stylesheets/application';

// Read more logic on show page
const text = document.querySelector('.text-overflow');
const btn = document.querySelector('.btn-overflow');
const textHeight = text.scrollHeight;

if (textHeight > 100) {
  btn.classList.add('less');
  btn.style.display = 'block';
}

btn.addEventListener('click', (event) => {
  console.log('here');
  event.preventDefault();
  if (btn.classList.contains('less')) {
    btn.classList.remove('less');
    btn.classList.add('more');
    text.style.height = `${textHeight}px`;
    text.style.overflow = 'visible';
    btn.innerText = 'Read less';
  } else {
    btn.classList.add('less');
    btn.classList.remove('more');
    text.style.height = '100px';
    text.style.overflow = 'hidden';
    btn.innerText = 'Read more...';
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }
});
