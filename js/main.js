// Odómetro animado
const target = 1800;
const el = document.getElementById('odo-km');
let current = 0;
const step = Math.ceil(target / 80);
const timer = setInterval(() => {
  if (!el) return;
  current = Math.min(current + step, target);
  el.textContent = current.toLocaleString('es-AR');
  if (current >= target) clearInterval(timer);
}, 18);

// Tabs itinerarios
function switchTab(id) {
  document.querySelectorAll('.itinerario').forEach(el => el.classList.remove('active'));
  document.querySelectorAll('.tab-btn').forEach(el => el.classList.remove('active'));
  document.getElementById(id).classList.add('active');
  event.target.classList.add('active');
}

// Checklist
function toggleChk(el) {
  el.classList.toggle('checked');
}
