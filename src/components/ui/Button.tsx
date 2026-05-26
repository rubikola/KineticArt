import { forwardRef, type ButtonHTMLAttributes, type ReactNode } from 'react';
import { cn } from '../../lib/utils';

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'danger' | 'ghost';
  size?: 'sm' | 'md' | 'lg';
  loading?: boolean;
  children: ReactNode;
}

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ variant = 'primary', size = 'md', loading, children, className, disabled, ...props }, ref) => {
    const variants = {
      primary: 'btn-primary',
      secondary: 'btn-secondary',
      danger: 'bg-flame/10 text-flame border border-flame/20 rounded-xl px-5 py-2.5 font-semibold transition-all duration-200 hover:bg-flame/20 active:scale-[0.98]',
      ghost: 'text-white/60 rounded-xl px-4 py-2.5 transition-all duration-200 hover:bg-white/5 hover:text-white active:scale-[0.98]',
    };
    const sizes = { sm: 'text-sm px-3.5 py-2', md: '', lg: 'text-base px-6 py-3' };

    return (
      <button
        ref={ref}
        disabled={disabled || loading}
        className={cn(variants[variant], sizes[size], loading && 'opacity-70 pointer-events-none', className)}
        {...props}
      >
        {loading ? (
          <span className="flex items-center justify-center gap-2">
            <span className="animate-spin h-4 w-4 border-2 border-current border-t-transparent rounded-full" />
            {children}
          </span>
        ) : (
          children
        )}
      </button>
    );
  }
);

Button.displayName = 'Button';
