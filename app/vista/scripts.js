document.addEventListener('DOMContentLoaded', function() {
    let cart = [];
    const cartTable = document.getElementById('cartTable');
    const totalAmount = document.getElementById('totalAmount');
    const modal = document.getElementById('modal');
    const modalTable = document.getElementById('modalTable');
    const modalTotal = document.getElementById('modalTotal');
    const paymentMethodText = document.getElementById('paymentMethodText');

    document.querySelectorAll('.add-to-cart').forEach(button => {
        button.addEventListener('click', function() {
            const row = this.parentElement.parentElement;
            const product = {
                id: row.dataset.id,
                code: row.dataset.code,
                name: row.dataset.name,
                category: row.dataset.category,
                quantity: row.dataset.quantity,
                price: parseFloat(row.dataset.price),
                qty: 1
            };
            addToCart(product);
        });
    });

    function addToCart(product) {
        const existingProductIndex = cart.findIndex(p => p.id === product.id);
        if (existingProductIndex >= 0) {
            cart[existingProductIndex].qty += 1;
        } else {
            cart.push(product);
        }
        renderCart();
    }

    function renderCart() {
        cartTable.innerHTML = '';
        let total = 0;
        cart.forEach(product => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${product.code}</td>
                <td>${product.name}</td>
                <td>${product.category}</td>
                <td>${product.quantity}</td>
                <td><input type="number" value="${product.qty}" min="1" class="qty-input" data-id="${product.id}"></td>
                <td>${(product.price * product.qty).toFixed(2)}</td>
                <td><button class="remove-item" data-id="${product.id}">Quitar</button></td>
            `;
            cartTable.appendChild(row);
            total += product.price * product.qty;
        });
        totalAmount.textContent = total.toFixed(2);

        document.querySelectorAll('.remove-item').forEach(button => {
            button.addEventListener('click', function() {
                const id = this.dataset.id;
                if (confirm("¿Estás seguro que quieres quitar este producto?")) {
                    cart = cart.filter(product => product.id !== id);
                    renderCart();
                }
            });
        });

        document.querySelectorAll('.qty-input').forEach(input => {
            input.addEventListener('change', function() {
                const id = this.dataset.id;
                const qty = parseInt(this.value, 10);
                const product = cart.find(p => p.id === id);
                if (product) {
                    product.qty = qty;
                    renderCart();
                }
            });
        });
    }

    document.getElementById('cobrarBtn').addEventListener('click', function() {
        renderModal();
        modal.style.display = 'block';
    });

    function renderModal() {
        modalTable.innerHTML = '';
        let total = 0;
        cart.forEach(product => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${product.name}</td>
                <td>${product.qty}</td>
                <td>${product.price.toFixed(2)}</td>
                <td>${(product.price * product.qty).toFixed(2)}</td>
            `;
            modalTable.appendChild(row);
            total += product.price * product.qty;
        });
        modalTotal.textContent = total.toFixed(2);
        paymentMethodText.textContent = `Medio de pago: ${document.getElementById('paymentMethod').value}`;
    }

    document.getElementById('registerBtn').addEventListener('click', function() {
        alert('Compra registrada');
        closeModal();
    });

    document.getElementById('registerPrintBtn').addEventListener('click', function() {
        alert('Compra registrada e imprimida');
        closeModal();
    });

    document.getElementById('cancelBtn').addEventListener('click', function() {
        closeModal();
    });

    document.getElementById('closeModalBtn').addEventListener('click', function() {
        closeModal();
    });

    function closeModal() {
        modal.style.display = 'none';
    }

    window.onclick = function(event) {
        if (event.target === modal) {
            closeModal();
        }
    }
});
