# Course-Craft

**Course-Craft** is a powerful SaaS platform that leverages Google Gemini AI to instantly generate complete, structured online courses on any topic. Simply provide a topic and target audience, and watch as the AI crafts detailed modules, chapters, lessons, and even integrates relevant educational videos.

Perfect for educators, content creators, and learners who want high-quality courses in seconds!

## Features

- **AI-Powered Course Generation**: Powered by Google Gemini AI to create comprehensive courses with structured content.
- **Interactive Dashboard**: Manage your created courses, track progress, and view analytics in a modern, user-friendly interface.
- **Progress Tracking**: Built-in tools to monitor learning progress across modules.
- **Smart Video Integration**: Automatically embeds relevant educational videos to enhance lessons.
- **Secure Authentication**: Seamless user login and profile management with Clerk.
- **Responsive Design**: Fully optimized for desktop, tablet, and mobile devices using Tailwind CSS and Shadcn UI.
- **Scalable Backend**: Serverless PostgreSQL database with Neon and efficient ORM via Drizzle.

## Tech Stack

- **Frontend/Backend**: HTML, CSS, JS and Ruby on Rails
- **Styling**: CSS3
- **AI**: Google Gemini API
- **Authentication**: Clerk
- **Database**: Neon (Serverless PostgreSQL)
- **ORM**: Drizzle ORM
- **Icons**: Lucide React

## Prerequisites

- Rails 7+
- A Google Gemini API key
- Neon PostgreSQL database (connection string)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/ayushL2007/Course-Craft.git
   cd Course-Craft
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

3. Create a `.env.local` file in the root directory and add the following environment variables:

   ```env
   NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=your_clerk_publishable_key
   CLERK_SECRET_KEY=your_clerk_secret_key
   DATABASE_URL=your_neon_postgresql_connection_string
   GEMINI_API_KEY=your_google_gemini_api_key
   ```

   > Note: Use `NEXT_PUBLIC_` prefix for client-side variables.

## Usage

1. Start the development server:

   ```bash
   rails s
   ```

2. Open [http://localhost:3000](http://localhost:3000) in your browser.


4. Enter a course topic and target audience to generate a new course.

5. Explore the dashboard to view, edit, track progress, and enjoy integrated content!

## Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request.

Please ensure your code follows the project's style and includes tests where applicable.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Google Gemini for the AI capabilities
- Clerk for authentication
- Neon for database hosting
- All open-source libraries used in the tech stack

---

Built with ❤️ by [ayushL2007](https://github.com/ayushL2007)

If you like this project, give it a ⭐ on GitHub!
