"use client";

import { useState, useEffect } from "react";

interface Manufacturer {
  id: number;
  name: string;
  websiteUrl: string | null;
}

interface Product {
  id: number;
  name: string;
  manufacturerId: number;
  manufacturer: Manufacturer;
  status: string | null;
  expiryDate: string | null;
  limitations: string | null;
  imageUrl: string | null;
}

const API_URL = "https://spec-backend.azurewebsites.net";

export default function Home() {
  const [query, setQuery] = useState("");
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);

  // Fetch products whenever the search query changes
  useEffect(() => {
    const timer = setTimeout(async () => {
      setLoading(true);
      try {
        const url = query
          ? `${API_URL}/api/products?query=${encodeURIComponent(query)}`
          : `${API_URL}/api/products`;
        const res = await fetch(url);
        const data = await res.json();
        setProducts(data);
      } catch (err) {
        console.error(err);
      }
      setLoading(false);
    }, 300); // 300ms debounce - waits until user stops typing

    return () => clearTimeout(timer);
  }, [query]);

  // Helper to colour-code the status badge
  const statusColor = (status: string | null) => {
    switch (status) {
      case "APPROVED": return "bg-green-100 text-green-800";
      case "EXPIRED": return "bg-red-100 text-red-800";
      case "PENDING": return "bg-yellow-100 text-yellow-800";
      default: return "bg-gray-100 text-gray-800";
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-blue-700 text-white px-6 py-4 shadow">
        <h1 className="text-2xl font-bold">Spec Prototype</h1>
        <p className="text-blue-200 text-sm">Watercare Approved Materials Search</p>
      </div>

      {/* Search bar */}
      <div className="max-w-3xl mx-auto px-4 py-6">
        <input
          type="text"
          placeholder="Search products, manufacturers, or limitations..."
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          className="w-full px-4 py-3 rounded-lg border border-gray-300 shadow-sm text-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      {/* Results */}
      <div className="max-w-3xl mx-auto px-4">
        {/* Results count */}
        <p className="text-gray-500 text-sm mb-4">
          {loading ? "Searching..." : `${products.length} result${products.length !== 1 ? "s" : ""} found`}
        </p>

        {/* Product cards */}
        {products.map((product) => (
          <div key={product.id} className="bg-white rounded-lg shadow-sm border border-gray-200 p-5 mb-4">
            <div className="flex justify-between items-start">
              <h2 className="text-lg font-semibold text-gray-800">{product.name}</h2>
              <span className={`text-xs font-semibold px-2 py-1 rounded-full ${statusColor(product.status)}`}>
                {product.status ?? "UNKNOWN"}
              </span>
            </div>

            <p className="text-sm text-blue-600 mt-1">
              {product.manufacturer?.name}
              {product.manufacturer?.websiteUrl && (
                <a href={product.manufacturer.websiteUrl} target="_blank" rel="noopener noreferrer" className="ml-2 text-blue-400 hover:underline">
                  ↗ Website
                </a>
              )}
            </p>

            {product.expiryDate && (
              <p className="text-xs text-gray-400 mt-1">
                Approval expires: {new Date(product.expiryDate).toLocaleDateString("en-NZ")}
              </p>
            )}

            {product.limitations && (
              <p className="text-sm text-gray-600 mt-3 bg-gray-50 p-3 rounded border border-gray-100">
                {product.limitations}
              </p>
            )}
          </div>
        ))}

        {/* Empty state */}
        {!loading && products.length === 0 && (
          <div className="text-center py-12 text-gray-400">
            <p className="text-lg">No products found</p>
            <p className="text-sm">Try a different search term</p>
          </div>
        )}
      </div>
    </div>
  );
}