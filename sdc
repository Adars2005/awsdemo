Yes 👍 **short + exam-ready**. Follow these exact steps.

Your manual uses **Vite** for Exp 1 and specifies React components/props for Exp 2 and Hooks for Exp 3. 

# EXP 1 — JSX + Virtual DOM

### Step 1: Create

```bash
npm create vite@latest jsx-demo -- --template react
```

### Step 2:

```bash
cd jsx-demo
npm install
```

### Step 3:

```bash
npm run dev
```

### Step 4: Open VS Code

```bash
code .
```

Open:

```text
src/App.jsx
```

### Step 5: Paste code

```jsx
import { useState } from "react";

function App() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <h1>JSX and Virtual DOM Demo</h1>
      <p>Count: {count}</p>

      <button onClick={() => setCount(count + 1)}>
        Increment
      </button>
    </div>
  );
}

export default App;
```

### Step 6: Output

```text
JSX and Virtual DOM Demo
Count: 0
[Increment]
```

Click button → `Count: 1`, `2`, `3`...

**DONE Exp 1.** 

---

# EXP 2 — Product Listing + Props

## Step 1: Create

```bash
npm create vite@latest product-list -- --template react
```

## Step 2:

```bash
cd product-list
npm install
```

## Step 3:

```bash
npm run dev
```

## Step 4:

```bash
code .
```

---

## Step 5: Create `ProductCard.jsx`

Inside `src`, create:

```text
ProductCard.jsx
```

Paste:

```jsx
function ProductCard({ name, price, category }) {
  return (
    <div>
      <h3>{name}</h3>
      <p>Price: ₹{price}</p>
      <p>Category: {category}</p>

      <button onClick={() => alert(name + " Purchased")}>
        Buy Now
      </button>
    </div>
  );
}

export default ProductCard;
```

---

## Step 6: `App.jsx`

```jsx
import ProductCard from "./ProductCard";

function App() {
  const products = [
    { id: 1, name: "Laptop", price: 50000, category: "Electronics" },
    { id: 2, name: "Mobile", price: 20000, category: "Electronics" },
    { id: 3, name: "Shoes", price: 1500, category: "Fashion" }
  ];

  return (
    <div>
      <h1>Product Listing</h1>

      {products.map((product) => (
        <ProductCard
          key={product.id}
          name={product.name}
          price={product.price}
          category={product.category}
        />
      ))}
    </div>
  );
}

export default App;
```

## Step 7: Output

```text
Product Listing

Laptop
Price: ₹50000
Category: Electronics
[Buy Now]

Mobile
Price: ₹20000
Category: Electronics
[Buy Now]

Shoes
Price: ₹1500
Category: Fashion
[Buy Now]
```

Click **Buy Now** → `Laptop Purchased`.

The manual specifically requires products to be passed through props and displayed using `map()`. 

**DONE Exp 2.**

---

# EXP 3 — Inventory + React Hooks

This one needs:

```text
useState
useEffect
useMemo
useRef
useContext
```

plus **Add, Search, Total, Theme**. 

## Step 1: Create

```bash
npm create vite@latest inventory-app -- --template react
```

## Step 2:

```bash
cd inventory-app
npm install
```

## Step 3:

```bash
npm run dev
```

## Step 4:

```bash
code .
```

Open `src/App.jsx`.

---

## Step 5: Paste this complete code

```jsx
import {
  useState,
  useEffect,
  useMemo,
  useRef,
  useContext,
  createContext
} from "react";

const ThemeContext = createContext();

function App() {
  const [products, setProducts] = useState([
    { name: "Pen", qty: 10, price: 20 },
    { name: "Book", qty: 5, price: 100 }
  ]);

  const [search, setSearch] = useState("");
  const [dark, setDark] = useState(false);

  const [name, setName] = useState("");
  const [qty, setQty] = useState("");
  const [price, setPrice] = useState("");

  const inputRef = useRef();

  useEffect(() => {
    document.title = "Inventory Management";
  }, []);

  const totalValue = useMemo(() => {
    return products.reduce(
      (sum, item) => sum + item.qty * item.price,
      0
    );
  }, [products]);

  const filteredProducts = products.filter((p) =>
    p.name.toLowerCase().includes(search.toLowerCase())
  );

  const addProduct = () => {
    if (!name || !qty || !price) {
      alert("Enter all details");
      return;
    }

    setProducts([
      ...products,
      {
        name: name,
        qty: Number(qty),
        price: Number(price)
      }
    ]);

    setName("");
    setQty("");
    setPrice("");

    inputRef.current.focus();
  };

  return (
    <ThemeContext.Provider value={dark}>
      <Inventory
        products={filteredProducts}
        search={search}
        setSearch={setSearch}
        dark={dark}
        setDark={setDark}
        totalValue={totalValue}
        name={name}
        setName={setName}
        qty={qty}
        setQty={setQty}
        price={price}
        setPrice={setPrice}
        addProduct={addProduct}
        inputRef={inputRef}
      />
    </ThemeContext.Provider>
  );
}

function Inventory(props) {
  const dark = useContext(ThemeContext);

  return (
    <div
      style={{
        backgroundColor: dark ? "#222" : "#fff",
        color: dark ? "#fff" : "#000",
        minHeight: "100vh",
        padding: "20px"
      }}
    >
      <h2>Inventory Management</h2>

      <button onClick={() => props.setDark(!props.dark)}>
        Toggle Theme
      </button>

      <br /><br />

      <input
        ref={props.inputRef}
        placeholder="Product Name"
        value={props.name}
        onChange={(e) => props.setName(e.target.value)}
      />

      <input
        type="number"
        placeholder="Quantity"
        value={props.qty}
        onChange={(e) => props.setQty(e.target.value)}
      />

      <input
        type="number"
        placeholder="Price"
        value={props.price}
        onChange={(e) => props.setPrice(e.target.value)}
      />

      <button onClick={props.addProduct}>
        Add Product
      </button>

      <br /><br />

      <input
        placeholder="Search Product"
        value={props.search}
        onChange={(e) => props.setSearch(e.target.value)}
      />

      <ul>
        {props.products.map((p, index) => (
          <li key={index}>
            {p.name} - Qty: {p.qty} - ₹{p.price}
          </li>
        ))}
      </ul>

      <h3>Total Value: ₹{props.totalValue}</h3>
    </div>
  );
}

export default App;
```

---

# Step 6: Test

Initial:

```text
Inventory Management

[Toggle Theme]

Product Name  Quantity  Price [Add Product]

Search Product

• Pen - Qty: 10 - ₹20
• Book - Qty: 5 - ₹100

Total Value: ₹700
```

The manual's sample output also uses Pen/Book and total **₹700**. 

### Test Add

Enter:

```text
Pencil
10
5
```

Click:

```text
Add Product
```

Total becomes:

```text
₹750
```

### Test Search

Search:

```text
Pen
```

Only Pen appears.

### Test Theme

Click:

```text
Toggle Theme
```

→ Dark mode.

Click again → Light mode.

---

# 🔥 FINAL EXAM COMMANDS TO MEMORIZE

### Exp 1

```bash
npm create vite@latest jsx-demo -- --template react
cd jsx-demo
npm install
npm run dev
```

### Exp 2

```bash
npm create vite@latest product-list -- --template react
cd product-list
npm install
npm run dev
```

### Exp 3

```bash
npm create vite@latest inventory-app -- --template react
cd inventory-app
npm install
npm run dev
```

### If they ask how to open VS Code:

```bash
code .
```

### If server stops:

```bash
npm run dev
```

**Most important:** For Exp 1 remember `useState`; Exp 2 remember `props + map()`; Exp 3 remember the **5 hooks + Add/Search/Total/Theme**.
