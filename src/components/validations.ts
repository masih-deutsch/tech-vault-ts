import { z } from 'zod/v4';


export const SignupSchema = z.object({
  name: z.string().trim().min(1, { message: "need at least one character" }).max(50, { message: "maximum characters are 50" }),
  email: z.string().email().toLowerCase(),
  password: z.string().min(8, { message: "password should be at least 8 character" }).max(22),
});


export const LibraryItemScheme = z.object({
  name: z.string().trim().min(3).max(50),
  category: z.enum(["UI Components", "State Management", "Data Fetching", "Animation", "Routing"]),
  description: z.string().trim().min(10).max(300),
  installCommand: z.string().trim().min(5),
  // docsUrl: z.url("Please enter a valid URL"),
  docsUrl: z.string().url({ message: "Please enter a valid URL" }),
});