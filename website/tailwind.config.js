/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        chakra: ["var(--font-chakra-petch)"],
        inter: ["var(--font-inter)"],
      },
      colors: {
        cyber: {
          blue: "#00ff9f",
          purple: "#6e0cff",
          pink: "#ff00ff",
        },
      },
      animation: {
        glow: "glow 2s ease-in-out infinite alternate",
        float: "float 6s ease-in-out infinite",
        "pulse-slow": "pulse 4s cubic-bezier(0.4, 0, 0.6, 1) infinite",
      },
      keyframes: {
        glow: {
          "0%": { textShadow: "0 0 10px #00ff9f, 0 0 20px #00ff9f" },
          "100%": { textShadow: "0 0 20px #00ff9f, 0 0 30px #00ff9f" },
        },
      },
    },
  },
  plugins: [],
};
