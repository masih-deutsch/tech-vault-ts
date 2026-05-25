'use client';

import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { Compass, Layers, LogIn, LogOut, Radar, UserPlus } from 'lucide-react';
import { usePathname } from 'next/navigation';
import { useEffect, useState } from 'react';
import { clearAuthCredentials, getAuthCredentials } from './authStorage';

export default function Navbar() {
  const path = usePathname();
  const router = useRouter();
  const [name, setName] = useState<string | null>(null);

  useEffect(() => {
    const credentials = getAuthCredentials();
    setName(credentials?.name ?? null);
  }, [path]);

  function handleSignOut() {
    clearAuthCredentials();
    setName(null);
    router.push('/');
    router.refresh();
  }

  return (
    <nav className="sticky top-0 z-20 border-b border-slate-800 bg-slate-900/50 p-4 backdrop-blur-md">
      <div className="mx-auto flex max-w-6xl items-center justify-between">
        <h1 className="flex items-center gap-2 text-2xl font-bold text-cyan-400">
          <Layers />
          DevStack<span className="text-slate-100">Vault</span>
        </h1>
        <div className="flex items-center space-x-6">
          <Link
            href="/"
            className={
              path === '/'
                ? 'flex items-center gap-1 font-medium text-cyan-400'
                : 'flex items-center gap-1 text-slate-400 transition hover:text-cyan-300'
            }>
            <Compass />
            Explore
          </Link>
          <Link
            href="/mylib"
            className={
              path === '/mylib'
                ? 'flex items-center gap-1 font-medium text-cyan-400'
                : 'flex items-center gap-1 text-slate-400 transition hover:text-cyan-300'
            }>
            <Radar /> My Tech Radar
          </Link>

          {name ? (
            <div className="flex items-center gap-4">
              <span className="text-sm text-slate-400">{name}</span>
              <button
                onClick={handleSignOut}
                className="flex items-center gap-1 text-slate-400 transition hover:text-rose-400">
                <LogOut className="h-4 w-4" />
                Sign Out
              </button>
            </div>
          ) : (
            <div className="flex items-center gap-4">
              <Link
                href="/sign-in"
                className={
                  path === '/sign-in'
                    ? 'flex items-center gap-1 font-medium text-cyan-400'
                    : 'flex items-center gap-1 text-slate-400 transition hover:text-cyan-300'
                }>
                <LogIn className="h-4 w-4" />
                Sign In
              </Link>
              <Link
                href="/sign-up"
                className={
                  path === '/sign-up'
                    ? 'flex items-center gap-1 font-medium text-cyan-400'
                    : 'flex items-center gap-1 text-slate-400 transition hover:text-cyan-300'
                }>
                <UserPlus className="h-4 w-4" />
                Sign Up
              </Link>
            </div>
          )}
        </div>
      </div>
    </nav>
  );
}
