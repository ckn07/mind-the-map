const hideSolo = () => {
  const ct = document.getElementById("challenges-tab");
  const solo = document.getElementById('solo');
  ct.addEventListener("click", (event) => {
    solo.classList.remove('show');
});
}

export { hideSolo };
