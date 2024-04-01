export default {
  "*.{js,jsx,ts,tsx}": "biome check --diagnostic-level=warn",
  "*.{json,yaml}": "spectral lint --ignore-unknown-format",
  "*.{js,jsx,ts,tsx,json,yaml,md}": "prettier -c",
};
