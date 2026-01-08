🎓 Course Craft – AI-Powered Learning PlatformCourse Craft is a sophisticated SaaS application that allows users to generate comprehensive, structured courses on any topic in seconds using Artificial Intelligence. Built with a focus on speed, scalability, and user experience.🚀 FeaturesAI Course Generation: Input a topic and target audience, and the app uses Google Gemini AI to generate modules, chapters, and content.Interactive Dashboards: A sleek user interface for managing ongoing and completed courses.Progress Tracking: Keep tabs on your learning journey with built-in progress management.Smart Video Integration: Automatically fetches relevant educational videos to supplement text-based learning.Secure Authentication: Robust user login and profile management via Clerk.Responsive Design: Fully optimized for mobile, tablet, and desktop using Tailwind CSS.Database Management: High-performance data handling using Drizzle ORM with Neon (PostgreSQL).🛠️ Tech StackLayerTechnologyFrameworkNext.js 14 (App Router)StylingTailwind CSS + Shadcn UIAI EngineGoogle Gemini AIAuthClerkDatabaseNeon (Serverless PostgreSQL)ORMDrizzle ORMState/FormReact Hooks, Lucide React Icons🏗️ Getting StartedPrerequisitesNode.js 18.x or laterA Google AI (Gemini) API KeyA Clerk account for AuthenticationA Neon DB instanceInstallationClone the repository:Bashgit clone https://github.com/ayushL2007/Course-Craft.git
cd Course-Craft
Install dependencies:Bashnpm install
Environment Setup:Create a .env.local file in the root and add your keys:Code snippetNEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=...
CLERK_SECRET_KEY=...
NEXT_PUBLIC_DATABASE_CONNECTION_STRING=...
NEXT_PUBLIC_GEMINI_API_KEY=...
Push Database Schema:Bashnpm run db:push
Start the development server:Bashnpm run dev
📂 Project StructurePlaintext├── app/                # Next.js App Router (Pages & Logic)
├── configs/            # Database and AI configurations
├── drizzle/            # Database schema and migrations
├── components/         # Reusable UI components (Shadcn)
├── public/             # Static assets
└── lib/                # Shared utility functions
🤝 ContributingFork the Project.Create your Feature Branch (git checkout -b feature/NewFeature).Commit your changes (git commit -m 'Add some NewFeature').Push to the Branch (git push origin feature/NewFeature).Open a Pull Request.🛡️ LicenseDistributed under the MIT License. See LICENSE for more information.Author: Ayush
