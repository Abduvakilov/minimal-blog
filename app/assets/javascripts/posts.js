document.addEventListener("turbolinks:load", function() {

    let h1 = new MediumEditor('#editor h2', {
        placeholder: {
            text: 'Title',
            hideOnClick: false,
        }
    }).stopSelectionUpdates();

    let address = new MediumEditor('#editor address', {
        placeholder: {
            text: 'Your name',
            hideOnClick: false,
        }
    }).stopSelectionUpdates();

    let article = new MediumEditor('#editor article', {
        placeholder: {
            text: 'Your story...',
            hideOnClick: false,
        }
    });

    document.querySelector('#editor h2').addEventListener('keydown', goToNext);
    document.querySelector('#editor address').addEventListener('keydown', goToNext);
    document.querySelector('#editor address').addEventListener('keydown', goToPrev);
    document.querySelector('#editor article').addEventListener('keydown', goToPrev);

    function goToNext (e) {
        if (e.keyCode === 13 || e.keyCode === 40) {
            e.target.nextSibling.focus();
            e.preventDefault();
        }
    }

    function goToPrev (e) {
        if ((e.keyCode === 8 && !e.target.innerText.trim()) || e.keyCode === 38) {
            e.target.previousSibling.focus();
            e.preventDefault();
        }
    }

});