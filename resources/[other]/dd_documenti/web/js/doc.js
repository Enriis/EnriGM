$(function () {

    function documenti(bool) {
        if (bool) {
            $("#contenitore-documenti").show();
        } else {
            $("#contenitore-documenti").hide();
        }
    }

    function patente(bool) {
        if (bool) {
            $("#contenitore-patente").show();
        } else {
            $("#contenitore-patente").hide();
        }
    }

    function toDataUrl(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onload = function() {
            var reader = new FileReader();
            reader.onloadend = function() {
                callback(reader.result);
            }
            reader.readAsDataURL(xhr.response);
        };
        xhr.open("GET", url);
        xhr.responseType = "blob";
        xhr.send();
    }

    window.addEventListener('message', function(event) {

        if (event.data.type === "convert_base64") {
            toDataUrl(event.data.img, function(base64) {
           
                fetch(`https://dd_documenti/base64`, {
                    method: "POST",
                    headers: {"Content-Type": "application/json; charset=UTF-8"},
                    body: JSON.stringify({
                        base64: base64,
                        handle: event.data.handle,
                        id: event.data.id
                    })
                });
            });
        }

        if (event.data.action === "doc") {
            if (event.data.nui == true) {
                $('#contenitore-documenti').css('background-image', `url(https://media.discordapp.net/attachments/1009499094399594598/1020817440277540934/carta_di_identita.png)`)
                $('#immaginePersonale').css('background-image', `url(${event.data.meta.linkImg}`)
                $('#nome').text(event.data.meta.nome)
                $('#cognome').text(event.data.meta.cognome)
                $('#datadinascita').text(event.data.meta.data)
                $('#altezza').text(event.data.meta.alt)
                $('#sesso').text(event.data.meta.sesso)
                $('#firma').text(event.data.meta.nome + event.data.meta.cognome)
                documenti(true)
            }
        } else if (event.data.action == 'docCustom') {
            if (event.data.nui == true) {
                $('#contenitore-documenti').css('background-image', `url(${event.data.immagine})`)
                $('#immaginePersonale').css('background-image', `url(${event.data.img}`)
                $('#nome').text(event.data.nome)
                $('#cognome').text(event.data.cognome)
                $('#datadinascita').text(event.data.data)
                $('#altezza').text(event.data.alt)
                $('#sesso').text(event.data.sesso)
                $('#firma').text(event.data.nome + event.data.cognome)
                documenti(true)
            }
        } else if (event.data.action == 'patente') {
            if (event.data.nui == true) {
                $('#contenitore-documenti').css('background-image', `url(https://media.discordapp.net/attachments/1009499094399594598/1020817440277540934/carta_di_identita.png)`)
                $('#immaginePersonalePatente').css('background-image', `url(${event.data.meta.linkImg}`)
                $('#nomePatente').text(event.data.meta.nome)
                $('#cognomePatente').text(event.data.meta.cognome)
                $('#datadinascitaPatente').text(event.data.meta.data)
                $('#firmaPatente').text(event.data.meta.nome + event.data.meta.cognome)
                if (event.data.meta.drive) {
                    $('.car').css('background-color', 'rgb(81, 255, 0)')
                    $('.car').css('box-shadow', 'rgba(55, 175, 0, 0.623) 0px 15px 28px, rgba(55, 175, 0, 0.658) 0px 8px 8px')
                }
                if (event.data.meta.drive_bike) {
                    $('.bike').css('background-color', 'rgb(81, 255, 0)')
                    $('.bike').css('box-shadow', 'rgba(55, 175, 0, 0.623) 0px 15px 28px, rgba(55, 175, 0, 0.658) 0px 8px 8px')
                }
                if (event.data.meta.drive_truck) {
                    $('.camion').css('background-color', 'rgb(81, 255, 0)')
                    $('.camion').css('box-shadow', 'rgba(55, 175, 0, 0.623) 0px 15px 28px, rgba(55, 175, 0, 0.658) 0px 8px 8px')
                }
                patente(true)
            }
        } else if (event.data.action == "ChiudiDoc") {
            $('#contenitore-documenti').hide();
            $('#contenitore-patente').hide();
            $('#nome').text('')
            $('#cognome').text('')
            $('#datadinascita').text('')
            $('#altezza').text('')
            $('#sesso').text('')
            $('#firma').text('')
            $('#immaginePersonalePatente').css('background-image', ``)
            $('#immaginePersonale').css('background-image', ``)
        }
    })
})