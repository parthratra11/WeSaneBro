"use client";
import { useEffect, useState } from "react";
import Image from "next/image";

const images = [
  "/ocdcnd.png",
  "/ChatGPT Image Apr 6, 2025, 09_38_15 PM.png",
  "/ChatGPT Image Apr 6, 2025, 09_41_43 PM.png",
];

const HeroCarousel = () => {
  const [currentImage, setCurrentImage] = useState(0);

  useEffect(() => {
    const timer = setInterval(() => {
      setCurrentImage((prev) => (prev + 1) % images.length);
    }, 5000);

    return () => clearInterval(timer);
  }, []);

  return (
    <div className="absolute inset-0 w-full h-full">
      {images.map((src, index) => (
        <div
          key={src}
          className={`absolute inset-0 transition-opacity duration-1000 ease-in-out ${
            index === currentImage ? "opacity-100" : "opacity-0"
          }`}
        >
          <Image
            src={src}
            alt={`Hero image ${index + 1}`}
            fill
            className="object-cover"
            priority={index === 0}
          />
          <div className="absolute inset-0 bg-black/50" /> {/* Dark overlay */}
        </div>
      ))}
    </div>
  );
};

export default HeroCarousel;
