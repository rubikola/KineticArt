import type { ReactNode } from 'react';
import { cn } from '../../lib/utils';

interface CardProps {
  children: ReactNode;
  className?: string;
  padding?: boolean;
  hover?: boolean;
  glass?: boolean;
}

export function Card({ children, className, padding = true, hover = false, glass = true }: CardProps) {
  return (
    <div
      className={cn(
        glass ? 'glass rounded-xl' : 'bg-dark-surface rounded-xl',
        hover && 'transition-all duration-200 hover:bg-white/[0.04] hover:border-mint/20 cursor-pointer',
        padding ? 'p-5' : '',
        className
      )}
    >
      {children}
    </div>
  );
}

export function CardTitle({ children, className }: { children: ReactNode; className?: string }) {
  return <h3 className={cn('text-lg font-semibold text-white', className)}>{children}</h3>;
}
