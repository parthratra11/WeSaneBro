import Link from "next/link";
import Navigation from "@/components/Navigation";

export default function ThankYouPage() {
  return (
    <>
      <Navigation />
      <div className="min-h-screen bg-black flex flex-col items-center justify-center px-4">
        <div className="text-center max-w-2xl">
          <h1 className="text-5xl font-bold text-red-600 mb-8">Thank You!</h1>
          <div className="bg-gray-900/50 backdrop-blur-sm p-8 rounded-lg border border-gray-800 hover:border-red-600 transition-all duration-300">
            <p className="text-xl text-gray-300 mb-8 leading-relaxed">
              Our team will review your responses and contact you shortly with personalized solutions
              tailored to your needs.
            </p>
            <Link href="/">
              <button className="bg-red-600 hover:bg-red-700 text-white px-8 py-4 rounded-xl text-lg font-medium transition-all duration-300 hover:scale-105 hover:shadow-xl">
                Return Home
              </button>
            </Link>
          </div>
        </div>
      </div>
    </>
  );
}
