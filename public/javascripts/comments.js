$(function() {
    $('button.reply').click(function() {
        $(this).hide().parent().find('form').show();
    });
});