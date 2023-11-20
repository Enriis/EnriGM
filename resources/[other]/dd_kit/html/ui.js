var UIVisible = false;

function display(bool) {
    if (bool) {
        $(".showwback").fadeIn(500)
        $(".containerMain-hot").fadeIn(200)
    } else {
        $(".showwback").fadeOut(100)
        $(".containerMain-hot").fadeOut(200)
    }
}

$(".control-group-hot").hover(function(){
});

display(false)

$(document).ready(function(){
    window.addEventListener('message', function(event){
        display(event.data.apri);
    });
});



$('.container-hot').on("click", event => {
    const clickedElement = $(event.target);
    var clickedBtnID = $(clickedElement).attr('id')
    $.post('https://dd_kit/confermaKit', JSON.stringify({ id: clickedBtnID }));
    display(false);
});