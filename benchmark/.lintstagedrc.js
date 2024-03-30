export default {
  "*.{js,jsx,ts,tsx}": ["biome check --diagnostic-level=warn", "prettier -c"],
  "*.{json,yaml}": ["spectral lint", "prettier -c"],
  "*.md": ["prettier -c"],
};
