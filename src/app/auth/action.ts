'use server';

import { createUser, findUserByEmail, verifyUser } from '@/components/neon';
import { AuthCredentials } from '@/components/authTypes';
import { SignupSchema } from '@/components/validations';
import { z } from 'zod';

interface ActionResponse {
  success: boolean;
  message: string;
  user?: { name: string; email: string; };
}

export async function signUpAction(_prev: ActionResponse | null, formData: FormData,): Promise<ActionResponse> {
  try {

    const payload = Object.fromEntries(formData);
    const { data, success, error } = SignupSchema.safeParse(payload);

    if (!success) {
      return { success: false, message: z.prettifyError(error) };
    }

    const { name, email, password } = data;

    const existing = await findUserByEmail(email);
    if (existing) {
      return { success: false, message: 'Email is already registered' };
    }

    const user = await createUser(name, email, password);
    return {
      success: true,
      message: `Welcome, ${user.name}! Your account has been created.`,
      user: { name: user.name, email: user.email },
    };
  } catch (error) {
    if (error instanceof Error) return { success: false, message: error.message };
    return { success: false, message: 'An unknown error occurred' };
  }
}

export async function signInAction(_prev: ActionResponse | null, formData: FormData,): Promise<ActionResponse> {
  try {
    const email = formData.get('email') as string;
    const password = formData.get('password') as string;

    if (!email || !password) {
      return { success: false, message: 'Email and password are required' };
    }

    const user = await verifyUser({ email, password });
    if (!user) {
      return { success: false, message: 'Invalid email or password' };
    }

    return {
      success: true,
      message: `Welcome back, ${user.name}!`,
      user: { name: user.name, email: user.email },
    };
  } catch (error) {
    if (error instanceof Error) return { success: false, message: error.message };
    return { success: false, message: 'An unknown error occurred' };
  }
}

export async function getLibsAction(query: string, sort: string, credentials: AuthCredentials | null,) {
  const { getLibs } = await import('@/components/neon');
  return getLibs(query, sort, credentials);
}

export async function getBookmarkedLibsAction(credentials: AuthCredentials) {
  const { getBookmarkedLibs } = await import('@/components/neon');
  return getBookmarkedLibs(credentials);
}
