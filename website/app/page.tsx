import Image from "next/image";
import HeroSection from "@/components/HeroSection";
import Navigation from "@/components/Navigation";
import "@/styles/animations.css";

export default function Home() {
  return (
    <>
      <Navigation />
      
      <main className="min-h-screen bg-black text-white">
        {/* Hero Section */}
        <section id="home">
          <HeroSection />
        </section>

        {/* Products Section */}
        <section
          id="products"
          className="py-12 sm:py-24 px-4 bg-gradient-to-b from-black to-gray-900"
        >
          <h2 className="text-3xl sm:text-4xl font-bold text-center mb-8 sm:mb-16 text-white">
            Our Products
          </h2>
          <div className="grid md:grid-cols-2 gap-6 sm:gap-12 max-w-6xl mx-auto">
            {/* BrainBot Product */}
            <div className="bg-gray-900 p-4 sm:p-8 rounded-2xl shadow-xl hover:shadow-2xl transition-shadow flex flex-col min-h-[500px] sm:h-[600px]">
              <Image
                src="/ChatGPT Image Apr 6, 2025, 09_28_42 PM.png"
                alt="Kibo"
                width={400}
                height={300}
                className="rounded-lg mb-4 w-full h-48 sm:h-64 object-cover"
              />
              <div className="flex flex-col flex-grow">
                <h3 className="text-xl sm:text-2xl font-bold mb-2 text-white">Kibo</h3>
                <p className="text-sm sm:text-base mb-4 text-gray-300 flex-grow">
                  An intelligent robotic companion designed to assist and support
                  neurodiverse individuals.
                </p>
                <button className="w-full bg-red-600 hover:bg-red-700 text-white py-2 sm:py-3 px-4 rounded-xl transition-colors">
                  Purchase Kibo
                </button>
              </div>
            </div>

            {/* BrainBoot Product */}
            <div className="bg-gray-900 p-4 sm:p-8 rounded-2xl shadow-xl hover:shadow-2xl transition-shadow flex flex-col min-h-[500px] sm:h-[600px]">
              <Image
                src="/WeSaneBro (1).jpg"
                alt="KibOS"
                width={400}
                height={300}
                className="rounded-lg mb-4 w-full h-48 sm:h-64 object-cover"
              />
              <div className="flex flex-col flex-grow">
                <h3 className="text-xl sm:text-2xl font-bold mb-2 text-white">KibOS</h3>
                <p className="text-sm sm:text-base mb-4 text-gray-300 flex-grow">
                  A companion app that enhances the Kibo experience with
                  personalized support.
                </p>
                <button className="w-full bg-red-600 hover:bg-red-700 text-white py-2 sm:py-3 px-4 rounded-xl transition-colors">
                  Download KibOS
                </button>
              </div>
            </div>
          </div>
        </section>

        {/* About Us Section */}
        <section
          id="about"
          className="py-12 sm:py-24 px-4 bg-gradient-to-br from-black via-gray-900 to-black"
        >
          <div className="max-w-6xl mx-auto relative">
            <h2 className="text-3xl sm:text-5xl font-bold text-center mb-10 sm:mb-20 text-red-600">
              About Us
            </h2>

            <div className="grid md:grid-cols-2 gap-6 sm:gap-16">
              <div className="space-y-6 sm:space-y-8">
                <div className="bg-gray-900/50 backdrop-blur-sm p-4 sm:p-8 rounded-lg border border-gray-800 hover:border-red-600 transition-all duration-300 min-h-[250px] sm:h-[300px] flex flex-col">
                  <h3 className="text-xl sm:text-3xl font-bold text-white mb-2 sm:mb-4">
                    Empathy-Driven Innovation
                  </h3>
                  <p className="text-sm sm:text-base text-gray-300 leading-relaxed flex-grow overflow-y-auto">
                    WeSaneBro is built on the belief that neurodiverse individuals deserve technology 
                    that understands and adapts to them — not the other way around. We create 
                    human-centered solutions that prioritize emotional connection, independence, and dignity.
                  </p>
                </div>

                <div className="bg-gray-900/50 backdrop-blur-sm p-4 sm:p-8 rounded-lg border border-gray-800 hover:border-red-600 transition-all duration-300 min-h-[250px] sm:h-[300px] flex flex-col">
                  <h3 className="text-xl sm:text-3xl font-bold text-white mb-2 sm:mb-4">
                    Companion Robot Powered by Your Smartphone
                  </h3>
                  <p className="text-sm sm:text-base text-gray-300 leading-relaxed flex-grow overflow-y-auto">
                    WeSaneBro has developed a first-of-its-kind robotic companion that functions as a 
                    friend, tutor, advisor, and mentor — all powered by a user's smartphone. This ensures 
                    affordability, scalability, and accessibility without compromising on emotional 
                    engagement or functionality.
                  </p>
                </div>
              </div>

              <div className="space-y-6 sm:space-y-8">
                <div className="bg-gray-900/50 backdrop-blur-sm p-4 sm:p-8 rounded-lg border border-gray-800 hover:border-red-600 transition-all duration-300 min-h-[250px] sm:h-[300px] flex flex-col">
                  <h3 className="text-xl sm:text-3xl font-bold text-white mb-2 sm:mb-4">
                    Executive Function Assistant
                  </h3>
                  <p className="text-sm sm:text-base text-gray-300 leading-relaxed flex-grow overflow-y-auto">
                    Our mobile app helps users manage tasks, routines, and emotions through intuitive 
                    visual planners, mood tracking, and a safe, moderated community. It serves as a 
                    digital assistant and support system tailored to the unique needs of neurodiverse 
                    individuals.
                  </p>
                </div>

                <div className="bg-gray-900/50 backdrop-blur-sm p-4 sm:p-8 rounded-lg border border-gray-800 hover:border-red-600 transition-all duration-300 min-h-[250px] sm:h-[300px] flex flex-col">
                  <h3 className="text-xl sm:text-3xl font-bold text-white mb-2 sm:mb-4">
                    Inclusive, Scalable & Sustainable Impact
                  </h3>
                  <p className="text-sm sm:text-base text-gray-300 leading-relaxed flex-grow overflow-y-auto">
                    By combining AI, robotics, and community, WeSaneBro offers a feasible, low-cost 
                    solution that can be used in both developed and underserved regions. We aim to 
                    bridge the inclusion gap in education, employment, and daily life — one interaction 
                    at a time.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>

      {/* Footer */}
      <footer className="bg-black text-gray-300 py-12">
        <div className="max-w-6xl mx-auto px-4">
          <div className="flex justify-between items-center">
            <div>
              <h3 className="text-2xl font-bold text-red-600 mb-4">
                WeSaneBro
              </h3>
              <p className="text-gray-400 max-w-md">
                Empowering neurodiverse individuals through innovative robotics
                and technology solutions.
              </p>
            </div>
          </div>
          <div className="text-center mt-8 pt-8 border-t border-gray-800">
            <p className="text-gray-500">© 2025 WeSaneBro. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </>
  );
}
