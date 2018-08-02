$(document).on("turbolinks:load", function() {
  if (!$('#editor')) {
    return;
  }
  let $title = $('#editor h2');
  new MediumEditor($title, {
    placeholder: {
      text: $title.data('label'),
      hideOnClick: false,
      keyboardCommands: false,
    },
    toolbar: false,
  });

  let $article = $('#editor .article');
  new MediumEditor($article, {
    placeholder: {
      text: $article.data('placeholder'),
      hideOnClick: false,
    },
  });

  $title.on('keydown', goToNext);
  $article.on('keydown', goToPrev);

  $('#publish').click(publish);

  function goToNext (e) {
    if (e.keyCode === 13 || e.keyCode === 40) {
      e.target.nextSibling.focus();
      e.preventDefault();
    }
  }

  function goToPrev (e) {
    if (( e.keyCode==8 || e.keyCode==38 ) && !e.target.innerText.trim()) {
      e.target.previousSibling.focus();
      e.preventDefault();
    }
  }

  let timeout;
  function publish (e) {
    let $target = $(e.target);
    let token = $('meta[name=csrf-token]').attr('content');
    $.ajax({
      url: $target.data('url')+'.json',
      type: $target.data('method'),
      data: {
        authenticity_token: token,
        post: {
          title: $title.text(),
          body: $article.html(),
        },
      },
      error: e => {
        // console.log(e);
        let errors = e.responseJSON;
        if (!errors) {
            return;
        }
        let $error = $target.next();
        if ('title' in errors) {
          $title.addClass('invalid').focus();
          $error.html('Title ' + errors['title'][0]);
        } else if ('body' in errors) {
          $article.addClass('invalid').focus();
          $error.html('Body ' + errors['body'][0]);
        } else {
          $error.html('Something went wrong. Try later.')
        }
        clearTimeout(timeout);
        timeout = setTimeout(() => {
          $title.add($article).removeClass('invalid');
          $error.fadeOut( 600, () => $error.empty().show() );
        }, 5000)
      },
      success: r => {
        Turbolinks.visit(r['url']);
      }
    })
  }

});