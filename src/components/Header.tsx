/**
 * Header Component
 *
 * Main navigation header with search functionality, cart access, and user authentication.
 * Sticky positioning ensures it's always visible during scrolling.
 *
 * @author Gabriel Ferreira
 * @see https://www.linkedin.com/in/devferreirag/
 * @see https://github.com/glferreira-devsecops
 */

import { ShoppingCart, Search, User, LogOut, Package } from 'lucide-react';

interface HeaderProps {
  cartItemCount: number;
  onCartClick: () => void;
  onSearchChange: (value: string) => void;
  searchValue: string;
  isAuthenticated: boolean;
  userEmail?: string;
  onAuthClick: () => void;
  onSignOut: () => void;
  onOrdersClick: () => void;
}

export function Header({
  cartItemCount,
  onCartClick,
  onSearchChange,
  searchValue,
  isAuthenticated,
  userEmail,
  onAuthClick,
  onSignOut,
  onOrdersClick,
}: HeaderProps) {
  return (
    <header className="bg-white border-b border-gray-200 sticky top-0 z-50 shadow-sm">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-gradient-to-br from-blue-600 to-blue-700 rounded-lg flex items-center justify-center">
              <ShoppingCart className="text-white" size={24} />
            </div>
            <div>
              <h1 className="text-xl font-bold text-gray-900">ShopFast</h1>
              <p className="text-xs text-gray-500">High Performance E-commerce</p>
            </div>
          </div>

          <div className="flex-1 max-w-md mx-8">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
              <input
                type="text"
                placeholder="Search products..."
                value={searchValue}
                onChange={(e) => onSearchChange(e.target.value)}
                className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
            </div>
          </div>

          <div className="flex items-center gap-3">
            {isAuthenticated ? (
              <>
                <button
                  onClick={onOrdersClick}
                  className="flex items-center gap-2 text-gray-700 hover:text-blue-600 px-3 py-2 rounded-lg hover:bg-gray-100 transition-colors"
                  title="My Orders"
                >
                  <Package size={20} />
                  <span className="hidden sm:inline">Orders</span>
                </button>

                <button
                  onClick={onCartClick}
                  className="relative flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white px-4 py-2 rounded-lg transition-all duration-200 font-medium"
                >
                  <ShoppingCart size={20} />
                  <span className="hidden sm:inline">Cart</span>
                  {cartItemCount > 0 && (
                    <span className="absolute -top-2 -right-2 bg-red-500 text-white text-xs font-bold rounded-full w-6 h-6 flex items-center justify-center">
                      {cartItemCount}
                    </span>
                  )}
                </button>

                <div className="flex items-center gap-2 pl-3 border-l border-gray-200">
                  <div className="hidden md:block text-right">
                    <p className="text-xs text-gray-500">Signed in as</p>
                    <p className="text-sm font-medium text-gray-900">{userEmail}</p>
                  </div>
                  <button
                    onClick={onSignOut}
                    className="p-2 text-gray-700 hover:text-red-600 hover:bg-gray-100 rounded-lg transition-colors"
                    title="Sign Out"
                  >
                    <LogOut size={20} />
                  </button>
                </div>
              </>
            ) : (
              <button
                onClick={onAuthClick}
                className="flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white px-4 py-2 rounded-lg transition-all duration-200 font-medium"
              >
                <User size={20} />
                <span>Sign In</span>
              </button>
            )}
          </div>
        </div>
      </div>
    </header>
  );
}
