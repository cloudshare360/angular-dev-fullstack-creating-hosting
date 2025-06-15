To **create a new Angular app**, follow these steps:

---

## ✅ Step-by-Step Guide to Create an Angular App

### 🔹 1. **Install Angular CLI (if not already installed)**

Make sure you have Node.js and npm installed first. You can check with:

```bash
node -v
npm -v
```

If not installed, download [Node.js](https://nodejs.org/) (comes with npm).

Then install the **Angular CLI** globally:

```bash
npm install -g @angular/cli
```

ng config --global analytics false
---

### 🔹 2. **Create a New Angular Application**

Run this command to generate a new Angular project:

```bash
ng new buy-and-sell
```

Replace `my-angular-app` with your desired app name.

You'll be asked a few setup questions:

```
? Would you like to add Angular routing? (y/N)  
? Which stylesheet format would you like to use? (Use arrow keys)
❯ CSS
  SCSS   [ https://sass-lang.com/documentation/syntax#scss                ]
  SASS   [ https://sass-lang.com/documentation/syntax#the-indented-syntax ]
  LESS   [ https://lesscss.org/                                         ]
```

Choose options based on your preferences (e.g., `CSS` or `SCSS`).

---

### 🔹 3. **Navigate into the Project Folder**

```bash
cd my-angular-app
```

---

### 🔹 4. **Run the Development Server**

```bash
ng serve
```

By default, the app will run at:

```
http://localhost:4200
```

Open this URL in your browser to see the Angular welcome page.

---

## 🧪 Optional: Skip Prompt for Analytics (Prevent "share anonymous usage" question)

If you want to skip the analytics prompt during setup:

```bash
ng config --global analytics false
```

Or create the app with:

```bash
NG_CLI_ANALYTICS=disabled ng new my-angular-app
```

---

## 📁 Project Structure Overview

After creation, your folder structure will look like this:

```
my-angular-app/
├── e2e/
├── src/
│   ├── app/
│   ├── assets/
│   ├── environments/
│   ├── index.html
│   └── main.ts
├── angular.json
├── package.json
├── tsconfig.json
└── README.md
```

- `src/app/` — Contains your components and logic.
- `angular.json` — Configuration for build, serve, etc.
- `package.json` — Lists dependencies and scripts.

---

## 🚀 Next Steps

- Generate components:
  ```bash
  ng generate component my-component
  ```
- Build for production:
  ```bash
  ng build
  ```
- Run tests:
  ```bash
  ng test
  ```

---

Let me know if you want to:
- Use **Vite instead of Webpack** (for faster dev server)
- Integrate with **Tailwind CSS**
- Add **routing**, **lazy loading**, or **standalone components**
- Create a **full-stack app** with backend integration

I’ll guide you through it!