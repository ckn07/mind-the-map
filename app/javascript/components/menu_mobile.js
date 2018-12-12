let nav = true;

function burger(){
  var burger = document.getElementById('burger');
  var links = document.getElementById('links');
  burger.style.padding = '16px 16px 200vw 200vw';
  links.style.display = 'flex';
}

function quit(){
  var burger = document.getElementById('burger');
  var links = document.getElementById('links');
  burger.style.padding = '16px 16px 32px 32px';
  links.style.display = 'none';
}
if (document.getElementById('burger')){
  document.getElementById('burger').addEventListener('click', (event) => {
    nav ? burger(event.event) : quit(event.event);
    nav = !nav;
  })
}
