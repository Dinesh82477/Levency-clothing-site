-- Run this in Supabase Dashboard > SQL Editor for your own project.
create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text not null default 'Other',
  price_lkr numeric(12,2) not null default 0 check (price_lkr >= 0),
  sizes text not null default '',
  description text not null default '',
  image_url text,
  created_at timestamptz not null default now()
);
alter table public.products enable row level security;
drop policy if exists "Public can view products" on public.products;
create policy "Public can view products" on public.products for select using (true);
drop policy if exists "Authenticated admins manage products" on public.products;
create policy "Authenticated admins manage products" on public.products for all to authenticated using (true) with check (true);
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('product-images', 'product-images', true, 5242880, array['image/jpeg','image/png','image/webp','image/avif'])
on conflict (id) do update set public = true, file_size_limit = 5242880, allowed_mime_types = array['image/jpeg','image/png','image/webp','image/avif'];
drop policy if exists "Public can view product images" on storage.objects;
create policy "Public can view product images" on storage.objects for select using (bucket_id = 'product-images');
drop policy if exists "Authenticated admins upload product images" on storage.objects;
create policy "Authenticated admins upload product images" on storage.objects for insert to authenticated with check (bucket_id = 'product-images');
drop policy if exists "Authenticated admins update product images" on storage.objects;
create policy "Authenticated admins update product images" on storage.objects for update to authenticated using (bucket_id = 'product-images') with check (bucket_id = 'product-images');
drop policy if exists "Authenticated admins delete product images" on storage.objects;
create policy "Authenticated admins delete product images" on storage.objects for delete to authenticated using (bucket_id = 'product-images');
