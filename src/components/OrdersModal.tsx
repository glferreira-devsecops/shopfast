/**
 * Orders Modal Component
 *
 * Displays user's order history with complete details of each order.
 * Shows order status, items, and shipping information.
 *
 * @author Gabriel Ferreira
 * @see https://www.linkedin.com/in/devferreirag/
 * @see https://github.com/glferreira-devsecops
 */

import { X, Package, Clock, CheckCircle, XCircle } from 'lucide-react';
import type { Database } from '../lib/database.types';

type Order = Database['public']['Tables']['orders']['Row'] & {
  order_items: (Database['public']['Tables']['order_items']['Row'] & {
    product: Database['public']['Tables']['products']['Row'];
  })[];
};

interface OrdersModalProps {
  isOpen: boolean;
  onClose: () => void;
  orders: Order[];
  loading: boolean;
}

export function OrdersModal({ isOpen, onClose, orders, loading }: OrdersModalProps) {
  if (!isOpen) return null;

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'completed':
        return <CheckCircle className="text-green-600" size={20} />;
      case 'processing':
        return <Clock className="text-blue-600" size={20} />;
      case 'cancelled':
        return <XCircle className="text-red-600" size={20} />;
      default:
        return <Clock className="text-gray-600" size={20} />;
    }
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'completed':
        return 'bg-green-100 text-green-700';
      case 'processing':
        return 'bg-blue-100 text-blue-700';
      case 'cancelled':
        return 'bg-red-100 text-red-700';
      default:
        return 'bg-gray-100 text-gray-700';
    }
  };

  return (
    <>
      <div
        className="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4"
        onClick={onClose}
      >
        <div
          className="bg-white rounded-xl max-w-4xl w-full max-h-[90vh] overflow-hidden flex flex-col"
          onClick={(e) => e.stopPropagation()}
        >
          <div className="flex items-center justify-between p-6 border-b border-gray-200">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 bg-gradient-to-br from-blue-600 to-blue-700 rounded-lg flex items-center justify-center">
                <Package className="text-white" size={20} />
              </div>
              <h2 className="text-2xl font-bold text-gray-900">My Orders</h2>
            </div>
            <button
              onClick={onClose}
              className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
            >
              <X size={24} />
            </button>
          </div>

          <div className="flex-1 overflow-y-auto p-6">
            {loading ? (
              <div className="text-center py-12">
                <p className="text-gray-500">Loading orders...</p>
              </div>
            ) : orders.length === 0 ? (
              <div className="text-center py-12">
                <Package size={64} className="mx-auto text-gray-300 mb-4" />
                <p className="text-gray-500 text-lg">No orders yet</p>
                <p className="text-gray-400 text-sm mt-2">
                  Start shopping to see your orders here
                </p>
              </div>
            ) : (
              <div className="space-y-4">
                {orders.map((order) => (
                  <div
                    key={order.id}
                    className="bg-gray-50 rounded-lg p-5 border border-gray-200"
                  >
                    <div className="flex items-start justify-between mb-4">
                      <div>
                        <div className="flex items-center gap-2 mb-2">
                          <h3 className="font-semibold text-gray-900">
                            Order #{order.id.slice(0, 8)}
                          </h3>
                          <span
                            className={`flex items-center gap-1 px-2 py-1 rounded-full text-xs font-medium ${getStatusColor(
                              order.status
                            )}`}
                          >
                            {getStatusIcon(order.status)}
                            {order.status.charAt(0).toUpperCase() + order.status.slice(1)}
                          </span>
                        </div>
                        <p className="text-sm text-gray-500">
                          {new Date(order.created_at).toLocaleDateString('en-US', {
                            year: 'numeric',
                            month: 'long',
                            day: 'numeric',
                            hour: '2-digit',
                            minute: '2-digit',
                          })}
                        </p>
                      </div>
                      <div className="text-right">
                        <p className="text-sm text-gray-500 mb-1">Total</p>
                        <p className="text-2xl font-bold text-gray-900">
                          ${order.total_amount.toFixed(2)}
                        </p>
                      </div>
                    </div>

                    <div className="space-y-2">
                      {order.order_items.map((item) => (
                        <div
                          key={item.id}
                          className="flex items-center gap-3 bg-white rounded-lg p-3"
                        >
                          <img
                            src={item.product.image_url}
                            alt={item.product.name}
                            className="w-16 h-16 object-cover rounded"
                          />
                          <div className="flex-1">
                            <h4 className="font-medium text-gray-900">
                              {item.product.name}
                            </h4>
                            <p className="text-sm text-gray-500">
                              ${item.price_at_purchase.toFixed(2)} × {item.quantity}
                            </p>
                          </div>
                          <div className="text-right">
                            <p className="font-semibold text-gray-900">
                              ${(item.price_at_purchase * item.quantity).toFixed(2)}
                            </p>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      </div>
    </>
  );
}
