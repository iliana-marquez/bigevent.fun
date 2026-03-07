# bigevent.fun
Public
assets/ → (JS, CSS, images)
bin/ → (console entrypoints)
config/ → (but ensure no secrets)
migrations/ → (database migrations)
public/ → (web entry point like index.php)
src/ → -(all PHP code)
templates/ → (Twig templates)
tests/ → optional, to showcase testing
translations/ 

Files to include:
composer.json & composer.lock → (dependencies)
phpunit.xml.dist → optional
symfony.lock → if exists (locks bundles versions)

README.md → yes

Files/folders to exclude (.gitignore)
.env.local (contain DB credentials)
.env.prod / .env.test (any sensitive environment files)
vendor/ (dependencies can be rebuilt via Composer)
var/ (cache/logs)
.idea/ or .vscode/ (IDE settings)
compose.override.yaml
compose.yaml
.env