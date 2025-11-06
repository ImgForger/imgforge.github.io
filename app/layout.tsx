import '@/app/global.css';
import { RootProvider } from 'fumadocs-ui/provider/next';
import { Vend_Sans } from 'next/font/google';
import SearchDialog from '@/components/search';

const font = Vend_Sans({
  subsets: ['latin'],
});

export default function Layout({ children }: LayoutProps<'/'>) {
  return (
    <html lang="en" className={font.className} suppressHydrationWarning>
      <body className="flex flex-col min-h-screen">
        <RootProvider
          search={{
            SearchDialog,
          }}
        >
          {children}
        </RootProvider>
      </body>
    </html>
  );
}
