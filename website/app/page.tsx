import Image from "next/image";
import HeroSection from "@/components/HeroSection";
import Navigation from "@/components/Navigation";
import "@/styles/animations.css";

export default function Home() {
  return (
    <>
      {/* Navbar */}
      <nav className="fixed w-full bg-black/20 backdrop-blur-sm shadow-lg z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            <div className="flex-shrink-0 flex items-center">
              <h1 className="text-2xl font-bold text-white">WeSaneBro</h1>
            </div>
            <input type="checkbox" id="nav-toggle" className="hidden peer" />
            <label
              htmlFor="nav-toggle"
              className="p-2 rounded-md text-white hover:bg-white/10 cursor-pointer"
            >
              <svg
                className="h-6 w-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M4 6h16M4 12h16M4 18h16"
                />
              </svg>
            </label>
          </div>
        </div>
      </nav>

      <Navigation />

      <main className="min-h-screen bg-slate-50">
        {/* Hero Section */}
        <HeroSection />

        {/* Products Section */}
        <section
          id="products"
          className="py-24 px-4 bg-gradient-to-b from-slate-50 to-white"
        >
          <h2 className="text-4xl font-bold text-center mb-16 text-gray-900">
            Our Products
          </h2>
          <div className="grid md:grid-cols-2 gap-12 max-w-6xl mx-auto">
            {/* BrainBot Product */}
            <div className="bg-white p-8 rounded-2xl shadow-xl hover:shadow-2xl transition-shadow">
              <Image
                src="https://images.pexels.com/photos/2085831/pexels-photo-2085831.jpeg"
                alt="BrainBot"
                width={400}
                height={300}
                className="rounded-lg mb-4 w-full h-64 object-cover"
              />
              <h3 className="text-2xl font-bold mb-2">BrainBot</h3>
              <p className="mb-4">
                An intelligent robotic companion designed to assist and support
                neurodiverse individuals.
              </p>
              <button className="w-full bg-indigo-600 hover:bg-indigo-700 text-white py-3 px-4 rounded-xl transition-colors mt-6">
                Purchase BrainBot
              </button>
            </div>

            {/* BrainBoot Product */}
            <div className="bg-white p-8 rounded-2xl shadow-xl hover:shadow-2xl transition-shadow">
              <Image
                src="https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg"
                alt="BrainBoot App"
                width={400}
                height={300}
                className="rounded-lg mb-4 w-full h-64 object-cover"
              />
              <h3 className="text-2xl font-bold mb-2">BrainBoot</h3>
              <p className="mb-4">
                A companion app that enhances the BrainBot experience with
                personalized support.
              </p>
              <button className="w-full bg-indigo-600 hover:bg-indigo-700 text-white py-3 px-4 rounded-xl transition-colors mt-6">
                Download BrainBoot
              </button>
            </div>
          </div>
        </section>

        {/* Survey Section */}
        <section
          id="survey"
          className="py-24 px-4 bg-gradient-to-b from-white to-slate-50"
        >
          <div className="max-w-4xl mx-auto">
            <h2 className="text-4xl font-bold text-center mb-16 text-gray-900">
              NeuroSurvey
            </h2>
            <div className="bg-white p-12 rounded-2xl shadow-xl text-center">
              <h3 className="text-3xl font-bold text-gray-900 mb-6">
                Coming Soon!
              </h3>
              <p className="text-gray-600 text-lg">
                Our comprehensive neurodiversity survey will be available
                shortly.
              </p>
            </div>
          </div>
        </section>

        {/* About Us Section */}
        <section
          id="about"
          className="py-24 px-4 bg-gradient-to-br from-slate-50 via-white to-indigo-50"
        >
          <div className="max-w-6xl mx-auto relative">
            {/* Tech decoration */}
            <div className="absolute inset-0 -z-10 opacity-10">
              <div className="absolute top-0 left-0 w-64 h-64 bg-indigo-400 rounded-full blur-3xl"></div>
              <div className="absolute bottom-0 right-0 w-64 h-64 bg-blue-400 rounded-full blur-3xl"></div>
            </div>

            <h2 className="text-5xl font-bold text-center mb-20 text-gray-900 animate-float">
              About Us
            </h2>

            <div className="grid md:grid-cols-2 gap-16">
              <div className="space-y-8 opacity-0 animate-slide-in [animation-delay:200ms]">
                <div className="bg-white/50 backdrop-blur-sm p-8 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 hover:-translate-y-1">
                  <h3 className="text-2xl font-bold text-gray-800 mb-4 flex items-center">
                    <span className="text-indigo-600 mr-2">⬤</span> Our Mission
                  </h3>
                  <p className="text-gray-600 leading-relaxed">
                    At WeSaneBro, we believe in creating innovative solutions
                    that empower neurodiverse individuals to live more
                    independently and confidently. Our journey began with a
                    simple idea: technology should adapt to people, not the
                    other way around.
                  </p>
                </div>

                <div className="bg-white/50 backdrop-blur-sm p-8 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 hover:-translate-y-1">
                  <h3 className="text-2xl font-bold text-gray-800 mb-4 flex items-center">
                    <span className="text-indigo-600 mr-2">⬤</span> Our Vision
                  </h3>
                  <p className="text-gray-600 leading-relaxed">
                    We envision a world where neurodiversity is celebrated and
                    supported through cutting-edge technology, making daily life
                    more accessible and enjoyable for everyone.
                  </p>
                </div>
              </div>

              <div className="space-y-8 opacity-0 animate-slide-in [animation-delay:400ms]">
                <div className="bg-white/50 backdrop-blur-sm p-8 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 hover:-translate-y-1">
                  <h3 className="text-2xl font-bold text-gray-800 mb-4 flex items-center">
                    <span className="text-indigo-600 mr-2">⬤</span> Our Approach
                  </h3>
                  <p className="text-gray-600 leading-relaxed">
                    We combine advanced robotics with intuitive AI to create
                    companions that understand and adapt to individual needs.
                    Our team of experts works closely with the neurodiverse
                    community to ensure our solutions make a real difference.
                  </p>
                </div>

                <div className="bg-white/50 backdrop-blur-sm p-8 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 hover:-translate-y-1">
                  <h3 className="text-2xl font-bold text-gray-800 mb-4 flex items-center">
                    <span className="text-indigo-600 mr-2">⬤</span> Our Values
                  </h3>
                  <ul className="grid grid-cols-2 gap-1">
                    {[
                      "Empathy in Innovation",
                      "Inclusive Design",
                      "Continuous Learning",
                      "Community Partnership",
                      "Data Security",
                      "User Empowerment",
                    ].map((value) => (
                      <li
                        key={value}
                        className="flex items-center space-x-2 text-gray-600"
                      >
                        <svg
                          className="w-5 h-5 text-indigo-500"
                          fill="none"
                          stroke="currentColor"
                          viewBox="0 0 24 24"
                        >
                          <path
                            strokeLinecap="round"
                            strokeLinejoin="round"
                            strokeWidth="2"
                            d="M5 13l4 4L19 7"
                          />
                        </svg>
                        <span>{value}</span>
                      </li>
                    ))}
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* ...existing survey section and footer... */}
      </main>

      {/* Footer */}
      <footer id="contact" className="bg-gray-900 text-white py-16">
        <div className="max-w-6xl mx-auto px-4 grid grid-cols-1 md:grid-cols-3 gap-8">
          <div>
            <h3 className="text-xl font-bold mb-4">About WeSaneBro</h3>
            <p className="text-gray-400">
              Founded in 2023, WeSaneBro is dedicated to improving the lives of
              neurodiverse individuals through innovative robotics and
              technology solutions.
            </p>
          </div>
          <div>
            <h3 className="text-xl font-bold mb-4">Contact</h3>
            <p className="text-gray-400">Email: info@wesanebro.com</p>
            <p className="text-gray-400">Phone: (555) 123-4567</p>
            <p className="text-gray-400">Address: Tech Valley, Silicon City</p>
          </div>
          <div>
            <h3 className="text-xl font-bold mb-4">Follow Us</h3>
            <div className="space-y-2">
              <p className="text-gray-400">Twitter</p>
              <p className="text-gray-400">LinkedIn</p>
              <p className="text-gray-400">Instagram</p>
            </div>
          </div>
        </div>
        <div className="max-w-6xl mx-auto px-4 pt-8 mt-8 border-t border-gray-800">
          <p className="text-center text-gray-400">
            © 2023 WeSaneBro. All rights reserved.
          </p>
        </div>
      </footer>
    </>
  );
}
