Here's a **step-by-step guide** to set up **Node.js v12.22.x** and **Angular CLI 9.1.9** using `nvm` (Node Version Manager) on both:

- **MacBook Pro (Intel, macOS)**
- **Ubuntu 20.04 LTS**

This setup ensures compatibility with Angular 9.1.9, which officially supports **Node.js versions 12.20 – 14.x**.

---

# 🍎 MacBook Pro (macOS Intel - Darwin x86_64)

## ✅ Step 1: Install `nvm` (if not already installed)

Open Terminal and run:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

Then restart your terminal or source the changes:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

Verify installation:

```bash
nvm --version
```

---

## ✅ Step 2: Install Node.js v12.22.0

```bash
nvm install 12.22.0
```

Set it as default:

```bash
nvm alias default 12.22.0
```

Check version:

```bash
node -v   # Should output v12.22.0
npm -v    # Should be around 6.14.17
```

---

## ✅ Step 3: Install Angular CLI v9.1.9

```bash
npm install -g @angular/cli@9.1.9
```

Verify:

```bash
ng version
```

You should see Angular CLI: `9.1.9`.

---

## ✅ Step 4: Create a New Angular 9 Project (Optional)

```bash
ng new my-angular9-app
cd my-angular9-app
ng serve
```

Visit [http://localhost:4200](http://localhost:4200) in your browser.

---

# 🐧 Ubuntu 20.04 LTS

## ✅ Step 1: Install `nvm` (if not already installed)

Open Terminal and run:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

Restart terminal or source:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

Verify:

```bash
nvm --version
```

---

## ✅ Step 2: Install Node.js v12.22.0

```bash
nvm install 12.22.0
```

Set default:

```bash
nvm alias default 12.22.0
```

Check:

```bash
node -v   # v12.22.0
npm -v    # ~6.14.17
```

---

## ✅ Step 3: Install Angular CLI v9.1.9

```bash
npm install -g @angular/cli@9.1.9
```

Verify:

```bash
ng version
```

Should show Angular CLI: `9.1.9`.

---

## ✅ Step 4: Create a New Angular 9 Project (Optional)

```bash
ng new my-angular9-app
cd my-angular9-app
ng serve
```

Access at [http://localhost:4200](http://localhost:4200).

---

# ✅ Compatibility Summary

| Component           | Required Version      |
| ------------------- | --------------------- |
| Angular CLI         | `@angular/cli@9.1.9`  |
| Angular Core        | `@angular/core@9.1.9` |
| Node.js             | `v12.20.x – v14.x`    |
| Recommended Node.js | `v12.22.0`            |
| npm                 | `v6.x`                |

> ⚠️ Avoid newer Node.js versions (like v16+, v18+, v20+) with Angular 9 — they are **not compatible** without polyfills and custom webpack configurations.

---

# 📄 Markdown File Templates

### 📁 For macOS: `setup-angular9-macos.md`

````markdown
# Setup Angular 9.1.9 on macOS (Intel)

## Step 1: Install nvm

Run this command:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```
````

Restart terminal or source:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

## Step 2: Install Node.js v12.22.0

```bash
nvm install 12.22.0
nvm alias default 12.22.0
```

## Step 3: Install Angular CLI v9.1.9

```bash
npm install -g @angular/cli@9.1.9
```

## Step 4: Verify Installation

```bash
node -v
npm -v
ng version
```

````

---

### 📁 For Ubuntu: `setup-angular9-ubuntu.md`

```markdown
# Setup Angular 9.1.9 on Ubuntu 20.04

## Step 1: Install nvm
Run this command:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
````

Restart terminal or source:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

## Step 2: Install Node.js v12.22.0

```bash
nvm install 12.22.0
nvm alias default 12.22.0
```

## Step 3: Install Angular CLI v9.1.9

```bash
npm install -g @angular/cli@9.1.9
```

## Step 4: Verify Installation

```bash
node -v
npm -v
ng version
```

```

---

Let me know if you'd like instructions for newer Angular versions or Docker-based setups!
```
