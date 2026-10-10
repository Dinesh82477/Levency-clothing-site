LEVENCY CLOTHING WEBSITE — OWNER SETUP PACKAGE

FILES
- index.html: public storefront
- admin.html: sign-in page for product management
- config.js: your Supabase project URL and publishable/anon key (placeholders now)
- supabase-setup.sql: product table and storage access policies
- assets/levency-logo.png: your supplied logo

IMPORTANT LIMITATION
This is a deployment-ready starter package, not yet a live website. I cannot register a domain, create accounts in your name, or publish to an account I do not control. You must do the account steps below yourself so the domain, hosting and data remain yours. Do not send me passwords, verification codes, or secret/service-role keys.

STEP 1 — CREATE YOUR OWN PRODUCT DATABASE / LOGIN
1. Open https://supabase.com/ and create an account using your own email. Create a new project and keep its login details private.
2. In the project dashboard, open SQL Editor, paste the contents of supabase-setup.sql and run it.
3. In Authentication > Users, add a user with your own admin email and a strong password. Do NOT enable public sign-ups for this store. Only people you intentionally add as users should be able to manage products.
4. In Project Settings / Connect, copy the Project URL and the publishable key (or legacy anon key). Never use a service_role/secret key in a website.
5. Open config.js in a text editor and replace the two PASTE_ placeholders with those values.

STEP 2 — TEST
Open index.html to see the storefront. Open admin.html to log in, add product name/category/price/sizes/photo/description, edit products, or delete them. Once Supabase is configured and the SQL has run, products added in admin appear in the storefront.

STEP 3 — PUBLISH WITH YOUR OWN ACCOUNT
1. Create your own GitHub account at https://github.com/ (or use an account you already own). Create a public repository named levency-clothing-site. Upload all files and folders from this package (not the ZIP file itself).
2. In repository Settings > Pages, choose Deploy from a branch, select main and / (root), then Save. Wait for GitHub Pages to show the live URL.
3. Keep the repository and all accounts under your own email. Anyone can view source files in a public repository, so config.js must contain only the public/publishable key, never a secret key. The database security policies are what protect admin operations.

STEP 4 — YOUR OWN DOMAIN
1. Check whether your preferred domain is available at a reputable registrar, then purchase it while signed in to your own account. levency.lk / levency.com are examples only; availability and pricing are not guaranteed.
2. In GitHub repository Settings > Pages > Custom domain, enter the exact domain you bought.
3. Follow the DNS records shown by GitHub and your registrar. Enable HTTPS once available. DNS propagation can take up to 24 hours.

SECURITY / BACKUP
- Keep your email, hosting, domain registrar and Supabase accounts under your control; enable two-factor authentication.
- Never share passwords, OTPs or service_role/secret keys.
- The SQL policies allow authenticated Supabase users to manage products. Keep public sign-ups disabled and only create admin users you trust.
- Test product create/edit/delete and image uploads before advertising the site.
- This package does not include online card payments, courier integration, stock tracking, or a full checkout/order database. Orders are enquiries via WhatsApp.

OFFICIAL GUIDES
GitHub Pages: https://docs.github.com/en/pages
Custom domain: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site
Supabase Auth: https://supabase.com/docs/guides/auth
