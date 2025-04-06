import Link from "next/link";
import Navigation from "@/components/Navigation";

export default function ThankYouPage() {
  return (
    <>
      <Navigation />
      <div className="min-h-screen bg-black flex flex-col items-center justify-center px-4">
        <div className="text-center max-w-2xl mx-4">
          <h1 className="text-3xl sm:text-5xl font-bold text-red-600 mb-6 sm:mb-8">Thank You!</h1>
          <div className="bg-gray-900/50 backdrop-blur-sm p-4 sm:p-8 rounded-lg border border-gray-800 hover:border-red-600 transition-all duration-300">
            <p className="text-base sm:text-xl text-gray-300 mb-6 sm:mb-8 leading-relaxed">
              Our team will review your responses and contact you shortly with personalized solutions
              tailored to your needs.
            </p>
            <Link href="/">
              <button className="bg-red-600 hover:bg-red-700 text-white px-6 sm:px-8 py-3 sm:py-4 rounded-xl text-base sm:text-lg font-medium transition-all duration-300 hover:scale-105 hover:shadow-xl">
                Return Home
              </button>
            </Link>
          </div>
        </div>
      </div>
    </>
  );
}
