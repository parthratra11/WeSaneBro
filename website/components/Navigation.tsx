"use client";

export default function Navigation() {
  const scrollToSection = (sectionId: string) => {
    const element = document.getElementById(sectionId);
    element?.scrollIntoView({ behavior: "smooth" });
  };

  return (
    <div className="fixed top-0 right-0 h-screen w-64 bg-black/90 transform transition-transform duration-300 translate-x-full peer-checked:translate-x-0 z-40">
      <div className="flex flex-col items-start p-8 gap-6">
        <button
          onClick={() => scrollToSection("products")}
          className="text-white hover:text-indigo-400 transition-colors"
        >
          Products
        </button>
        <button
          onClick={() => scrollToSection("survey")}
          className="text-white hover:text-indigo-400 transition-colors"
        >
          NeuroSurvey
        </button>
        <button
          onClick={() => scrollToSection("about")}
          className="text-white hover:text-indigo-400 transition-colors"
        >
          About Us
        </button>
        <button
          onClick={() => scrollToSection("contact")}
          className="text-white hover:text-indigo-400 transition-colors"
        >
          Contact
        </button>
      </div>
    </div>
  );
}
