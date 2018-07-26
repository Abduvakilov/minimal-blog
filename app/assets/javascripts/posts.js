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

    document.querySelector('#editor h2').addEventListener('keypress', goToNext);
    document.querySelector('#editor address').addEventListener('keypress', goToNext);

    function goToNext (e) {
        if (e.keyCode === 13) {
            e.target.nextSibling.focus();
            e.preventDefault();
        }
    }

});