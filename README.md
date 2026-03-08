# bigevent.fun 
A Symfony web application for managing entertainment and performing arts events.

![Event Details Screenshot](/public/images/event-details.png)


#### Key Features:

Event Management: 
- Browse Events — Grid display with event cards showing image, name, date, location, and category
- Event Details — Full event information page with venue, contact, and description
- Create / Edit / Delete — Full CRUD functionality for event management

Search & Filter
- Category Filter — Filter events by Concert, Festival, Party, Performing Arts, or Food & Drink
- AJAX Live Search — Real-time search as you type, updating results without page reload
- Universal Search — Search works from any page with intelligent redirect fallback


## Project Goal: Identify similarities between **Symfony (PHP)** and **Django (Python)**


This project was refactored to revisit Symfony and PHP after focusing primarily on Python and Django development, to understand the transferable architectural concepts between backend frameworks and to explore more deeply the core principles of object-oriented programming (OOP).

Modeling application data as objects and delegating database interactions to an ORM (Doctrine), demonstrate how modern frameworks can build robust architectures while maintaining clear separation of concerns and reusable components, seamlessly handling complex SQL operations in the background.

This document explains the **core architectural similarities** between the two frameworks so developers familiar with one can quickly understand the other.

---

# 1. Framework Philosophy

Both Symfony and Django are **full-stack backend frameworks** designed to help developers build structured, maintainable web applications.

| Concept         | Symfony                     | Django                    | Purpose                       |
| --------------- | --------------------------- | ------------------------- | ----------------------------- |
| Language        | PHP                         | Python                    | Programming language used     |
| Architecture    | MVC (Model-View-Controller) | MTV (Model-Template-View) | Separation of concerns        |
| ORM             | Doctrine ORM                | Django ORM                | Database abstraction          |
| Template Engine | Twig                        | Django Templates          | Rendering HTML                |
| Routing         | YAML / Attributes / PHP     | urls.py                   | Map URLs to controllers/views |
| CLI Tool        | Symfony Console             | manage.py                 | Project management commands   |

Despite different terminology, **the underlying architecture is nearly identical**.

---

# 2. MVC vs MTV

Symfony uses **MVC** while Django uses **MTV**, but they map almost 1:1.

| Symfony        | Django   | Responsibility                |
| -------------- | -------- | ----------------------------- |
| Controller     | View     | Handles HTTP requests         |
| Entity / Model | Model    | Represents database structure |
| Twig Template  | Template | Renders HTML UI               |
| Routes         | URLs     | Connect URL → controller/view |

Example flow:

```
Symfony
Route → Controller → Entity → Twig Template
```

```
Django
URL → View → Model → Template
```

Same flow but slightly differnt names: Symfony MVC & Diango MVT

---

# 3. Object-Oriented Data Modeling

Both frameworks rely heavily on **Object-Oriented Programming (OOP)**.

Database tables are represented as **classes**.

## Symfony Entity Example

```php
#[ORM\Entity]
class Event
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length:255)]
    private ?string $title = null;
}
```

## Django Model Example

```python
class Event(models.Model):
    title = models.CharField(max_length=255)
```

### Key Similarities

| Concept                    | Symfony (Doctrine)  | Django            |
| -------------------------- | ------------------- | ----------------- |
| Class represents table     | Entity              | Model             |
| Property represents column | Field               | Field             |
| ID field                   | `@ORM\Id`           | AutoField         |
| Migrations                 | Doctrine Migrations | Django Migrations |

Both frameworks generate database schemas from **object definitions**.

---

# 4. Database Layer (ORM)

Both frameworks include an **Object Relational Mapper (ORM)**.

This allows developers to interact with the database using **objects instead of SQL**.

### Symfony Example

```php
$events = $eventRepository->findAll();
```

### Django Example

```python
events = Event.objects.all()
```

Both return **collections of objects** representing database rows.

| Feature              | Symfony (Doctrine) | Django ORM |
| -------------------- | ------------------ | ---------- |
| Query builder        | Yes                | Yes        |
| Lazy loading         | Yes                | Yes        |
| Relationship mapping | Yes                | Yes        |
| Migration system     | Yes                | Yes        |

---

# 5. Routing System

Routing connects **URLs to application logic**.

## Symfony Route Example

```php
#[Route('/events', name: 'app_events_index')]
public function index(): Response
```

## Django URL Example

```python
path('events/', views.events, name='events')
```

| Concept          | Symfony          | Django     |
| ---------------- | ---------------- | ---------- |
| Route definition | Attribute / YAML | urls.py    |
| Route name       | name=            | name=      |
| URL parameters   | `{id}`           | `<int:id>` |

Both frameworks map **HTTP requests → application logic**.

---

# 6. Controllers vs Views

Controllers (Symfony) and Views (Django) handle the **business logic**.

### Symfony Controller

```php
public function index(EventRepository $repository): Response
{
    $events = $repository->findAll();

    return $this->render('events/index.html.twig', [
        'events' => $events
    ]);
}
```

### Django View

```python
def events(request):
    events = Event.objects.all()
    return render(request, 'events/index.html', {'events': events})
```

Both follow the same pattern:

```
request → fetch data → render template
```

---

# 7. Template Engines

Both frameworks use **template engines** to render HTML.

| Feature              | Twig (Symfony)   | Django Templates |
| -------------------- | ---------------- | ---------------- |
| Variable output      | `{{ variable }}` | `{{ variable }}` |
| Loops                | `{% for %}`      | `{% for %}`      |
| Conditions           | `{% if %}`       | `{% if %}`       |
| Template inheritance | Yes              | Yes              |

Example Twig:

```twig
{% for event in events %}
    <h2>{{ event.title }}</h2>
{% endfor %}
```

Example Django:

```django
{% for event in events %}
    <h2>{{ event.title }}</h2>
{% endfor %}
```

Almost identical syntax.

---

# 8. Command Line Tools

Both frameworks provide powerful CLI tools.

| Symfony                       | Django             | Purpose                    |
| ----------------------------- | ------------------ | -------------------------- |
| `php bin/console`             | `python manage.py` | Execute framework commands |
| `make:entity`                 | `startapp`         | Generate components        |
| `doctrine:migrations:migrate` | `migrate`          | Update database            |
| `cache:clear`                 | automatic reload   | Clear application cache    |

Example:

```
Symfony
php bin/console doctrine:migrations:migrate
```

```
Django
python manage.py migrate
```

---

# 9. Project Structure Comparison

## Symfony

```
src/
  Controller/
  Entity/
templates/
config/
public/
```

## Django

```
project/
  app/
    models.py
    views.py
    urls.py
templates/
static/
```

| Symfony Folder   | Django Equivalent | Purpose        |
| ---------------- | ----------------- | -------------- |
| `src/Controller` | `views.py`        | Request logic  |
| `src/Entity`     | `models.py`       | Data models    |
| `templates`      | `templates`       | HTML templates |
| `public`         | `static`          | Static assets  |
| `config`         | `settings.py`     | Configuration  |

---

# 10. Summary

Although Symfony and Django use different programming languages, they share **the same architectural principles**:

| Core Concept           | Shared Approach            |
| ---------------------- | -------------------------- |
| Object-oriented models | Database tables as classes |
| MVC-style architecture | Separation of concerns     |
| ORM systems            | Database abstraction       |
| Template engines       | Dynamic HTML rendering     |
| Routing systems        | URL → application logic    |
| CLI tools              | Project management         |

Understanding one framework makes it **much easier to learn the other**.

---
# Project Learning Takeaways:

## 1. Turbo + Search Debugging

**Issue 1:** Bootstrap Dropdowns Break After Navigation
Context: Symfony 6.3+ bundles Turbo by default. Turbo intercepts clicks and swaps <body> via AJAX for SPA-like speed. But Bootstrap initializes components on DOMContentLoaded, which only fires once AND not after Turbo swaps content.

- Symptom: Dropdown works on first load, breaks after clicking any link.
- Fix: Disable Turbo globally (appropriate for simple Bootstrap projects):
```html
<body data-turbo="false">
```
Alternative for complex apps: Use turbo:load event or Stimulus controllers to re-initialize Bootstrap.

**Issue 2:** Search Only Worked on Index Page

AJAX search updates #events-grid directly. But detail/edit/create pages don't have that element, the search bar sits in the navbar (via base.html.twig) but has nowhere to render results.
- Symptom: Typing in search on details page did nothing.
- Fix: Check for grid, redirect if missing:

````javascript
function performSearch(query) {
    if (!eventsGrid) {
        // No grid on this page → redirect to index with query
        window.location.href = `/events/?q=${encodeURIComponent(query)}`;
        return;
    }
    
    // Grid exists → AJAX update
    fetch(`/events/search?q=${encodeURIComponent(query)}`)
        .then(response => response.text())
        .then(html => {
            eventsGrid.innerHTML = html;
        });
}
````

**Issue 3:** Redirect Cleared Search Input, No Results Shown

Redirecting to `/events/?q=adele` worked, but page loaded with empty input and "ALL EVENTS" and the user had to type again.
- Symptom: URL showed ?q=adele but results weren't displayed.
- Fix: Read URL param on load, populate input, auto-execute search:
```javascript
const queryParam = new URLSearchParams(window.location.search).get('q');

if (queryParam) {
    searchInput.value = queryParam;
    if (eventsGrid) {
        performSearch(queryParam);
    }
}
```

## 2. Deployment

### SSH Workflow: Direct Server Access

Before (slow):

`Edit locally → Upload via FTP/Dashboard → Test → Repeat`


After (fast):
```bash
# Local: commit and push
Local: commit and push
git add .
git commit -m "fix: something"
git push

# Server: SSH in and pull
ssh -p PORT user@bigevent.fun
cd ~/domains/bigevent.fun
git pull
composer install --no-dev
php bin/console cache:clear --env=prod
```

Key commands:
```bash
ssh -p 65002 username@domain.com  # Connect
pwd                                   # Where am I?
ls -la                                # What's here?
cd ~/domains/bigevent.fun            # Navigate
nano filename                        # Edit file
cat filename                         # View file
rm -rf folder/                       # Delete folder
ln -s target link                    # Create symlink
```

---

### Environment Files

| File | Purpose | In Git? |
|------|---------|---------|
| `.env` | Base defaults, safe values only | ✅ Yes |
| `.env.local` | Real secrets, server-specific | ❌ Never |

**Why both?**

Symfony loads `.env` first, then `.env.local` overrides it. This allows:
- Safe defaults in version control
- Real secrets only on server

**Your `.env`:**
```
APP_ENV=prod
```

**Your `.env.local` (server only):**
```bash
APP_ENV=prod
APP_SECRET=your_32_char_secret
DATABASE_URL="mysql://user:password@localhost:3306/database_name"
```

### Hostinger vs Heroku: 

| Platform | Where secrets go |
|----------|------------------|
| Heroku | Dashboard → Config Vars |
| Railway | Dashboard → Variables |
| Hostinger | `.env.local` file via SSH |

## .htaccess: Apache URL Routing
Symfony uses a single entry point (index.php). Apache needs instructions:
```Apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    
    # Redirect homepage to /events/
    RewriteRule ^$ /events/ [R=301,L]
    
    # If file exists, serve it directly (CSS, JS, images)
    RewriteCond %{REQUEST_FILENAME} !-f
    
    # Otherwise, send everything to index.php
    RewriteRule ^(.*)$ index.php [QSA,L]
</IfModule>
```

**What this does:**
- `bigevent.fun/` → redirects to `/events/`
- `bigevent.fun/images/logo.svg` → serves the file directly
- `bigevent.fun/events/` → routes through Symfony

**Django comparison:** Django uses `urls.py` + web server config (Gunicorn/nginx). Same concept, different syntax.

---

### Folder Structure on Hostinger
```
~/domains/
├── bigevent.fun/
│   ├── public/              ← Symfony's web root
│   │   ├── index.php
│   │   ├── .htaccess
│   │   └── images/
│   ├── public_html -> public  ← Symlink (Hostinger looks here)
│   ├── src/
│   ├── templates/
│   ├── vendor/
│   ├── var/
│   ├── .env
│   └── .env.local           ← Secrets (not in git)
```

Why the symlink?
- Hostinger expects public_html/
- Symfony uses public/
- Symlink bridges both: public_html -> public


## Full Deployment Checklist

```bash
# 1. SSH into server
ssh -p PORT user@domain.com

# 2. Navigate to domain folder
cd ~/domains/bigevent.fun

# 3. Clone repo (first time only)
git clone https://github.com/user/repo.git .

# 4. Create symlink (first time only)
ln -s public public_html

# 5. Create .env.local with secrets
nano .env.local
# APP_ENV=prod
# APP_SECRET=xxx
# DATABASE_URL="mysql://user:pass@localhost:3306/dbname"

# 6. Create base .env
nano .env
# APP_ENV=prod

# 7. Install dependencies (no dev packages)
composer install --no-dev --optimize-autoloader

# 8. Create .htaccess
nano public/.htaccess

# 9. Set permissions
chmod -R 775 var

# 10. Clear cache and compile assets
php bin/console cache:clear --env=prod
php bin/console asset-map:compile

# 11. Run migrations (if needed)
php bin/console doctrine:migrations:migrate --no-interaction
```

## Updates Workflow
```bash 
# After pushing changes to GitHub:
ssh -p PORT user@domain.com
cd ~/domains/bigevent.fun
git pull
composer install --no-dev --optimize-autoloader
php bin/console cache:clear --env=prod
php bin/console asset-map:compile
```

## Debugging Production Errors
Problem: 500 error, no details shown
Solutions:
1. Check if database works:

```bash
php bin/console doctrine:query:sql "SELECT 1" --env=prod
```

2. Check routes:

``` bash
php bin/console router:match /events/ --env=prod
```

3. Check logs:

```bash
cat var/log/prod.log
```

4. Temporary debug file:
```php
<?php
   // public/debug.php
   ini_set('display_errors', 1);
   error_reporting(E_ALL);
   require dirname(__DIR__).'/vendor/autoload.php';
   $kernel = new App\Kernel('prod', false);
   $request = Symfony\Component\HttpFoundation\Request::createFromGlobals();
   $response = $kernel->handle($request);
   $response->send();
```
Delete debug files when done:
```bash
rm public/debug.php public/test.php
```
## Django/Heroku vs Symfony/Hostinger
| Step | Django + Heroku | Symfony + Hostinger |
|------|-----------------|---------------------|
| Push code | `git push heroku main` | `git push` + SSH + `git pull` |
| Env vars | `heroku config:set KEY=val` | `.env.local` file |
| Install | Auto (detects requirements.txt) | `composer install --no-dev` |
| Static files | `collectstatic` | `asset-map:compile` |
| Migrations | `heroku run python manage.py migrate` | `php bin/console doctrine:migrations:migrate` |
| Logs | `heroku logs --tail` | `cat var/log/prod.log` |
| Process file | `Procfile` | `.htaccess` |

## Deployment Summary

1. **SSH unlocks everything:** No more FTP dragging. Git + SSH = professional workflow.
2. **Environment separation:** .env for defaults, .env.local for secrets. Never commit secrets.
3. **Always cache:clear --env=prod** after changes. Most "broken" deployments are cache issues.
4. **Symlinks bridge conventions:** When framework expects X and host expects Y, symlink them.
5. **Debug systematically:**  Test database, test routes, check logs, create debug file. Isolate the problem.
6. **Production = --no-dev** -> Don't install dev dependencies. DebugBundle broke my prod because dev bundles weren't installed.