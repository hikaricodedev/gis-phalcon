const toggleSidebar = document.getElementById("toggleSidebar");
const sidebar = document.querySelector(".sidebar");
const darkModeToggle = document.getElementById("darkModeToggle");

toggleSidebar.addEventListener("click", () => {
  sidebar.classList.toggle("collapsed");
});

darkModeToggle.addEventListener("change", () => {
  document.body.classList.toggle("dark", darkModeToggle.checked);
});
