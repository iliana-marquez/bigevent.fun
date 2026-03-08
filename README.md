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


#### Main purpose:

This project was refactored to revisit Symfony and PHP after focusing primarily on Python and Django development, to understand the transferable architectural concepts between backend frameworks and to explore more deeply the core principles of object-oriented programming (OOP).

Modeling application data as objects and delegating database interactions to an ORM (Doctrine), demonstrate how modern frameworks can build robust architectures while maintaining clear separation of concerns and reusable components, seamlessly handling complex SQL operations in the background.

## Backend Architecture Notes

### Understanding the similarities between **Symfony (PHP)** and **Django (Python)**

This project was originally built using **Symfony**, a modern PHP backend framework.
Many backend concepts used here are **very similar to Django**, a popular Python framework.

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

Example mapping:

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

# Author

Iliana Márquez
