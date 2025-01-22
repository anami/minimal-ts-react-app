# Minimal TS+React App

This project is the most basic docker based React application using Typescript, Tailwind and Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh

## File structure

- `Dockerfile`: Resides in the root directory. This is used to build the Docker image.
- `docker-compose.yml`: Also resides in the root. It defines the service, ports, and volume mounting for live development.
- `package.json`: Contains dependencies and scripts for your React app.
- `tailwind.config.cjs`: Tailwind CSS configuration file to define content paths and theme settings.
- `postcss.config.cjs`: Configures PostCSS to use Tailwind CSS.
- `tsconfig.json`: TypeScript configuration file.
- `vite.config.ts`: Vite's configuration file for customizing the build and development settings.
- `public/`: Contains static files like index.html and favicon.ico.
- `src/`: Contains your React components, CSS, and TypeScript files:
- `App.tsx`: Main app component.
- `index.css`: Global styles (including Tailwind imports).
- `main.tsx`: Entry point for the app.


## Expanding the ESLint configuration

If you are developing a production application, we recommend updating the configuration to enable type aware lint rules:

- Configure the top-level `parserOptions` property like this:

```js
export default tseslint.config({
  languageOptions: {
    // other options...
    parserOptions: {
      project: ['./tsconfig.node.json', './tsconfig.app.json'],
      tsconfigRootDir: import.meta.dirname,
    },
  },
})
```

- Replace `tseslint.configs.recommended` to `tseslint.configs.recommendedTypeChecked` or `tseslint.configs.strictTypeChecked`
- Optionally add `...tseslint.configs.stylisticTypeChecked`
- Install [eslint-plugin-react](https://github.com/jsx-eslint/eslint-plugin-react) and update the config:

```js
// eslint.config.js
import react from 'eslint-plugin-react'

export default tseslint.config({
  // Set the react version
  settings: { react: { version: '18.3' } },
  plugins: {
    // Add the react plugin
    react,
  },
  rules: {
    // other rules...
    // Enable its recommended rules
    ...react.configs.recommended.rules,
    ...react.configs['jsx-runtime'].rules,
  },
})
```
