import './bootstrap.js';
/*
 * Welcome to your app's main JavaScript file!
 *
 * This file will be included onto the page via the importmap() Twig function,
 * which should already be in your base.html.twig.
 */
import './styles/app.css';

console.log('This log comes from assets/app.js - welcome to AssetMapper! 🎉');


// AJAX Search
document.addEventListener('DOMContentLoaded', function() {
    const searchForm = document.querySelector('form[role="search"]');
    const searchInput = document.querySelector('input[type="search"]');
    const eventsGrid = document.getElementById('events-grid');
    const eventsTitle = document.getElementById('events-title');

    if (!searchForm || !searchInput || !eventsGrid) return;

    // Ajax instead of form submit
    searchForm.addEventListener('submit', function(e) {
        e.preventDefault();
        performSearch(searchInput.value);
    });

    // Live seach as user types (300ms delay)
    let timeout;
    searchInput.addEventListener('input', function () {
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            performSearch(this.value);
        }, 300);
    });

    function performSearch(query){
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
            })
            .catch(error => {
                console.error('Search error:', error);
            });
    }
});