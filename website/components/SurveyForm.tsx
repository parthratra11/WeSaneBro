"use client";

export default function SurveyForm() {
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // Add your form submission logic here
  };

  return (
    <form className="space-y-6" onSubmit={handleSubmit}>
      <div>
        <label className="block mb-2">Name</label>
        <input type="text" className="w-full p-2 border rounded" />
      </div>
      <div>
        <label className="block mb-2">Age</label>
        <input type="number" className="w-full p-2 border rounded" />
      </div>
      <div>
        <label className="block mb-2">Do you have difficulty focusing?</label>
        <select className="w-full p-2 border rounded">
          <option value="">Select an option</option>
          <option value="never">Never</option>
          <option value="sometimes">Sometimes</option>
          <option value="often">Often</option>
          <option value="always">Always</option>
        </select>
      </div>
      <div>
        <label className="block mb-2">Describe your daily challenges</label>
        <textarea className="w-full p-2 border rounded" rows={4}></textarea>
      </div>
      <button className="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-md transition-colors">
        Submit Survey
      </button>
    </form>
  );
}
