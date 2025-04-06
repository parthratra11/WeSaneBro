"use client";
import { useState } from 'react';
import Link from 'next/link';

export default function Navigation() {
  const [isOpen, setIsOpen] = useState(false);

  const scrollToSection = (sectionId: string) => {
    setIsOpen(false);
    const element = document.getElementById(sectionId);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
  };

  return (
    <nav className="fixed w-full z-50 bg-black/95 backdrop-blur-sm">
      <div className="max-w-7xl mx-auto px-4">
        <div className="flex justify-between items-center h-16">
          <Link href="/" className="text-2xl font-bold text-red-600">
            WeSaneBro
          </Link>

          {/* Desktop Navigation */}
          <div className="hidden md:flex space-x-8">
            <NavLink onClick={() => scrollToSection('home')}>Home</NavLink>
            <NavLink onClick={() => scrollToSection('products')}>Products</NavLink>
            <NavLink href="/survey">Survey</NavLink>
            <NavLink onClick={() => scrollToSection('about')}>About Us</NavLink>
          </div>

          {/* Mobile Navigation Button */}
          <button 
            className="md:hidden text-white"
            onClick={() => setIsOpen(!isOpen)}
          >
            <svg className="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path 
                strokeLinecap="round" 
                strokeLinejoin="round" 
                strokeWidth={2} 
                d={isOpen ? "M6 18L18 6M6 6l12 12" : "M4 6h16M4 12h16M4 18h16"} 
              />
            </svg>
          </button>
        </div>

        {/* Mobile Navigation Menu */}
        <div className={`md:hidden ${isOpen ? 'block' : 'hidden'} pb-4`}>
          <div className="flex flex-col space-y-2">
            <MobileNavLink onClick={() => scrollToSection('home')}>
              Home
            </MobileNavLink>
            <MobileNavLink onClick={() => scrollToSection('products')}>
              Products
            </MobileNavLink>
            <MobileNavLink href="/survey">
              Survey
            </MobileNavLink>
            <MobileNavLink onClick={() => scrollToSection('about')}>
              About Us
            </MobileNavLink>
          </div>
        </div>
      </div>
    </nav>
  );
}

function NavLink({ children, href, onClick }) {
  if (href) {
    return (
      <Link 
        href={href} 
        className="text-gray-300 hover:text-white hover:bg-red-600/20 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300"
      >
        {children}
      </Link>
    );
  }
  return (
    <button 
      onClick={onClick}
      className="text-gray-300 hover:text-white hover:bg-red-600/20 px-3 py-2 rounded-md text-sm font-medium transition-all duration-300"
    >
      {children}
    </button>
  );
}

function MobileNavLink({ children, href, onClick }) {
  if (href) {
    return (
      <Link 
        href={href} 
        className="text-gray-300 hover:text-white hover:bg-red-600/20 px-3 py-2 rounded-md text-base block"
      >
        {children}
      </Link>
    );
  }
  return (
    <button 
      onClick={onClick}
      className="text-gray-300 hover:text-white hover:bg-red-600/20 px-3 py-2 rounded-md text-base block w-full text-left"
    >
      {children}
    </button>
  );
}
