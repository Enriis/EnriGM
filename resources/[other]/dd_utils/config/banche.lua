ConfigBanche = { 
    ["fleeca"] =  {
        pos = vector3(1007.7835083008,-454.07388305664,63.941902160645),
        label = "Fleeca Bank",
        grado = 2,
        tasse = 10000,
        fondo = 2000000
    },

    ["pacific"] =  {
        pos = vector3(1007.1968994141,453.98190307617,95.001609802246),
        label = "Pacific Bank",
        grado = 0,
        tasse = 85000,
        fondo = 100000000
    }
}

ConfigPrestiti = {
    giorni = 14
}

ConfigImpostazioniBanca = {
    lavoro = false,
    black = vector3(-2222.5639648438,304.18725585938,174.60188293457),
    tentativi = 2,
    jobPolizia = "police",
    notification = "df_alert"
}

--[[
    Gradi 

    0 - Minore ( Massimo 3'000'000 per account, tag 5% )
    1 - Medio ( Massimo 1'000'000 per account, tag 10% )
    2 - Alto ( Massimo 500'000 per account, tag 15% )
    3 - Massimo ( Massimo 200'000 per account, tag 20% )
]]

--[[
    grado = rischio per investimenti, 
    tasse = tasse apertura conto,
    fondo = saldo disponibile per presiti ecc 
]]

--[[
    CLIENT SIDE

    -- Rivistare sistema fatture e adattarlo a questo tipo di banche
    
    -- Decidere se limitare le crazioni di conti

    -- Aggiungere reciclaggio tramite banca

    -- Decidere se sviluppare tutto in un unico menu 

]]

--[[

    IMPOSTAZIONI BANCA

    -   Creare sistama furto conti
    -   Avvisare forze dell'ordine in caso di errore di accesso
    -   Capire che informazioni comunicare
    -   Login tramite iban e pin
    -   In caso di infomazioni corrette aprire menu default azioni
    -   Limitare i prelievi al 20§ del saldo del conto, giornalmente
    -   Sistam log discord webook 

]]