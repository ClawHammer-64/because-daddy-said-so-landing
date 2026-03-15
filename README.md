# Because Daddy Said So — Landing Page

Single‑page landing site for the Because Daddy Said So Etsy shop.

## Live link
- Etsy: https://etsy.com/shop/BecauseDaddySaidSo

## Structure
- `index.html`
- `css/styles.css`
- `assets/` (place generated images here)

## Run locally
Open `index.html` in your browser.

## Deploy
- GitHub Pages (static site)
- Netlify / Vercel (static)

### AWS (S3 + CloudFront) via Terraform + GitHub Actions
Terraform lives in `infra/` and provisions:
- Private S3 bucket with CloudFront OAC
- CloudFront distribution
- ACM certificate (us-east-1) for `becausedaddysaidso.shop`
- Route53 hosted zone + alias records

GitHub Actions deploys on push to `main` using OIDC (role ARN in `AWS_ROLE_ARN`).

#### First-time setup
1. Create the S3 backend bucket `bdss8dk21` in `us-east-2` (once).
2. Run Terraform locally or via GitHub Actions to create the Route53 hosted zone.
3. Delegate the domain at your registrar using the `nameservers` output.
4. Re-run Terraform once delegation is active so ACM validation can complete.

#### DNS records
Terraform creates the apex `A` and `AAAA` alias records pointing to CloudFront.
You only need to set the registrar NS records to the `nameservers` output.

#### Useful outputs
Run from `infra/`:
```
terraform output nameservers
terraform output cloudfront_domain
terraform output cloudfront_distribution_id
terraform output s3_bucket_name
```

## Image generation
If you want AI images, generate and drop them into `assets/`:
- `hero-placeholder.jpg`
- `product-yes-sir.jpg`
- `product-good-girl.jpg`
- `product-daddys-girl.jpg`

Suggested styles: boudoir‑lux, dark tones, red accents.

Update the CSS `background-image` paths to use the generated images.
