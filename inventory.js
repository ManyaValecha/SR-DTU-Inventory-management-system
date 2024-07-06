
const inventory = [
    { id: 1, name: 'Arduino Uno', quantity: 10, location: 'Cabinet A' },
    { id: 2, name: 'Raspberry Pi', quantity: 5, location: 'Cabinet B' },
    { id: 3, name: 'Soldering Iron', quantity: 8, location: 'Cabinet C' }
];


function generateId() {
    return inventory.length ? Math.max(...inventory.map(item => item.id)) + 1 : 1;
}


function renderInventory() {
    const itemList = document.getElementById('items');
    itemList.innerHTML = '';
    inventory.forEach(item => {
        const li = document.createElement('li');
        li.innerHTML = `
            ${item.name} - Quantity: ${item.quantity} - Location: ${item.location}
            <button onclick="editItem(${item.id})">Edit</button>
            <button onclick="deleteItem(${item.id})">Delete</button>
        `;
        itemList.appendChild(li);
    });
}


function addItem(event) {
    event.preventDefault();
    const name = document.getElementById('name').value;
    const quantity = document.getElementById('quantity').value;
    const location = document.getElementById('location').value;

    if (name && quantity && location) {
        const newItem = {
            id: generateId(),
            name,
            quantity: parseInt(quantity),
            location
        };
        inventory.push(newItem);
        renderInventory();
        document.getElementById('addItemForm').reset();
    } else {
        alert('Please fill in all fields');
    }
}


function editItem(id) {
    const item = inventory.find(item => item.id === id);
    if (item) {
        document.getElementById('editId').value = item.id;
        document.getElementById('editName').value = item.name;
        document.getElementById('editQuantity').value = item.quantity;
        document.getElementById('editLocation').value = item.location;
        document.getElementById('editItemForm').style.display = 'block';
    }
}

function updateItem(event) {
    event.preventDefault();
    const id = parseInt(document.getElementById('editId').value);
    const name = document.getElementById('editName').value;
    const quantity = document.getElementById('editQuantity').value;
    const location = document.getElementById('editLocation').value;

    const item = inventory.find(item => item.id === id);
    if (item) {
        item.name = name;
        item.quantity = parseInt(quantity);
        item.location = location;
        renderInventory();
        document.getElementById('editItemForm').reset();
        document.getElementById('editItemForm').style.display = 'none';
    }
}

function deleteItem(id) {
    const itemIndex = inventory.findIndex(item => item.id === id);
    if (itemIndex > -1) {
        inventory.splice(itemIndex, 1);
        renderInventory();
    }
}


document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('addItemForm').addEventListener('submit', addItem);
    document.getElementById('editItemForm').addEventListener('submit', updateItem);
    renderInventory();
});
