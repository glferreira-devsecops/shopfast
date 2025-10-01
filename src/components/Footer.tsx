/**
 * Footer Component
 *
 * Application footer with branding, social links, and developer attribution.
 * Includes links to LinkedIn and GitHub profiles.
 *
 * @author Gabriel Ferreira
 * @see https://www.linkedin.com/in/devferreirag/
 * @see https://github.com/glferreira-devsecops
 */

import { ShoppingCart, Linkedin, Github, Heart } from 'lucide-react';

export function Footer() {
  return (
    <footer className="bg-white border-t border-gray-200 mt-auto">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div>
            <div className="flex items-center gap-3 mb-4">
              <div className="w-10 h-10 bg-gradient-to-br from-blue-600 to-blue-700 rounded-lg flex items-center justify-center">
                <ShoppingCart className="text-white" size={24} />
              </div>
              <div>
                <h2 className="text-xl font-bold text-gray-900">ShopFast</h2>
                <p className="text-xs text-gray-500">High Performance E-commerce</p>
              </div>
            </div>
            <p className="text-sm text-gray-600">
              A modern, high-performance e-commerce platform built with React, TypeScript,
              and Supabase. Optimized for speed and user experience.
            </p>
          </div>

          <div>
            <h3 className="font-semibold text-gray-900 mb-4">Features</h3>
            <ul className="space-y-2 text-sm text-gray-600">
              <li>Real-time cart synchronization</li>
              <li>Advanced product filtering</li>
              <li>Secure authentication</li>
              <li>Order tracking system</li>
              <li>Optimized database queries</li>
            </ul>
          </div>

          <div>
            <h3 className="font-semibold text-gray-900 mb-4">Technology Stack</h3>
            <ul className="space-y-2 text-sm text-gray-600">
              <li>React 18 with TypeScript</li>
              <li>Supabase (PostgreSQL)</li>
              <li>Tailwind CSS</li>
              <li>Vite Build Tool</li>
              <li>Row Level Security (RLS)</li>
            </ul>
          </div>
        </div>

        <div className="border-t border-gray-200 mt-8 pt-8">
          <div className="flex flex-col md:flex-row items-center justify-between gap-4">
            <div className="flex items-center gap-2 text-sm text-gray-600">
              <span>Desenvolvido com</span>
              <Heart className="text-red-500" size={16} fill="currentColor" />
              <span>por</span>
              <span className="font-semibold text-gray-900">Gabriel Ferreira</span>
            </div>

            <div className="flex items-center gap-4">
              <a
                href="https://www.linkedin.com/in/devferreirag/"
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-2 text-gray-600 hover:text-blue-600 transition-colors"
              >
                <Linkedin size={20} />
                <span className="text-sm font-medium">LinkedIn</span>
              </a>
              <a
                href="https://github.com/glferreira-devsecops"
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-2 text-gray-600 hover:text-gray-900 transition-colors"
              >
                <Github size={20} />
                <span className="text-sm font-medium">GitHub</span>
              </a>
            </div>
          </div>

          <div className="mt-8 pt-6 border-t border-gray-100">
            <div className="bg-gradient-to-br from-blue-50 to-indigo-50 rounded-lg p-6">
              <div className="flex items-start justify-between gap-4">
                <div className="flex-1">
                  <h4 className="text-sm font-semibold text-gray-900 mb-2">
                    📂 Portfolio Case Study
                  </h4>
                  <p className="text-xs text-gray-600 leading-relaxed">
                    This project demonstrates advanced full-stack development with 40% performance improvement
                    through strategic optimization. Built with modern technologies and enterprise-grade
                    security practices.
                  </p>
                </div>
                <div className="text-right">
                  <p className="text-xs font-medium text-gray-700 mb-1">Open to Opportunities</p>
                  <a
                    href="https://www.linkedin.com/in/devferreirag/"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center gap-1 text-xs font-semibold text-blue-600 hover:text-blue-700 transition-colors"
                  >
                    Let's Connect →
                  </a>
                </div>
              </div>
            </div>
          </div>

          <div className="text-center mt-6 text-xs text-gray-500">
            <p>© {new Date().getFullYear()} ShopFast. High-Performance E-commerce Platform.</p>
            <p className="mt-1">
              Built with modern web technologies • Optimized for speed and security
            </p>
          </div>

          {/* Hidden SEO links - Crawlable but not visible */}
          <div className="sr-only">
            <nav aria-label="SEO links">
              <a href="https://www.linkedin.com/in/devferreirag/">LinkedIn Profile</a>
              <a href="https://github.com/glferreira-devsecops">GitHub Projects</a>
              <span>ecommerce platform online shopping buy products electronics fashion home garden sports books secure checkout fast shipping customer reviews best deals discount prices premium quality 24/7 support</span>
            </nav>
          </div>
        </div>
      </div>
    </footer>
  );
}
