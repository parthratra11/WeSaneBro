"use client";
import dynamic from "next/dynamic";
import Link from "next/link";

const HeroCarousel = dynamic(() => import("./HeroCarousel"), {
  ssr: false,
});

export default function HeroSection() {
  return (
    <section className="relative h-screen flex items-center justify-center overflow-hidden">
      <HeroCarousel />
      <div className="relative z-10 text-center px-4">
        <h1 className="text-7xl font-bold mb-6 tracking-tight animate-float text-gradient-hero">
          WeSaneBro
          <span className="absolute -inset-1 block text-white opacity-20 blur-lg">
            WeSaneBro
          </span>
        </h1>
        <p className="text-xl max-w-2xl mx-auto mb-8 text-gray-200 opacity-0 animate-fade-in [animation-delay:500ms]">
          Empowering neurodiverse individuals through innovative robotics and
          technology solutions.
        </p>
        <Link href="/survey">
          <button className="bg-indigo-600 hover:bg-indigo-700 text-white px-8 py-3 rounded-full text-lg font-medium transition-all duration-300 hover:scale-105 hover:shadow-xl opacity-0 animate-fade-in [animation-delay:1000ms]">
            Take Neurodiversity Survey
          </button>
        </Link>
      </div>
    </section>
  );
}
