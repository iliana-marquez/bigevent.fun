import './bootstrap.js';
/*
 * Welcome to your app's main JavaScript file!
 *
 * This file will be included onto the page via the importmap() Twig function,
 * which should already be in your base.html.twig.
 */
import './styles/app.css';

console.log('This log comes from assets/app.js - welcome to AssetMapper! 🎉');


// Re-initialize Bootstrap dropdowns
function initDropdowns() {
    const dropdowns = document.querySelectorAll('[data-bs-toggle="dropdown"]');
    dropdowns.forEach(dropdown => {
        new bootstrap.Dropdown(dropdown);
    });
}

// Initialize search on both regular load and Turbo navigation
function initSearch() {
    const searchForm = document.querySelector('form[role="search"]');
    const searchInput = document.querySelector('input[type="search"]');
    const eventsGrid = document.getElementById('events-grid');
    const eventsTitle = document.getElementById('events-title');

    if (!searchForm || !searchInput) return;
    
    // Remove old listeners by cloning
    const newForm = searchForm.cloneNode(true);
    searchForm.parentNode.replaceChild(newForm, searchForm);
    const newInput = newForm.querySelector('input[type="search"]');

    newForm.addEventListener('submit', function(e) {
        e.preventDefault();
        performSearch(newInput.value);
    });

    // Live seach as user types (300ms delay)
    let timeout;
    newInput.addEventListener('input', function () {
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            performSearch(this.value);
        }, 300);
    });

    function performSearch(query){
        if (!eventsGrid) {
        window.location.href = `/events/?q=${encodeURIComponent(query)}`;
        return;
        }

        fetch(`/events/search?q=${encodeURIComponent(query)}`)
            .then(response => response.text())
            .then(html => {
                eventsGrid.innerHTML = html;
                        
                // Update title
                if (eventsTitle) {
                    eventsTitle.textContent = query
                        ? `"${query}" SEARCH RESULTS`
                        : 'ALL EVENTS';
                }
                initDropdowns();    
            })
            .catch(error => {
                console.error('Search error:', error);
            });
    }
}

document.addEventListener('DOMContentLoaded', initSearch);
document.addEventListener('turbo:load', initSearch);
document.addEventListener('turbo:load', initDropdowns);