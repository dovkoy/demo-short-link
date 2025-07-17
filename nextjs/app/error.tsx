// BH

'use client' // Error boundaries must be Client Components

import Link from 'next/link';
import { OctagonAlert } from 'lucide-react'; 
import { useEffect } from 'react';

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    // Log the error to an error reporting service
    console.error(error)
  }, [error])
 
  return (
    <div className="flex items-center justify-center min-h-[100dvh]">
      <div className="max-w-md space-y-8 p-4 text-center">
        <div className="flex justify-center">
          <OctagonAlert className="size-12 text-orange-500" />
        </div>
        <h1 className="text-4xl font-bold text-gray-900 tracking-tight">
          We are sorry
        </h1>
        <p className="text-base text-gray-500">
          The page you are looking for is temporarily unavailable.
          Hint: Check the console for details.
        </p>
        <Link
          href="/"
          className="max-w-48 mx-auto flex justify-center py-2 px-4 border border-gray-300 rounded-full shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-500"
        >
          Back to Home
        </Link>
      </div>
    </div>
  );
}