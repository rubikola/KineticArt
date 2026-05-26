/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        dark: { DEFAULT: '#0a0a0f', surface: '#12121a', elevated: '#1a1a26', border: '#2a2a3a' },
        mint: { DEFAULT: '#00d4aa', light: '#33e0be', dark: '#00a888', glow: 'rgba(0,212,170,0.15)' },
        flame: { DEFAULT: '#ff6b35', light: '#ff8a5c', dark: '#e55520', glow: 'rgba(255,107,53,0.15)' },
        surface: { DEFAULT: '#12121a', light: '#1e1e2e', lighter: '#2a2a3a' },
      },
      fontFamily: { sans: ['Inter', 'system-ui', 'sans-serif'] },
      boxShadow: {
        glow: '0 0 20px rgba(0,212,170,0.3)',
        'glow-sm': '0 0 10px rgba(0,212,170,0.2)',
        'glow-flame': '0 0 20px rgba(255,107,53,0.3)',
        glass: '0 8px 32px rgba(0,0,0,0.4)',
      },
      backgroundImage: {
        'gradient-mint': 'linear-gradient(135deg, #00d4aa, #00a888)',
        'gradient-flame': 'linear-gradient(135deg, #ff6b35, #e55520)',
        'gradient-mixed': 'linear-gradient(135deg, #00d4aa, #ff6b35)',
        'shimmer': 'linear-gradient(90deg, transparent, rgba(255,255,255,0.05), transparent)',
      },
      animation: {
        shimmer: 'shimmer 2s infinite',
        'pulse-glow': 'pulse-glow 2s ease-in-out infinite',
        'slide-up': 'slide-up 0.3s ease-out',
        'slide-down': 'slide-down 0.3s ease-out',
      },
      keyframes: {
        shimmer: { '0%': { transform: 'translateX(-100%)' }, '100%': { transform: 'translateX(100%)' } },
        'pulse-glow': { '0%, 100%': { boxShadow: '0 0 10px rgba(0,212,170,0.2)' }, '50%': { boxShadow: '0 0 25px rgba(0,212,170,0.4)' } },
        'slide-up': { '0%': { transform: 'translateY(10px)', opacity: '0' }, '100%': { transform: 'translateY(0)', opacity: '1' } },
        'slide-down': { '0%': { transform: 'translateY(-10px)', opacity: '0' }, '100%': { transform: 'translateY(0)', opacity: '1' } },
      },
    },
  },
  plugins: [],
};
