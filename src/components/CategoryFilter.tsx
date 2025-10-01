/**
 * Category Filter Component
 *
 * Sidebar component for filtering products by category.
 * Provides quick navigation between different product categories.
 *
 * @author Gabriel Ferreira
 * @see https://www.linkedin.com/in/devferreirag/
 * @see https://github.com/glferreira-devsecops
 */

import type { Database } from '../lib/database.types';

type Category = Database['public']['Tables']['categories']['Row'];

interface CategoryFilterProps {
  categories: Category[];
  selectedCategory: string | null;
  onSelectCategory: (slug: string | null) => void;
}

export function CategoryFilter({
  categories,
  selectedCategory,
  onSelectCategory,
}: CategoryFilterProps) {
  return (
    <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4">
      <h3 className="font-semibold text-gray-900 mb-3">Categories</h3>
      <div className="space-y-2">
        <button
          onClick={() => onSelectCategory(null)}
          className={`w-full text-left px-3 py-2 rounded-lg transition-colors ${
            selectedCategory === null
              ? 'bg-blue-100 text-blue-700 font-medium'
              : 'text-gray-700 hover:bg-gray-100'
          }`}
        >
          All Products
        </button>
        {categories.map((category) => (
          <button
            key={category.id}
            onClick={() => onSelectCategory(category.slug)}
            className={`w-full text-left px-3 py-2 rounded-lg transition-colors ${
              selectedCategory === category.slug
                ? 'bg-blue-100 text-blue-700 font-medium'
                : 'text-gray-700 hover:bg-gray-100'
            }`}
          >
            {category.name}
          </button>
        ))}
      </div>
    </div>
  );
}
