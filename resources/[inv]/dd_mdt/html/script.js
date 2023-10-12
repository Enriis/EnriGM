function CambiaTestoEColore() {
    document.getElementById("home").textContent="HOME";
}

function CambiaTestoEColore2() {
    document.getElementById("home").textContent="GESTIONE ATTIVITA";
}


$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    function Pagina0(bool) {
        if (bool) {
            $("#pagina0").show();
        } else {
            $("#pagina0").hide();
        }
    }

    Pagina0(true)

    function Pagina1(bool) {
        if (bool) {
            $("#pagina1").show();
        } else {
            $("#pagina1").hide();
        }
    }

    Pagina1(false)

    function Pagina2(bool) {
        if (bool) {
            $("#pagina2").show();
        } else {
            $("#pagina2").hide();
        }
    }

        Pagina2(false)

    function Pagina3(bool) {
        if (bool) {
            $("#pagina3").show();
        } else {
            $("#pagina3").hide();
        }
    }

    Pagina3(false)


    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.tipo === "pagina") {
            if (item.stato == true) {
                display(true)
            } else {
                display(false)
            };
        } else if (item.tipo === "carica") {
            console.log("Informazioni Caricate");
            // document.getElementById("home").textContent="GESTIONE ATTIVITA " + item.soc;
            // document.getElementById("finanze").textContent="Gestione finanze " + item.soc;
            // document.getElementById("dipendenti").textContent="Gestione dipendenti " + item.soc;
            // document.getElementById("soldi").textContent="Conto Società: $" + item.soldi + "";
            // document.getElementById("soldisp").textContent="Contanti Sporchi: $" + item.sporchi + "";
            // document.getElementById("fattureinarrivo").textContent="Totale fatture non pagate: $" + item.fatture + "";
        };
    })

    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post("http://dd_mdt/chiudi", JSON.stringify({}));
            return
        }
    };

    $("#pguser").click(function(){
        Pagina0(true)
        Pagina1(false)
        Pagina2(false)
        Pagina3(false)
    })

    $("#cpagina1").click(function(){
        Pagina0(false)
        Pagina1(true)
        Pagina2(false)
        Pagina3(false)
    })

    $("#cpagina2").click(function(){
        Pagina0(false)
        Pagina1(false)
        Pagina2(true)
        Pagina3(false)
    })

    $("#cpagina3").click(function(){
        Pagina0(false)
        Pagina1(false)
        Pagina2(false)
        Pagina3(true)
    })

        // Definisci l'array dei risultati di ricerca
    var resultsArray = [
        'Dio Bestia'
    ];

    // Ottieni riferimenti agli elementi HTML
    var searchInput = document.getElementById('searchInput');
    var searchButton = document.getElementById('searchButton');
    var searchResults = document.getElementById('searchResults');

    // Aggiungi un gestore di eventi al pulsante di ricerca
    searchButton.addEventListener('click', function() {
        var keyword = searchInput.value.toLowerCase(); // Ottieni la parola chiave di ricerca in minuscolo

        // Effettua la logica di ricerca
        var searchMatches = resultsArray.filter(function(result) {
            return result.toLowerCase().includes(keyword); // Filtra i risultati corrispondenti alla parola chiave
        });

        // Mostra i risultati della ricerca
        if (searchMatches.length > 0) {
            var resultsHTML = '<ul>';
            searchMatches.forEach(function(match) {
                resultsHTML += '<li>' + match + '</li>';
            });
            resultsHTML += '</ul>';
            searchResults.innerHTML = resultsHTML;
        } else {
            searchResults.innerHTML = 'Nessun risultato trovato.';
        }
    });


    // $("#close").click(function () {
    //     $.post('http://dd_mdt/exit', JSON.stringify({}));
    //     return
    // })

    // $("#submit").click(function () {
    //     let inputValue = $("#input").val()
    //     if (inputValue.length >= 100) {
    //         $.post("http://dd_mdt/error", JSON.stringify({
    //             error: "Input was greater than 100"
    //         }))
    //         return
    //     } else if (!inputValue) {
    //         $.post("http://dd_mdt/error", JSON.stringify({
    //             error: "There was no value in the input field"
    //         }))
    //         return
    //     }
    //     $.post("http://dd_mdt/main", JSON.stringify({
    //         text: inputValue,
    //     }));
    //     return;
    // })


        
    // Push item to list 

    // var list = document.getElementById('demo');

    // function changeText2() {
    //     var firstname = document.getElementById('firstname').value;
    //     document.getElementById('boldStuff2').innerHTML = firstname;
    //     var entry = document.createElement('li');
    //     entry.appendChild(document.createTextNode(firstname));
    //     list.appendChild(entry);
    // }
})


// CONTATTA UN VERO DEV E FATTI AIUTARE SEI UNA CAPRA (DIO PORCO)