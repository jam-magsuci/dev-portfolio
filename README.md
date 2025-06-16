# Developer Portfolio

This is a personal developer portfolio for Jam Magsuci, a Full-Stack Developer. It's built with Next.js, TypeScript, and Tailwind CSS, and it showcases projects with data fetched from Firebase. The portfolio also features an admin dashboard for managing project entries.

## Features

- **Hero Section**: A welcoming introduction with a brief professional summary.
- **Project Showcase**: A dynamic list of projects fetched from a Firebase backend.
- **Downloadable CV**: A direct link to download the developer's resume.
- **Contact Information**: Easy access to email and GitHub profiles for potential opportunities.
- **Admin Dashboard**: A protected section for managing the projects displayed on the portfolio.
- **Responsive Design**: Fully responsive layout for optimal viewing on all devices.

## Tech Stack

- **Framework**: [Next.js](https://nextjs.org/)
- **Language**: [TypeScript](https://www.typescriptlang.org/)
- **Styling**: [Tailwind CSS](https://tailwindcss.com/)
- **UI Components**: [shadcn/ui](https://ui.shadcn.com/), [Radix UI](https://www.radix-ui.com/)
- **State Management/Forms**: [React Hook Form](https://react-hook-form.com/), [Zod](https://zod.dev/)
- **AI Integration**: [Genkit](https://firebase.google.com/docs/genkit)
- **Backend & Database**: [Firebase](https://firebase.google.com/) (Firestore, Authentication)
- **Deployment**: Vercel / Firebase Hosting

## Installation Instructions

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/your-repo-name.git
    cd your-repo-name
    ```

2.  **Install dependencies:**
    This project uses `npm` for package management.
    ```bash
    npm install
    ```

## Usage

To run the application in a development environment, use the following command:

```bash
npm run dev
```

This will start the development server, typically on `http://localhost:3000`. The port `9002` is specified in `package.json`.

Other available scripts:
- `npm run build`: To create a production-ready build.
- `npm run start`: To start the production server after building.
- `npm run lint`: To run the linter and check for code quality issues.

## Configuration

This project requires a set of environment variables to connect to Firebase services.

1.  Create a `.env.local` file in the root of your project.
2.  Add the following environment variables to the `.env.local` file:

    ```env
    # Firebase Service Account (encoded in base64)
    # Required for admin tasks (e.g., in `src/lib/firebase/admin.ts`)
    FIREBASE_SERVICE_ACCOUNT_BASE64=

    # Public Firebase Configuration
    # Used for client-side Firebase initialization
    NEXT_PUBLIC_FIREBASE_PROJECT_ID=
    NEXT_PUBLIC_FIREBASE_API_KEY=
    NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=
    NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=
    NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=
    NEXT_PUBLIC_FIREBASE_APP_ID=
    ```

You can obtain these keys from your Firebase project console. The `FIREBASE_SERVICE_ACCOUNT_BASE64` is a base64-encoded version of your Firebase service account JSON file.
