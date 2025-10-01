import { useState, useEffect } from 'react';
import { X, Briefcase, Github, Linkedin } from 'lucide-react';

/**
 * Portfolio Banner Component
 *
 * Professional, dismissible banner that showcases this as a portfolio project.
 * Designed to impress recruiters without being intrusive.
 */
export function PortfolioBanner() {
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    // Check if banner was previously dismissed
    const dismissed = localStorage.getItem('portfolio-banner-dismissed');
    const dismissedDate = dismissed ? new Date(dismissed) : null;
    const sevenDaysAgo = new Date();
    sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);

    // Show banner if not dismissed or dismissed more than 7 days ago
    if (!dismissed || (dismissedDate && dismissedDate < sevenDaysAgo)) {
      setIsVisible(true);
    }
  }, []);

  const handleDismiss = () => {
    setIsVisible(false);
    localStorage.setItem('portfolio-banner-dismissed', new Date().toISOString());
  };

  if (!isVisible) return null;

  return (
    <div className="relative bg-gradient-to-r from-blue-600 to-blue-700 text-white py-2 px-4 shadow-md">
      <div className="max-w-7xl mx-auto flex items-center justify-between gap-4">
        {/* Left: Portfolio Badge */}
        <div className="flex items-center gap-3">
          <Briefcase className="w-5 h-5 flex-shrink-0" />
          <div className="hidden sm:flex items-center gap-2 text-sm">
            <span className="font-semibold">Portfolio Project</span>
            <span className="text-blue-200">|</span>
            <span>High-Performance E-commerce Platform</span>
            <span className="text-blue-200">|</span>
            <span className="text-blue-200">React • TypeScript • Supabase</span>
          </div>
          <div className="sm:hidden text-sm font-semibold">
            Portfolio Project
          </div>
        </div>

        {/* Center: CTA (Desktop only) */}
        <div className="hidden lg:flex items-center gap-3">
          <a
            href="https://github.com/glferreira-devsecops/shopfast"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center gap-2 px-3 py-1 bg-white/10 hover:bg-white/20 rounded-md transition-colors text-sm"
          >
            <Github className="w-4 h-4" />
            View Code
          </a>
          <a
            href="https://www.linkedin.com/in/devferreirag/"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center gap-2 px-3 py-1 bg-white text-blue-600 hover:bg-blue-50 rounded-md transition-colors text-sm font-medium"
          >
            <Linkedin className="w-4 h-4" />
            Hire Me
          </a>
        </div>

        {/* Right: Close button */}
        <button
          onClick={handleDismiss}
          className="flex-shrink-0 p-1 hover:bg-white/10 rounded transition-colors"
          aria-label="Close banner"
        >
          <X className="w-5 h-5" />
        </button>
      </div>
    </div>
  );
}
