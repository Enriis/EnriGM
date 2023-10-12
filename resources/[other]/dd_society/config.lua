ConfigLavori = {
    ["police"] = {
        illegale = true,

        label = "LSPD",

        Outfits = {
            ['outfits_police'] ={
                testo_notifica = "per cambiare vestiti",
                coords = vec3(0,0,0),
                grado_minimo_accesso = 0,
            }
        },


        Marker = {
            color = vec4(77, 87, 200,255),
            scale = vec3(0.4,0.4,0.4),
            interact = vec3(1.3,1.3,1.3), 
            id = 2,
            drawDistance = 5
        },

        BossMenu = {
            ["bossmenu_police_1"] = {
                testo_notifica = "per aprire il Boss Menu",
                coords = vec3(81.40650177002,-1965.6707763672,18.04319190979),
                grado_minimo_accesso = 0,
            }
        },

        Depositi = {
            ["deposito_police_1"] = {
                testo_notifica = "per aprire il Deposito",
                coords = vec3(45.204399, -1996.549438, 3.415405),
                grado_minimo_accesso = 0,
                peso = 100, --kg
                slot = 100.0
            },

            ["deposito_police_2"] = {
                testo_notifica = "per aprire il Deposito",
                coords = vec3(83.33797454834,-1960.4744873047,18.04319190979),
                grado_minimo_accesso = 0,
                peso = 100, --kg
                slot = 100.0
            }
        },

        Garage = {
            ["garage_police"] = {
                prefix_plate = "BLS",
                veicoli = {
                    {
                        label = "Blista",
                        model = "blista",
                        grado_minimo = 0,
                        color1 = vec3(255, 255, 0),    
                        color2 = vec3(255, 255, 0),                         
                        livery = 0                                         
                    },
                },

                deposito = {
                    testo_notifica = "per aprire il garage",
                    grado_minimo_accesso = 0,
                    coords = vec3(87.429557800293,-1968.8566894531,20.747457504272)
                },

                ritiro = {
                    testo_notifica = "per parcheggiare il veicolo",
                    grado_minimo_accesso = 0,
                    coords = vec3(83.800720214844,-1973.7010498047,20.930276870728)
                },
                
                spawn = vec4(87.429557800293,-1968.8566894531,20.747457504272, 200)
            }
        },

    },
}