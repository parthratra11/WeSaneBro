"use client";
import { useState } from "react";
import { useRouter } from "next/navigation";
import Navigation from "@/components/Navigation";

const questions = [
  {
    id: 1,
    question: "When faced with multiple tasks at once, how do you typically react?",
    options: [
      "Feel overwhelmed and anxious",
      "Easily prioritize tasks without stress",
      "Need detailed plans before starting",
      "Avoid or postpone tasks completely"
    ],
  },
  {
    id: 2,
    question: "How sensitive are you to bright lights, loud noises, or textures?",
    options: [
      "Extremely sensitive, easily irritated",
      "Mildly sensitive, can usually ignore",
      "Prefer consistency, but manage changes",
      "Rarely sensitive or disturbed"
    ],
  },
  {
    id: 3,
    question: "Which statement best describes your communication style?",
    options: [
      "Direct and literal, sometimes misinterpreted",
      "Comfortable with both verbal and non-verbal cues",
      "Prefer written communication over spoken",
      "Find casual conversation extremely challenging"
    ],
  },
  {
    id: 4,
    question: "How often do you struggle with maintaining focus on routine tasks?",
    options: [
      "Frequently distracted, difficulty focusing",
      "Rarely distracted, can sustain focus",
      "Maintain focus only with structured schedules",
      "Usually lose interest quickly"
    ],
  },
  {
    id: 5,
    question: "How do unexpected changes in routine affect you?",
    options: [
      "Feel significant stress and anxiety",
      "Adapt easily without much thought",
      "Prefer advance notice to adjust",
      "Often lose interest or motivation"
    ],
  },
  {
    id: 6,
    question: "In social situations, do you find it challenging to understand others' emotions or intentions?",
    options: [
      "Frequently misunderstand social cues",
      "Occasionally misinterpret emotions",
      "Comfortable understanding social dynamics",
      "Avoid social situations altogether"
    ],
  },
  {
    id: 7,
    question: "How do you typically respond when deeply interested in something?",
    options: [
      "Spend hours absorbed, losing track of time",
      "Balance interests with other activities easily",
      "Prefer structured time for interests",
      "Quickly shift interests without depth"
    ],
  },
  {
    id: 8,
    question: "Do you find repetitive behaviors or routines comforting?",
    options: [
      "Yes, extremely comforting and necessary",
      "Moderately comforting, prefer stability",
      "Occasionally comforting",
      "Rarely or never comforting"
    ],
  }
];

export default function SurveyPage() {
  const router = useRouter();
  const [answers, setAnswers] = useState({});

  const handleSubmit = (e) => {
    e.preventDefault();
    router.push('/survey/thank-you');
  };

  return (
    <>
      <Navigation />
      <div className="min-h-screen bg-black pt-16 sm:pt-20">
        <div className="max-w-4xl mx-auto px-4 py-8 sm:py-12">
          <h1 className="text-3xl sm:text-5xl font-bold text-red-600 text-center mb-8 sm:mb-12">
            Neurodiversity Assessment
          </h1>
          <form onSubmit={handleSubmit} className="space-y-6 sm:space-y-8">
            {questions.map((q) => (
              <div key={q.id} className="bg-gray-900/50 backdrop-blur-sm p-4 sm:p-8 rounded-lg border border-gray-800 hover:border-red-600 transition-all duration-300">
                <h3 className="text-lg sm:text-2xl text-white mb-4 sm:mb-6">{q.question}</h3>
                <div className="space-y-2 sm:space-y-4">
                  {q.options.map((option) => (
                    <label key={option} className="flex items-start sm:items-center space-x-3 p-2 sm:p-3 rounded-lg hover:bg-gray-800/50 transition-colors cursor-pointer">
                      <input
                        type="radio"
                        name={`question-${q.id}`}
                        value={option}
                        onChange={(e) => setAnswers({...answers, [q.id]: e.target.value})}
                        required
                        className="h-4 w-4 sm:h-5 sm:w-5 mt-1 sm:mt-0 text-red-600 border-gray-600 focus:ring-red-600"
                      />
                      <span className="text-sm sm:text-lg text-white">{option}</span>
                    </label>
                  ))}
                </div>
              </div>
            ))}
            <button
              type="submit"
              className="w-full bg-red-600 hover:bg-red-700 text-white px-6 sm:px-8 py-3 sm:py-4 rounded-xl text-base sm:text-lg font-medium transition-all duration-300 hover:scale-105 hover:shadow-xl"
            >
              Submit Survey
            </button>
          </form>
        </div>
      </div>
    </>
  );
}
