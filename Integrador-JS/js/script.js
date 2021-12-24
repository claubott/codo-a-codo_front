// ---------------------------------- Bootstrap ScrollSpy ----------------------------------
var scrollSpy = new bootstrap.ScrollSpy(document.body, {
    target: '#myNavbar',
    offset: 101,
  });

// ---------------------------------- Formulario comprar tickets ----------------------------------
const clearBtn = document.getElementById('clear');
const summaryBtn = document.getElementById('summary');
const totalSpan = document.getElementById('total');
const priceAlert = document.getElementById('price-alert');
var price = 200;
var discount = 1;

clearBtn.addEventListener('click', () => {
  totalSpan.textContent = "";
});

summaryBtn.addEventListener('click', updateTotal);

function updateTotal() {
  const quantity = document.getElementById('quantity');
  const category = document.getElementById('category');
  var finalPrice = 0;

  switch (category.value) {
    case "1":
      discount = 0.2;
      break;
    case "2":
      discount = 0.5;
      break;
    case "3":
      discount = 0.85;
      break;
    case "4":
      discount = 1;
      break;
    default:
      discount = 0;
      break;
  }

  finalPrice = price * quantity.value * discount;
  if (finalPrice > 0) {
    totalSpan.textContent = finalPrice;
    priceAlert.style.display = "none";
  } else {
    priceAlert.style.display = "block";
  }
}
