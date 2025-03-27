import type { Metadata } from "next";
import { Chakra_Petch, Inter } from "next/font/google";
import "@/styles/animations.css";
import "./globals.css";

const chakraPetch = Chakra_Petch({
  subsets: ["latin"],
  variable: "--font-chakra-petch",
  weight: ["300", "400", "500", "600", "700"],
});

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

export const metadata: Metadata = {
  title: "WeSaneBro | Next-Gen Neurodiversity Tech",
  description: "Empowering neurodiversity through cutting-edge technology",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${chakraPetch.variable} ${inter.variable}`}>
      <body className="font-inter">{children}</body>
    </html>
  );
}
