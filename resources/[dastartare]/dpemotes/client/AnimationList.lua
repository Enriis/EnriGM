DP = {}

DP.Expressions = {
    ['Arrabbiato'] = {'Expression', 'mood_angry_1'},
    ['Ubriaco'] = {'Expression', 'mood_drunk_1'},
    ['Ferito'] = {'Expression', 'pose_injured_1'},
    ['Folgorato'] = {'Expression', 'electrocuted_1'},
    ['Scontroso'] = {'Expression', 'effort_1'},
    ['Scontroso2'] = {'Expression', 'mood_drivefast_1'},
    ['Scontroso3'] = {'Expression', 'pose_angry_1'},
    ['Felice'] = {'Expression', 'mood_happy_1'},
    ['Ferito2'] = {'Expression', 'mood_injured_1'},
    ['Gioioso'] = {'Expression', 'mood_dancing_low_1'},
    ['Sfiatato'] = {'Expression', 'smoking_hold_1'},
    ['Lampeggia'] = {'Expression', 'pose_normal_1'},
    ['Occhio'] = {'Expression', 'pose_aiming_1'},
    ['Shockato'] = {'Expression', 'shocked_1'},
    ['Shockato2'] = {'Expression', 'shocked_2'},
    ['Dormi'] = {'Expression', 'mood_sleeping_1'},
    ['Dormi2'] = {'Expression', 'dead_1'},
    ['Dormi3'] = {'Expression', 'dead_2'},
    ['Smug'] = {'Expression', 'mood_smug_1'},
    ['Speculativo'] = {'Expression', 'mood_aiming_1'},
    ['Stressato'] = {'Expression', 'mood_stressed_1'},
    ['Broncio'] = {'Expression', 'mood_sulk_1'},
    ['Strano'] = {'Expression', 'effort_2'},
    ['Strano2'] = {'Expression', 'effort_3'}
}

DP.Walks = {
    ['Alieno'] = {'move_m@alien'},
    ['Corazzato'] = {'anim_group_move_ballistic'},
    ['Arrogante'] = {'move_f@arrogant@a'},
    ['Brave'] = {'move_m@brave'},
    ['Casual'] = {'move_m@casual@a'},
    ['Casual2'] = {'move_m@casual@b'},
    ['Casual3'] = {'move_m@casual@c'},
    ['Casual4'] = {'move_m@casual@d'},
    ['Casual5'] = {'move_m@casual@e'},
    ['Casual6'] = {'move_m@casual@f'},
    ['Chichi'] = {'move_f@chichi'},
    ['Confidente'] = {'move_m@confident'},
    ['Cop'] = {'move_m@business@a'},
    ['Cop2'] = {'move_m@business@b'},
    ['Cop3'] = {'move_m@business@c'},
    ['Predefinita F'] = {'move_f@multiplayer'},
    ['Predefinita M'] = {'move_m@multiplayer'},
    ['Ubriaco'] = {'move_m@drunk@a'},
    ['Ubriaco 2'] = {'move_m@drunk@slightlydrunk'},
    ['Ubriaco 3'] = {'move_m@buzzed'},
    ['Ubriaco 4'] = {'move_m@drunk@verydrunk'},
    ['Donne'] = {'move_f@femme@'},
    ['Fuoco'] = {'move_characters@franklin@fire'},
    ['Fuoco 2'] = {'move_characters@michael@fire'},
    ['Fuoco 3'] = {'move_m@fire'},
    ['Flee'] = {'move_f@flee@a'},
    ['Franklin'] = {'move_p_m_one'},
    ['Gangster'] = {'move_m@gangster@generic'},
    ['Gangster2'] = {'move_m@gangster@ng'},
    ['Gangster3'] = {'move_m@gangster@var_e'},
    ['Gangster4'] = {'move_m@gangster@var_f'},
    ['Gangster5'] = {'move_m@gangster@var_i'},
    ['Grooving'] = {'anim@move_m@grooving@'},
    ['Guardia'] = {'move_m@prison_gaurd'},
    ['Ammanettato'] = {'move_m@prisoner_cuffed'},
    ['Heels'] = {'move_f@heels@c'},
    ['Heels2'] = {'move_f@heels@d'},
    ['Hiking'] = {'move_m@hiking'},
    ['Hipster'] = {'move_m@hipster@a'},
    ['Hobo'] = {'move_m@hobo@a'},
    ['Hurry'] = {'move_f@hurry@a'},
    ['Pulitore'] = {'move_p_m_zero_janitor'},
    ['Pulitore 2'] = {'move_p_m_zero_slow'},
    ['Jog'] = {'move_m@jog@'},
    ['Lemar'] = {'anim_group_move_lemar_alley'},
    ['Lester'] = {'move_heist_lester'},
    ['Lester2'] = {'move_lester_caneup'},
    ['Mangiatrice'] = {'move_f@maneater'},
    ['Michael'] = {'move_ped_bucket'},
    ['Ricco'] = {'move_m@money'},
    ['Muscoloso'] = {'move_m@muscle@a'},
    ['Elegante'] = {'move_m@posh@'},
    ['Elegante 2'] = {'move_f@posh@'},
    ['Veloce'] = {'move_m@quick'},
    ['Runner'] = {'female_fast_runner'},
    ['Triste'] = {'move_m@sad@a'},
    ['Sassy'] = {'move_m@sassy'},
    ['Sassy2'] = {'move_f@sassy'},
    ['Scared'] = {'move_f@scared'},
    ['Sexy'] = {'move_f@sexy@a'},
    ['Shady'] = {'move_m@shadyped@a'},
    ['Lento'] = {'move_characters@jimmy@slow@'},
    ['Swagger'] = {'move_m@swagger'},
    ['Duro'] = {'move_m@tough_guy@'},
    ['Duro 2'] = {'move_f@tough_guy@'},
    ['Trash'] = {'clipset@move@trash_fast_turn'},
    ['Trash2'] = {'missfbi4prepp1_garbageman'},
    ['Trevor'] = {'move_p_m_two'},
    ['Wide'] = {'move_m@bag'}
}

DP.Shared = {
    ['handshake'] = {
        'mp_ped_interaction',
        'handshake_guy_a',
        'Stringi Mano',
        'handshake2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000,
            SyncOffsetFront = 0.9
        }
    },
    ['handshake2'] = {
        'mp_ped_interaction',
        'handshake_guy_b',
        'Stringi Mano 2',
        'handshake',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ['hug'] = {
        'mp_ped_interaction',
        'kisses_guy_a',
        'Abbraccia',
        'hug2',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000,
            SyncOffsetFront = 1.05
        }
    },
    ['hug2'] = {
        'mp_ped_interaction',
        'kisses_guy_b',
        'Abbraccia 2',
        'hug',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000,
            SyncOffsetFront = 1.13
        }
    },
    ['hug3'] = {
        'misscarsteal2chad_goodbye',
        'chad_armsaround_chad',
        'Abbraccia 3',
        'hug4',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetFront = 0.05
        }
    },
    ['hug4'] = {
        'misscarsteal2chad_goodbye',
        'chad_armsaround_girl',
        'Abbraccia 4',
        'hug3',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetFront = 0.13
        }
    },
    ['kiss'] = {
        'mp_ped_interaction',
        'kisses_guy_a',
        'Bacia',
        'kiss2',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000,
            SyncOffsetFront = 1.05
        }
    },
    ['kiss2'] = {
        'mp_ped_interaction',
        'kisses_guy_b',
        'Bacia 2',
        'kiss',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000,
            SyncOffsetFront = 1.13
        }
    },
    ['bro'] = {
        'mp_ped_interaction',
        'hugs_guy_a',
        'Bro',
        'bro2',
        AnimationOptions = {
            SyncOffsetFront = 1.14
        }
    },
    ['bro2'] = {
        'mp_ped_interaction',
        'hugs_guy_b',
        'Bro 2',
        'bro',
        AnimationOptions = {
            SyncOffsetFront = 1.14
        }
    },
    ['give'] = {
        'mp_common',
        'givetake1_a',
        'Dai',
        'give2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ['give2'] = {
        'mp_common',
        'givetake1_b',
        'Dai 2',
        'give',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ['mettisacco'] = {
        'anim@amb@nightclub@poster@',
        'poster_placement',
        'Sacco',
        'nil',
        AnimationOptions = {
            EmoteLoop = false,
            EmoteDuration = 6000
        }
    },
    ['baseball'] = {'anim@arena@celeb@flat@paired@no_props@', 'baseball_a_player_a', 'Baseball', 'baseballthrow'},
    ['baseballthrow'] = {'anim@arena@celeb@flat@paired@no_props@', 'baseball_a_player_b', 'Lancio Baseball', 'baseball'},
    ['handsupp'] = {
        'missminuteman_1ig_2',
        'handsup_base',
        'Alza le mani',
        'handsupp',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },

    ['perqui'] = {
        'mini@repair',
        'fixing_a_ped',
        'Perquisisci',
        'handsupp',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['stickup'] = {
        'random@countryside_gang_fight',
        'biker_02_stickup_loop',
        'Rapina',
        'stickupscared',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['stickupscared'] = {
        'mp_arresting',
        'idle',
        'Rapina 2',
        'stickup',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['punch'] = {'melee@unarmed@streamed_variations', 'plyr_takedown_rear_lefthook', 'Colpisci', 'punched'},
    ['punched'] = {'melee@unarmed@streamed_variations', 'victim_takedown_front_cross_r', 'Colpito', 'punch'},
    ['headbutt'] = {'melee@unarmed@streamed_variations', 'plyr_takedown_front_headbutt', 'Testata', 'headbutted'},
    ['headbutted'] = {'melee@unarmed@streamed_variations', 'victim_takedown_front_headbutt', 'Ricevi Testata',
                      'headbutt'},
    ['slap2'] = {
        'melee@unarmed@streamed_variations',
        'plyr_takedown_front_backslap',
        'Schiaffo 2',
        'slapped2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ['slap'] = {
        'melee@unarmed@streamed_variations',
        'plyr_takedown_front_slap',
        'Schiaffo',
        'slapped',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },

    ['slapped'] = {'melee@unarmed@streamed_variations', 'victim_takedown_front_slap', 'Ricevi Schiaffo', 'slap'},
    ['slapped2'] = {'melee@unarmed@streamed_variations', 'victim_takedown_front_backslap', 'Ricevi Schiaffo 2', 'slap2'},
    ['receiveblowjob'] = {
        'misscarsteal2pimpsex',
        'pimpsex_punter',
        'Receive Blowjob',
        'Blowjob',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 30000,
            SyncOffsetFront = 0.63
        }
    },
    ['giveblowjob'] = {
        'misscarsteal2pimpsex',
        'pimpsex_hooker',
        'Give Blowjob',
        'Ricevi Blowjob',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 30000,
            SyncOffsetFront = 0.63
        }
    },
    ['streetsexmale'] = {
        'misscarsteal2pimpsex',
        'shagloop_pimp',
        'Street Sex Male',
        'Sesso di strada femminile',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetFront = 0.50
        }
    },
    ['streetsexfemale'] = {
        'misscarsteal2pimpsex',
        'shagloop_hooker',
        'Street Sex Female',
        'Sesso di strada maschio',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetFront = -0.50
        }
    }
}

DP.Dances = {
    ["jdrill"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "mi_dance_prop_13_v1_male^3",
        "Drill · Male",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdrill2"] = {
        "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@",
        "mi_dance_crowd_13_v2_male^1",
        "Drill · Male 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdrill3"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "mi_dance_facedj_17_v2_male^4",
        "Drill · Male 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdrill4"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "mi_dance_facedj_15_v2_male^4",
        "Drill · Male 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdrill5"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "hi_dance_facedj_hu_15_v2_male^5",
        "Drill · Male 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jDrill6"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "hi_dance_facedj_hu_17_male^5",
        "Drill · Male 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdrill7"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_right_up",
        "Drill · Solo 1",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdrill8"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "med_center",
        "Drill · Solo 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdrill9"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_right_down",
        "Drill · Solo 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdrill10"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_center",
        "Drill · Solo 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jDrill11"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_left_down",
        "Drill · Solo 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["unclej"] = {
        "anim@mp_player_intcelebrationfemale@uncle_disco",
        "uncle_disco",
        "Uncle Josh",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jmonkeyd"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "high_center",
        "Monkey Dance ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jmonkeyd2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "high_center_down",
        "Monkey Dance 2 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jmonkeyd3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "med_center_down",
        "Monkey Dance 3 ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jrightdown"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@",
        "med_right_down",
        "Boxing Dance Solo ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jlowdance"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_a@",
        "low_center",
        "Low Dance · Female ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jlowdance2"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_a@",
        "high_center",
        "Low Dance · Female",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jhiphop"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_d@",
        "ped_a_dance_idle",
        "Hip Hop Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jhiphop2"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_b@",
        "ped_a_dance_idle",
        "Hip Hop Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jhiphop3"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_a@",
        "ped_a_dance_idle",
        "Hip Hop Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },

    --
    ['dance'] = {
        'anim@amb@nightclub@dancers@podium_dancers@',
        'hi_dance_facedj_17_v2_male^5',
        'Danza',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dance2'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@male@var_b@',
        'high_center_down',
        'Danza 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dance3'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@male@var_a@',
        'high_center',
        'Danza 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dance4'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@male@var_b@',
        'high_center_up',
        'Danza 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dance5'] = {
        'anim@amb@casino@mini@dance@dance_solo@female@var_a@',
        'med_center',
        'Danza 5',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dance6'] = {
        'misschinese2_crystalmazemcs1_cs',
        'dance_loop_tao',
        'Danza 6',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dance7'] = {
        'misschinese2_crystalmazemcs1_ig',
        'dance_loop_tao',
        'Danza 7',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dance8'] = {
        'missfbi3_sniping',
        'dance_m_default',
        'Danza 8',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dance9'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@female@var_a@',
        'med_center_up',
        'Danza 9',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancef'] = {
        'anim@amb@nightclub@dancers@solomun_entourage@',
        'mi_dance_facedj_17_v1_female^1',
        'Danza F',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancef2'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@female@var_a@',
        'high_center',
        'Danza F2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancef3'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@female@var_a@',
        'high_center_up',
        'Danza F3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancef4'] = {
        'anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity',
        'hi_dance_facedj_09_v2_female^1',
        'Danza F4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancef5'] = {
        'anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity',
        'hi_dance_facedj_09_v2_female^3',
        'Danza F5',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancef6'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@female@var_a@',
        'high_center_up',
        'Danza F6',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceclub'] = {
        'anim@amb@nightclub_island@dancers@beachdance@',
        'hi_idle_a_m03',
        'Danza Club',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceclub2'] = {
        'anim@amb@nightclub_island@dancers@beachdance@',
        'hi_idle_a_m05',
        'Danza Club 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceclub3'] = {
        'anim@amb@nightclub_island@dancers@beachdance@',
        'hi_idle_a_m02',
        'Danza Club 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceclub4'] = {
        'anim@amb@nightclub_island@dancers@beachdance@',
        'hi_idle_b_f01',
        'Danza Club 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceclub5'] = {
        'anim@amb@nightclub_island@dancers@club@',
        'hi_idle_a_f02',
        'Danza Club 5',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceclub6'] = {
        'anim@amb@nightclub_island@dancers@club@',
        'hi_idle_b_m03',
        'Danza Club 6',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceclub7'] = {
        'anim@amb@nightclub_island@dancers@club@',
        'hi_idle_d_f01',
        'Danza Club 7',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancedrink'] = {
        'anim@amb@nightclub_island@dancers@beachdanceprop@',
        'mi_idle_c_m01',
        'Sballo (Birra)',
        AnimationOptions = {
            Prop = 'prop_beer_amopen',
            PropBone = 28422,
            PropPlacement = {0.0, 0.00, 0.0, 0.0, 0.0, 20.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dancedrink2'] = {
        'anim@amb@nightclub_island@dancers@beachdanceprop@',
        'mi_loop_f1',
        'Sballo (Vino)',
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0900, 0.0, 0.0, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dancedrink3'] = {
        'anim@amb@nightclub_island@dancers@beachdanceprop@',
        'mi_loop_m04',
        'Sballo 3 (Whiskey)',
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_opaque_s',
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.00, 0.0, 0.0, 0.0, 10.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dancedrink4'] = {
        'anim@amb@nightclub_island@dancers@beachdanceprops@male@',
        'mi_idle_b_m04',
        'Sballo 4 (Whiskey)',
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_opaque_s',
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.00, 0.0, 0.0, 0.0, 10.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dancedrink5'] = {
        'anim@amb@nightclub_island@dancers@crowddance_single_props@',
        'hi_dance_prop_09_v1_female^3',
        'Sballo 5 (Vino)',
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0900, 0.0, 0.0, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dancedrink6'] = {
        'anim@amb@nightclub_island@dancers@crowddance_single_props@',
        'hi_dance_prop_09_v1_male^3',
        'Sballo 6 (Birra)',
        AnimationOptions = {
            Prop = 'prop_beer_logopen',
            PropBone = 28422,
            PropPlacement = {0.0090, 0.0010, -0.0310, 180.0, 180.0, -69.99},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dancedrink7'] = {
        'anim@amb@nightclub_island@dancers@crowddance_single_props@',
        'hi_dance_prop_11_v1_female^3',
        'Sballo 7 (Vino)',
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0900, 0.0, 0.0, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dancedrink8'] = {
        'anim@amb@nightclub_island@dancers@crowddance_single_props@',
        'hi_dance_prop_11_v1_female^1',
        'Sballo 8 (Vino)',
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0900, 0.0, 0.0, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['danceslow2'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@female@var_a@',
        'low_center',
        'Ballo Lento 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceslow3'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@female@var_a@',
        'low_center_down',
        'Ballo Lento 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceslow4'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@female@var_b@',
        'low_center',
        'Ballo Lento 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceupper'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@female@var_b@',
        'high_center',
        'Danza Superiore',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['danceupper2'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@female@var_b@',
        'high_center_up',
        'Danza Superiore 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['danceshy'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@male@var_a@',
        'low_center',
        'Danza Timida',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceshy2'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@female@var_b@',
        'low_center_down',
        'Danza Timida 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceslow'] = {
        'anim@amb@nightclub@mini@dance@dance_solo@male@var_b@',
        'low_center',
        'Danza Lenta',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancesilly9'] = {
        'rcmnigel1bnmt_1b',
        'dance_loop_tyler',
        'Danza Sciocca 9',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancesilly'] = {
        'special_ped@mountain_dancer@monologue_3@monologue_3a',
        'mnt_dnc_buttwag',
        'Danza Sciocca',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancesilly2'] = {
        'move_clown@p_m_zero_idles@',
        'fidget_short_dance',
        'Danza Sciocca 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancesilly3'] = {
        'move_clown@p_m_two_idles@',
        'fidget_short_dance',
        'Danza Sciocca 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancesilly4'] = {
        'anim@amb@nightclub@lazlow@hi_podium@',
        'danceidle_hi_11_buttwiggle_b_laz',
        'Danza Sciocca 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancesilly5'] = {
        'timetable@tracy@ig_5@idle_a',
        'idle_a',
        'Danza Sciocca 5',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancesilly6'] = {
        'timetable@tracy@ig_8@idle_b',
        'idle_d',
        'Danza Sciocca 6',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancesilly8'] = {
        'anim@mp_player_intcelebrationfemale@the_woogie',
        'the_woogie',
        'Danza Sciocca 8',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['dancesilly7'] = {
        'anim@amb@casino@mini@dance@dance_solo@female@var_b@',
        'high_center',
        'Danza Sciocca 7',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['danceglowstick'] = {
        'anim@amb@nightclub@lazlow@hi_railing@',
        'ambclub_13_mi_hi_sexualgriding_laz',
        'Danza Con Glowsticks',
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['danceglowstick2'] = {
        'anim@amb@nightclub@lazlow@hi_railing@',
        'ambclub_12_mi_hi_bootyshake_laz',
        'Danza Con Glowsticks 2',
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true
        }
    },
    ['danceglowstick3'] = {
        'anim@amb@nightclub@lazlow@hi_railing@',
        'ambclub_09_mi_hi_bellydancer_laz',
        'Danza Con Glowsticks 3',
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true
        }
    },
    ['dancehorse'] = {
        'anim@amb@nightclub@lazlow@hi_dancefloor@',
        'dancecrowd_li_15_handup_laz',
        'Danza con cavallo',
        AnimationOptions = {
            Prop = 'ba_prop_battle_hobby_horse',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['dancehorse2'] = {
        'anim@amb@nightclub@lazlow@hi_dancefloor@',
        'crowddance_hi_11_handup_laz',
        'Danza con cavallo 2',
        AnimationOptions = {
            Prop = 'ba_prop_battle_hobby_horse',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ['dancehorse3'] = {
        'anim@amb@nightclub@lazlow@hi_dancefloor@',
        'dancecrowd_li_11_hu_shimmy_laz',
        'Danza con cavallo 3',
        AnimationOptions = {
            Prop = 'ba_prop_battle_hobby_horse',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ['dj'] = {
        'anim@amb@nightclub@djs@dixon@',
        'dixn_dance_cntr_open_dix',
        'DJ',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['dj2'] = {
        'anim@amb@nightclub@djs@solomun@',
        'sol_idle_ctr_mid_a_sol',
        'DJ 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dj3'] = {
        'anim@amb@nightclub@djs@solomun@',
        'sol_dance_l_sol',
        'DJ 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dj4'] = {
        'anim@amb@nightclub@djs@black_madonna@',
        'dance_b_idle_a_blamadon',
        'DJ 4',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dj5'] = {
        'anim@amb@nightclub@djs@dixon@',
        'dixn_idle_cntr_a_dix',
        'DJ 5',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dj6'] = {
        'anim@amb@nightclub@djs@dixon@',
        'dixn_idle_cntr_b_dix',
        'DJ 6',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dj7'] = {
        'anim@amb@nightclub@djs@dixon@',
        'dixn_idle_cntr_g_dix',
        'DJ 7',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dj8'] = {
        'anim@amb@nightclub@djs@dixon@',
        'dixn_idle_cntr_gb_dix',
        'DJ 8',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['dj9'] = {
        'anim@amb@nightclub@djs@dixon@',
        'dixn_sync_cntr_j_dix',
        'DJ 9',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['twerk'] = {
        'switch@trevor@mocks_lapdance',
        '001443_01_trvs_28_idle_stripper',
        'Twerk',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapdance'] = {'mp_safehouse', 'lap_dance_girl', 'Lapdance'},
    ['lapdance2'] = {
        'mini@strip_club@private_dance@idle',
        'priv_dance_idle',
        'Lapdance 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapdance3'] = {
        'mini@strip_club@private_dance@part1',
        'priv_dance_p1',
        'Lapdance 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapdance4'] = {
        'mini@strip_club@private_dance@part2',
        'priv_dance_p2',
        'Lapdance 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapdance5'] = {
        'mini@strip_club@private_dance@part3',
        'priv_dance_p3',
        'Lapdance 5',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapdance6'] = {
        'oddjobs@assassinate@multi@yachttarget@lapdance',
        'yacht_ld_f',
        'Lapdance 6',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapdancewith'] = {
        'mini@strip_club@lap_dance_2g@ld_2g_p3',
        'ld_2g_p3_s2',
        'Lapdance con',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapdancewith2'] = {
        'mini@strip_club@lap_dance_2g@ld_2g_p2',
        'ld_2g_p2_s2',
        'Lapdance con2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapdancewith3'] = {
        'mini@strip_club@lap_dance_2g@ld_2g_p1',
        'ld_2g_p1_s2',
        'Lapdance con3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapchair'] = {
        'mini@strip_club@lap_dance@ld_girl_a_song_a_p1',
        'ld_girl_a_song_a_p1_f',
        'Lap Sedia',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapchair2'] = {
        'mini@strip_club@lap_dance@ld_girl_a_song_a_p2',
        'ld_girl_a_song_a_p2_f',
        'Lap Sedia2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lapchair3'] = {
        'mini@strip_club@lap_dance@ld_girl_a_song_a_p3',
        'ld_girl_a_song_a_p3_f',
        'Lap Sedia3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['bdogbark'] = {
        'creatures@rottweiler@amb@world_dog_barking@idle_a',
        'idle_a',
        'Abbaia',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['bdogbeg2'] = {
        'creatures@rottweiler@tricks@',
        'paw_right_loop',
        'Beg 2 (big dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['bdogdump'] = {
        'creatures@rottweiler@move',
        'dump_loop',
        'Dump (big dog)',
        AnimationOptions = {
            Prop = 'prop_big_shit_02',
            PropBone = 51826,
            PropPlacement = {0.0, 0.2000, -0.4600, 0.0, -20.00, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['bdogitch'] = {
        'creatures@rottweiler@amb@world_dog_sitting@idle_a',
        'idle_a',
        'Itch (big dog)',
        AnimationOptions = {
            EmoteDuration = 2000
        }
    },
    ['bdogsleep'] = {
        'creatures@rottweiler@amb@sleep_in_kennel@',
        'sleep_in_kennel',
        'Sleep (big dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['bdogsit'] = {
        'creatures@rottweiler@amb@world_dog_sitting@base',
        'base',
        'Sit (big dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['bdogpee'] = {
        'creatures@rottweiler@move',
        'pee_left_idle',
        'Pee (big dog)',
        AnimationOptions = {
            EmoteLoop = false
        }
    },
    ['bdogpee2'] = {
        'creatures@rottweiler@move',
        'pee_right_idle',
        'Pee 2 (big dog)',
        AnimationOptions = {
            EmoteLoop = false
        }
    },
    ['sdogbark'] = {
        'creatures@pug@amb@world_dog_barking@idle_a',
        'idle_a',
        'Bark (small dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sdogitch'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_a',
        'Itch (small dog)',
        AnimationOptions = {
            EmoteDuration = 2000
        }
    },
    ['sdogsit'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_b',
        'Sit (small dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sdogld'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_c',
        'Lay Down (small dog)',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogshake'] = {
        'creatures@pug@amb@world_dog_barking@idle_a',
        'idle_c',
        'Shake (small dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    }

}

DP.AnimalEmotes = {
    ['bdogbark'] = {
        'creatures@rottweiler@amb@world_dog_barking@idle_a',
        'idle_a',
        'Abbaia',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['bdogbeg2'] = {
        'creatures@rottweiler@tricks@',
        'paw_right_loop',
        'Beg 2 (big dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['bdogdump'] = {
        'creatures@rottweiler@move',
        'dump_loop',
        'Dump (big dog)',
        AnimationOptions = {
            Prop = 'prop_big_shit_02',
            PropBone = 51826,
            PropPlacement = {0.0, 0.2000, -0.4600, 0.0, -20.00, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['bdogitch'] = {
        'creatures@rottweiler@amb@world_dog_sitting@idle_a',
        'idle_a',
        'Itch (big dog)',
        AnimationOptions = {
            EmoteDuration = 2000
        }
    },
    ['bdogsleep'] = {
        'creatures@rottweiler@amb@sleep_in_kennel@',
        'sleep_in_kennel',
        'Sleep (big dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['bdogsit'] = {
        'creatures@rottweiler@amb@world_dog_sitting@base',
        'base',
        'Sit (big dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['bdogpee'] = {
        'creatures@rottweiler@move',
        'pee_left_idle',
        'Pee (big dog)',
        AnimationOptions = {
            EmoteLoop = false
        }
    },
    ['bdogpee2'] = {
        'creatures@rottweiler@move',
        'pee_right_idle',
        'Pee 2 (big dog)',
        AnimationOptions = {
            EmoteLoop = false
        }
    },
    ['sdogbark'] = {
        'creatures@pug@amb@world_dog_barking@idle_a',
        'idle_a',
        'Bark (small dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sdogitch'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_a',
        'Itch (small dog)',
        AnimationOptions = {
            EmoteDuration = 2000
        }
    },
    ['sdogsit'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_b',
        'Sit (small dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sdogld'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_c',
        'Lay Down (small dog)',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogshake'] = {
        'creatures@pug@amb@world_dog_barking@idle_a',
        'idle_c',
        'Shake (small dog)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sdogdance'] = {
        'creatures@pug@move',
        'idle_turn_0',
        'Dance (small dog)',
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogdance2'] = {
        'creatures@pug@move',
        'idle_turn_0',
        'Dance 2 (small dog)',
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0300, 0.0, 0.0, 0.0},
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogbb'] = {
        'creatures@pug@move',
        'nill',
        'Baseball (small dog)',
        AnimationOptions = {
            Prop = 'w_am_baseball',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0500, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogburger'] = {
        'creatures@pug@move',
        'nill',
        'Burger (small dog)',
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0400, 0.0000, -90.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogcontroller'] = {
        'creatures@pug@move',
        'nill',
        'Controller (small dog)',
        AnimationOptions = {
            Prop = 'prop_controller_01',
            PropBone = 31086,
            PropPlacement = {0.1800, -0.0300, 0.0000, -180.000, 90.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogdolla'] = {
        'creatures@pug@move',
        'nill',
        'Dollar Bill (small dog)',
        AnimationOptions = {
            Prop = 'p_banknote_onedollar_s',
            PropBone = 31086,
            PropPlacement = {0.1700, -0.0100, 0.0000, 90.0000, 0.0000, 0.000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogdolla2'] = {
        'creatures@pug@move',
        'nill',
        'Dollar Bill Scrunched  (small dog)',
        AnimationOptions = {
            Prop = 'bkr_prop_scrunched_moneypage',
            PropBone = 31086,
            PropPlacement = {0.1700, 0.000, 0.0000, 90.0000, 00.0000, 00.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogdolla3'] = {
        'creatures@pug@move',
        'nill',
        'Money Stack  (small dog)',
        AnimationOptions = {
            Prop = 'bkr_prop_money_wrapped_01',
            PropBone = 31086,
            PropPlacement = {0.1700, -0.0100, 0.0000, 90.0000, 0.0000, 0.000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogdolla4'] = {
        'creatures@pug@move',
        'nill',
        'Money Bag  (small dog)',
        AnimationOptions = {
            Prop = 'ch_prop_ch_moneybag_01a',
            PropBone = 31086,
            PropPlacement = {0.1200, -0.2000, 0.0000, -79.9999997, 90.00, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogmic'] = {
        'creatures@pug@move',
        'nill',
        'Microphone (small dog)',
        AnimationOptions = {
            Prop = 'p_ing_microphonel_01',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0170, 0.0300, 0.000, 0.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogteddy'] = {
        'creatures@pug@move',
        'nill',
        'Teddy (small dog)',
        AnimationOptions = {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.1100, -0.23, 0.000, 0.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogteddy2'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_b',
        'Teddy 2 (small dog)',
        AnimationOptions = {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.1100, -0.23, 0.000, 0.0000, 0.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogtennis'] = {
        'creatures@pug@move',
        'nill',
        'Tennis Ball (small dog)',
        AnimationOptions = {
            Prop = 'prop_tennis_ball',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0600, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogtennisr'] = {
        'creatures@pug@move',
        'nill',
        'Tennis Racket (small dog)',
        AnimationOptions = {
            Prop = 'prop_tennis_rack_01',
            PropBone = 31086,
            PropPlacement = {0.1500, -0.0200, 0.00, 0.000, 0.0000, -28.0000},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogrose'] = {
        'creatures@pug@move',
        'nill',
        'Rose (small dog)',
        AnimationOptions = {
            Prop = 'prop_single_rose',
            PropBone = 12844,
            PropPlacement = {0.1090, -0.0140, 0.0500, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogrose2'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_b',
        'Rose Sit (small dog)',
        AnimationOptions = {
            Prop = 'prop_single_rose',
            PropBone = 12844,
            PropPlacement = {0.1090, -0.0140, 0.0500, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogggun'] = {
        'creatures@pug@move',
        'nill',
        'Gun Gold (small dog)',
        AnimationOptions = {
            Prop = 'w_pi_pistol_luxe',
            PropBone = 12844,
            PropPlacement = {0.2010, -0.0080, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdoggun2'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_b',
        'Gun Gold Sit (small dog)',
        AnimationOptions = {
            Prop = 'w_pi_pistol_luxe',
            PropBone = 12844,
            PropPlacement = {0.2010, -0.0080, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogstun'] = {
        'creatures@pug@move',
        'nill',
        'Stun Gun (small dog)',
        AnimationOptions = {
            Prop = 'w_pi_stungun',
            PropBone = 12844,
            PropPlacement = {0.1400, -0.0100, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false,
            PtfxAsset = 'core',
            PtfxName = 'blood_stungun',
            PtfxPlacement = {0.208, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
            PtfxInfo = Config.Languages[Config.MenuLanguage]['stun'],
            PtfxWait = 200
        }
    },
    ['sdoggl1'] = {
        'creatures@pug@move',
        'nill',
        'Aviators (small dog)',
        AnimationOptions = {
            Prop = 'prop_aviators_01',
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0400, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdoggl2'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_b',
        'Aviators Sitting (small dog)',
        AnimationOptions = {
            Prop = 'prop_aviators_01',
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0400, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdoggl3'] = {
        'creatures@pug@move',
        'nill',
        'Sunglasses (small dog)',
        AnimationOptions = {
            Prop = 'prop_cs_sol_glasses',
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdoggl4'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_b',
        'Sunglasses Sitting (small dog)',
        AnimationOptions = {
            Prop = 'prop_cs_sol_glasses',
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0300, 0.000, -100.0000003, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdoghd1'] = {
        'creatures@pug@move',
        'nill',
        'Hot Dog (small dog)',
        AnimationOptions = {
            Prop = 'prop_cs_hotdog_01',
            PropBone = 31086,
            PropPlacement = {0.1300, -0.0250, 0.000, -88.272053, -9.8465858, -0.1488562},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdoghd2'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_b',
        'Hot Dog Sitting (small dog)',
        AnimationOptions = {
            Prop = 'prop_cs_hotdog_01',
            PropBone = 31086,
            PropPlacement = {0.1300, -0.0250, 0.000, -88.272053, -9.8465858, -0.1488562},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdoghlmt1'] = {
        'creatures@pug@move',
        'nill',
        'Helmet 1 (small dog)',
        AnimationOptions = {
            Prop = 'ba_prop_battle_sports_helmet',
            PropBone = 31086,
            PropPlacement = {0.00, -0.0200, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdoghlmt2'] = {
        'creatures@pug@move',
        'nill',
        'Helmet 2 (small dog)',
        AnimationOptions = {
            Prop = 'prop_hard_hat_01',
            PropBone = 31086,
            PropPlacement = {0.00, 0.1300, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdoghat'] = {
        'creatures@pug@move',
        'nill',
        'Hat 1 (small dog)',
        AnimationOptions = {
            Prop = 'prop_proxy_hat_01',
            PropBone = 31086,
            PropPlacement = {0.0, 0.1200, 0.000, -99.8510766, 80.1489234, 1.7279411},
            SecondProp = 'prop_aviators_01',
            SecondPropBone = 31086,
            SecondPropPlacement = {0.0500, 0.0400, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdoghat2'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_b',
        'Hat 2 Sitting (small dog)',
        AnimationOptions = {
            Prop = 'prop_proxy_hat_01',
            PropBone = 31086,
            PropPlacement = {0.0, 0.1200, 0.000, -99.8510766, 80.1489234, 1.7279411},
            SecondProp = 'prop_aviators_01',
            SecondPropBone = 31086,
            SecondPropPlacement = {0.0500, 0.0400, 0.000, -90.00, 90.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogsteak'] = {
        'creatures@pug@move',
        'nill',
        'Steak (small dog)',
        AnimationOptions = {
            Prop = 'prop_cs_steak',
            PropBone = 31086,
            PropPlacement = {0.1800, -0.0200, 0.000, 90.00, 0.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['sdogsteak2'] = {
        'creatures@pug@amb@world_dog_sitting@idle_a',
        'idle_c',
        'Steak 2 Lay Down (small dog)',
        AnimationOptions = {
            Prop = 'prop_cs_steak',
            PropBone = 31086,
            PropPlacement = {0.1800, -0.0200, 0.000, 90.00, 0.00, 0.00},
            EmoteLoop = true,
            EmoteMoving = false
        }
    }

}

DP.Emotes = {
    ["jpbox"] = {
        "mp_am_hold_up",
        "purchase_beerbox_shopkeeper",
        "Purchase Box",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jch"] = {
        "amb@code_human_police_investigate@idle_b",
        "idle_f",
        "Cop Search",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 7000
        }
    },
    ["jgangsign5"] = {
        "anim@mp_player_intupperdock",
        "idle_a",
        "Gang Sign",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2500
        }
    },
    ["jcheckwatch"] = {
        "amb@code_human_wander_idles_fat@male@idle_a",
        "idle_a_wristwatch",
        "Check Watch · Male",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jpicking"] = {
        "amb@prop_human_movie_bulb@idle_a",
        "idle_a",
        "Picking",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2500
        }
    },
    ["jgangaim"] = {
        "combat@aim_variations@1h@gang",
        "aim_variation_b",
        "Gang Aim",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jshowboobs"] = {
        "mini@strip_club@backroom@",
        "stripper_b_backroom_idle_b",
        "Show Boobs",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 6000
        }
    },
    ["jcleanleg"] = {
        "mini@strip_club@backroom@",
        "stripper_c_leadin_backroom_idle_a",
        "Clean Legs",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 6000
        }
    },
    ["jshowboobs2"] = {
        "mini@strip_club@idles@stripper",
        "stripper_idle_05",
        "Show Boobs 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 6000
        }
    },
    ["jlockcar"] = {
        "anim@mp_player_intmenu@key_fob@",
        "fob_click",
        "Lock Car",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2500
        }
    },
    ["jselfie5"] = {
        "cellphone@self",
        "selfie",
        "Selfie 3",
        AnimationOptions = {
            EmoteMoving = false,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["jselfiewc"] = {
        "cellphone@self@franklin@",
        "west_coast",
        "Selfie West Coast",
        AnimationOptions = {
            EmoteMoving = false,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["jselfie3"] = {
        "cellphone@self@michael@",
        "finger_point",
        "Selfie Finger",
        AnimationOptions = {
            EmoteMoving = false,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["jselfie4"] = {
        "cellphone@self@franklin@",
        "chest_bump",
        "Selfie Chest Bump",
        AnimationOptions = {
            EmoteMoving = false,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["jSelfie1"] = {
        "cellphone@self@trevor@",
        "throat_slit",
        "Selfie",
        AnimationOptions = {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["jSelfie2"] = {
        "cellphone@self@trevor@",
        "proud_finger",
        "Selfie2",
        AnimationOptions = {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["jkhaby"] = {
        "missarmenian3@simeon_tauntsidle_b",
        "areyounotman",
        "Khaby · Special",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jdepressed"] = {
        "oddjobs@bailbond_hobodepressed",
        "base",
        "Depressed",
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ["jcarsign"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base",
        "idle_a",
        "Gang Sign · Car",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2500
        }
    },
    ["jcarsign2"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_a@low@ds@base",
        "idle_a",
        "Gang Signs 2 · Car",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2500
        }
    },
    ["jcarlowrider"] = {
        "anim@veh@lowrider@low@front_ds@arm@base",
        "sit",
        "Lowrider Style · Car ",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jcarlowrider2"] = {
        "anim@veh@lowrider@std@ds@arm@music@mexicanidle_a",
        "idle",
        "Lowrider Mexican Style · Car ",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jreactiona"] = {
        "random@shop_robbery_reactions@",
        "absolutely",
        "Reaction Absolutely",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreactanger"] = {
        "random@shop_robbery_reactions@",
        "anger_a",
        "Reaction Anger",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreactwhy"] = {
        "random@shop_robbery_reactions@",
        "is_this_it",
        "Reaction Why",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreactscrew"] = {
        "random@shop_robbery_reactions@",
        "screw_you",
        "Reaction Screw You",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreactshock"] = {
        "random@shop_robbery_reactions@",
        "shock",
        "Reaction Shock",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreactgoodc"] = {
        "missclothing",
        "good_choice_storeclerk",
        "Reaction Good Choice",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jtrynewc"] = {
        "clothingtie",
        "try_tie_neutral_c",
        "Try New Clothes",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jtrynewc2"] = {
        "clothingtie",
        "try_tie_neutral_d",
        "Try New Clothes 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreacteasy"] = {
        "gestures@m@car@std@casual@ds",
        "gesture_easy_now",
        "Reaction Easy Now",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreactıwill"] = {
        "gestures@m@car@std@casual@ds",
        "gesture_i_will",
        "Reaction I will",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreactnoway"] = {
        "gestures@m@car@std@casual@ds",
        "gesture_no_way",
        "Reaction No Way",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreactbye"] = {
        "gestures@f@standing@casual",
        "gesture_bye_hard",
        "Reaction Bye Hard",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreacthello"] = {
        "gestures@f@standing@casual",
        "gesture_hello",
        "Reaction Hello",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jlookatplayer"] = {
        "friends@frl@ig_1",
        "look_lamar",
        "Look At Player",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreactgreat"] = {
        "mp_cp_welcome_tutgreet",
        "greet",
        "Great",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jfakepunch"] = {
        "missarmenian2",
        "fake_punch_walk_by_lamar",
        "Fake Punch",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jreactdamn"] = {
        "missheist_jewel",
        "damn",
        "Reaction Damn",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jimtellingyou"] = {
        "missheist_jewel",
        "im_telling_you",
        "I'm telling you",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jreactno"] = {
        "missheist_jewel",
        "despair",
        "Reaction No",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jdontkillme"] = {
        "missheist_jewel",
        "manageress_kneel_loop",
        "Dont Kill Me",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jbangbang"] = {
        "anim@mp_player_intcelebrationfemale@bang_bang",
        "bang_bang",
        "Bang Bang",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jtryshirtn"] = {
        "clothingshirt",
        "try_shirt_negative_a",
        "Try Shirt Negative",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jtryshirtp"] = {
        "clothingshirt",
        "try_shirt_positive_a",
        "Try Shirt Positive",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jtryshoes"] = {
        "clothingshoes",
        "try_shoes_positive_d",
        "Try Shoes",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jtryshoes2"] = {
        "clothingshoes",
        "try_shoes_positive_c",
        "Try Shoes 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["joverhere"] = {
        "friends@fra@ig_1",
        "over_here_idle_a",
        "Over Here",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jwashingface"] = {
        "missmic2_washing_face",
        "michael_washing_face",
        "Washing Face",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jlastday"] = {
        "misstrevor1",
        "ortega_outro_loop_ort",
        "Last Day",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jtryg"] = {
        "mp_clothing@female@glasses",
        "try_glasses_positive_a",
        "Try Glasses · Female",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jpickup"] = {
        "pickup_object",
        "pickup_low",
        "Pick Up",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jstretchl"] = {
        "switch@franklin@bed",
        "stretch_long",
        "Stretch Long",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jhos"] = {
        "amb@world_human_hang_out_street@male_a@idle_a",
        "idle_a",
        "Hang Out Street · Male",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jhos2"] = {
        "amb@world_human_hang_out_street@male_c@base",
        "base",
        "Hang Out Street 2 · Male",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jguardaim"] = {
        "guard_reactions",
        "1hand_aiming_cycle",
        "Guard Aim",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jgready"] = {
        "switch@franklin@getting_ready",
        "002334_02_fras_v2_11_getting_dressed_exit",
        "Getting Ready",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jlao"] = {
        "move_clown@p_m_two_idles@",
        "fidget_look_at_outfit",
        "Look At Outfits",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 6000
        }
    },
    ["jtoilet"] = {
        "switch@trevor@on_toilet",
        "trev_on_toilet_loop",
        "Have A Shit",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jtoilet2"] = {
        "timetable@trevor@on_the_toilet",
        "trevonlav_struggleloop",
        "Have A Shit 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jcovermale2"] = {
        "amb@code_human_cower@male@base",
        "base",
        "Cover · Male",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jvalet"] = {
        "anim@amb@world_human_valet@normal@base@",
        "base_a_m_y_vinewood_01",
        "Valet",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jvalet2"] = {
        "anim@amb@world_human_valet@formal_right@base@",
        "base_a_m_y_vinewood_01",
        "Valet 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jsunbathem"] = {
        "amb@world_human_sunbathe@male@back@idle_a",
        "idle_c",
        "Sunbathe · Male",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["jsunbathem2"] = {
        "amb@world_human_sunbathe@male@front@base",
        "base",
        "Sunbathe 2 · Male",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jleancar"] = {
        "anim@scripted@carmeet@tun_meet_ig2_race@",
        "base",
        "Lean Car",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jcheckout2"] = {
        "anim@amb@carmeet@checkout_car@male_c@idles",
        "idle_a",
        "Check Out 2 · Male",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jcheckout"] = {
        "anim@amb@carmeet@checkout_car@female_d@base",
        "base",
        "Check Out 3 · Female",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jreadmessages"] = {
        "anim@amb@carmeet@take_photos@male_a@base",
        "base",
        "Read Messages · Male",
        AnimationOptions = {
            EmoteMoving = false,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["jreadmessages2"] = {
        "anim@amb@carmeet@take_photos@female_b@base",
        "base",
        "Read Messages 2 · Female",
        AnimationOptions = {
            EmoteMoving = false,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ["jlistenmusic"] = {
        "anim@amb@carmeet@listen_music@male_a@trans",
        "a_trans_d",
        "Listen Music",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jogger"] = {
        "move_f@jogger",
        "idle",
        "Jogger · Female",
        AnimationOptions = {
            EmoteDuration = 2500,
            EmoteMoving = true
        }
    },
    ["jogger2"] = {
        "move_m@jogger",
        "idle",
        "Jogger · Male",
        AnimationOptions = {
            EmoteDuration = 2500,
            EmoteMoving = true
        }
    },
    ["jwtf"] = {
        "mini@triathlon",
        "wot_the_fuck",
        "Wot The Fuck",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jucdt"] = {
        "mini@triathlon",
        "u_cant_do_that",
        "U Cant Do That",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jwarmup"] = {
        "mini@triathlon",
        "ig_2_gen_warmup_01",
        "Warmup",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jwarmup2"] = {
        "mini@triathlon",
        "ig_2_gen_warmup_02",
        "Warmup 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jwarmup3"] = {
        "mini@triathlon",
        "jog_idle_f",
        "Warmup 3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jwarmup4"] = {
        "mini@triathlon",
        "jog_idle_e",
        "Warmup 4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jhmassage"] = {
        "missheistfbi3b_ig8_2",
        "cpr_loop_paramedic",
        "Heart Massage",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jpassout"] = {
        "missheistfbi3b_ig8_2",
        "cower_loop_victim",
        "Pass Out",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jddealer"] = {
        "amb@world_human_drug_dealer_hard@male@base",
        "base",
        "Drug Dealer · Male",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jswatch"] = {
        "amb@world_human_strip_watch_stand@male_c@idle_a",
        "idle_b",
        "Watch Strip · Male",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jcheckw"] = {
        "amb@world_human_bum_wash@male@high@base",
        "base",
        "Check Water",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jwaitt"] = {
        "oddjobs@taxi@",
        "idle_a",
        "Wait Taxi",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jnoway"] = {
        "oddjobs@towingpleadingbase",
        "base",
        "No Way",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jtsomething"] = {
        "oddjobs@bailbond_hobohang_out_street_c",
        "idle_c",
        "Tell Something",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jlfh"] = {
        "oddjobs@assassinate@old_lady",
        "looking_for_help",
        "Looking For Help",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jmstretch"] = {
        "oddjobs@assassinate@multi@",
        "idle_a",
        "Muscle Stretch",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jdj"] = {
        "anim@mp_player_intcelebrationmale@dj",
        "dj",
        "DJ",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdj2"] = {
        "anim@scripted@nightclub@dj@dj_moodm@",
        "moodm_cdj_left_a_12",
        "DJ 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdj3"] = {
        "anim@amb@nightclub@djs@switch@dixn_djset_switchover@",
        "dix_end_bg_female1",
        "DJ 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdj4"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity",
        "trans_dance_facedj_li_to_mi_11_v1_male^3",
        "DJ 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jlmic"] = {
        "anim@veh@lowrider@std@ds@arm@music@hiphopidle_a",
        "idle",
        "Listen Music In Car",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2500
        }
    },
    ["jgotc"] = {
        "random@getawaydriver@thugs",
        "base_a",
        "Get Off The Car",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ["jvsad"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "sit_phone_phoneputdown_sleeping-noworkfemale",
        "Very Sad",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jdgrave"] = {
        "anim@amb@drug_field_workers@rake@male_a@base",
        "base",
        "Digging Grave",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Prop = 'prop_tool_shovel006',
            PropBone = 28422,
            PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0}
        }
    },
    ["jbow3"] = {
        "missheistdockssetup1ig_10@base",
        "talk_pipe_base_worker1",
        "Bend Over Wait",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500
        }
    },
    ["jweeding"] = {
        "anim@amb@drug_field_workers@weeding@male_a@base",
        "base",
        "Weeding · Male",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jlookplan"] = {
        "missheist_agency2aig_4",
        "look_plan_c_worker2",
        "Look Plan",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000
        }
    },
    ["jgangdrink"] = {
        "amb@world_human_drinking_fat@beer@male@idle_a",
        "idle_b",
        "Gang Drink 2",
        AnimationOptions = {
            Prop = 'prop_cs_beer_bot_40oz_03',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jmleaning"] = {
        "amb@world_human_leaning@male@wall@back@mobile@base",
        "base",
        "Mobile Leaning · Male",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
        }
    },
    ["jthanks"] = {
        "random@arrests",
        "thanks_male_05",
        "Thanks",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jtextingmale"] = {
        "amb@world_human_stand_mobile_fat@male@text@base",
        "base",
        "Texting · Male",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
        }
    },
    ["jffb"] = {
        "timetable@trevor@skull_loving_bear",
        "skull_loving_bear",
        "F*ck From Behind",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jsitchair7"] = {
        "timetable@reunited@ig_10",
        "isthisthebest_jimmy",
        "Sit Chair 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jsitchair8"] = {
        "timetable@michael@on_sofabase",
        "sit_sofa_base",
        "Sit Chair 8",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jsitchair9"] = {
        "timetable@trevor@smoking_meth@base",
        "base",
        "Sit Chair 9",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jsitchair10"] = {
        "timetable@tracy@ig_7@base",
        "base",
        "Sit Chair 10",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jstandingt"] = {
        "amb@world_human_bum_standing@twitchy@base",
        "base",
        "Standing Twitchy",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jstandingfit"] = {
        "amb@world_human_jog_standing@male@fitbase",
        "base",
        "Standing Fit",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jstandingm"] = {
        "anim@amb@casino@hangout@ped_male@stand@03b@base",
        "base",
        "Standing · Male",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jstandingf"] = {
        "anim@amb@casino@hangout@ped_female@stand@02a@base",
        "base",
        "Standing · Female",
        AnimationOptions = {
            EmoteLoop = true
        }
    },

    --
    ['dab'] = {'custom@dab', 'dab', 'Dab'},
    ['laydowncane'] = {'creatures@rottweiler@amb@sleep_in_kennel@', 'sleep_in_kennel', '[CANE] Stenditi', 'ldc'},
    ['barkcane'] = {'creatures@rottweiler@amb@world_dog_barking@idle_a', 'idle_a', '[CANE] Abbaia', 'bc'},
    ['barkcane2'] = {'creatures@rottweiler@amb@world_dog_sitting@base', 'base', '[CANE] Siediti', 'sc'},
    ['beast'] = {
        'anim@mp_fm_event@intro',
        'beast_transform',
        'Beast',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 5000
        }
    },
    ['chill'] = {
        'switch@trevor@scares_tramp',
        'trev_scares_tramp_idle_tramp',
        'Chill',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['cloudgaze'] = {
        'switch@trevor@annoys_sunbathers',
        'trev_annoys_sunbathers_loop_girl',
        'Cloudgaze',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['cloudgaze2'] = {
        'switch@trevor@annoys_sunbathers',
        'trev_annoys_sunbathers_loop_guy',
        'Cloudgaze 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['prone'] = {
        'missfbi3_sniping',
        'prone_dave',
        'Prone',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['pullover'] = {
        'misscarsteal3pullover',
        'pull_over_right',
        'Saluto strano',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1300
        }
    },
    ['idle'] = {
        'anim@heists@heist_corona@team_idles@male_a',
        'idle',
        'Idle',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idle8'] = {'amb@world_human_hang_out_street@male_b@idle_a', 'idle_b', 'Idle 8'},
    ['idle9'] = {
        'friends@fra@ig_1',
        'base_idle',
        'Idle 9',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idle10'] = {
        'mp_move@prostitute@m@french',
        'idle',
        'Idle 10',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['idle11'] = {
        'random@countrysiderobbery',
        'idle_a',
        'Idle 11',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idle2'] = {
        'anim@heists@heist_corona@team_idles@female_a',
        'idle',
        'Idle 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idle3'] = {
        'anim@heists@humane_labs@finale@strip_club',
        'ped_b_celebrate_loop',
        'Idle 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idle4'] = {
        'anim@mp_celebration@idles@female',
        'celebration_idle_f_a',
        'Idle 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idle5'] = {
        'anim@mp_corona_idles@female_b@idle_a',
        'idle_a',
        'Idle 5',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idle6'] = {
        'anim@mp_corona_idles@male_c@idle_a',
        'idle_a',
        'Idle 6',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idle7'] = {
        'anim@mp_corona_idles@male_d@idle_a',
        'idle_a',
        'Idle 7',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idledrunk'] = {
        'random@drunk_driver_1',
        'drunk_driver_stand_loop_dd1',
        'Idle Drunk',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idledrunk2'] = {
        'random@drunk_driver_1',
        'drunk_driver_stand_loop_dd2',
        'Idle Drunk 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['idledrunk3'] = {
        'missarmenian2',
        'standing_idle_loop_drunk',
        'Idle Drunk 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['airguitar'] = {'anim@mp_player_intcelebrationfemale@air_guitar', 'air_guitar', 'Chitarra'},
    ['airsynth'] = {'anim@mp_player_intcelebrationfemale@air_synth', 'air_synth', 'Chitarra 2'},
    ['argue'] = {
        'misscarsteal4@actor',
        'actor_berating_loop',
        'Litiga',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['argue2'] = {
        'oddjobs@assassinate@vice@hooker',
        'argue_a',
        'Litiga 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['bartender'] = {
        'anim@amb@clubhouse@bar@drink@idle_a',
        'idle_a_bartender',
        'Bartender',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['blowkiss'] = {'anim@mp_player_intcelebrationfemale@blow_kiss', 'blow_kiss', 'Blow Kiss'},
    ['blowkiss2'] = {
        'anim@mp_player_intselfieblow_kiss',
        'exit',
        'Blow Kiss 2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000

        }
    },
    ['curtsy'] = {'anim@mp_player_intcelebrationpaired@f_f_sarcastic', 'sarcastic_left', 'Curtsy'},
    ['bringiton'] = {
        'misscommon@response',
        'bring_it_on',
        'Prendilo',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ['comeatmebro'] = {
        'mini@triathlon',
        'want_some_of_this',
        'Vieni da me',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ['cop2'] = {
        'anim@amb@nightclub@peds@',
        'rcmme_amanda1_stand_loop_cop',
        'Cop 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['cop3'] = {
        'amb@code_human_police_investigate@idle_a',
        'idle_b',
        'Cop 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['cop4'] = {
        'amb@world_human_car_park_attendant@male@base',
        'base',
        'Cop 4',
        AnimationOptions = {
            Prop = 'prop_parking_wand_01',
            PropBone = 57005,
            PropPlacement = {0.12, 0.05, 0.0, 80.0, -20.0, 180.0},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['crossarms'] = {
        'amb@world_human_hang_out_street@female_arms_crossed@idle_a',
        'idle_a',
        'Braccia conserte',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['crossarms2'] = {
        'amb@world_human_hang_out_street@male_c@idle_a',
        'idle_b',
        'Braccia conserte 2',
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ['crossarms3'] = {
        'anim@heists@heist_corona@single_team',
        'single_team_loop_boss',
        'Braccia conserte 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['crossarms4'] = {
        'random@street_race',
        '_car_b_lookout',
        'Braccia conserte 4',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['crossarms5'] = {
        'anim@amb@nightclub@peds@',
        'rcmme_amanda1_stand_loop_cop',
        'Braccia conserte 5',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['foldarms2'] = {
        'anim@amb@nightclub@peds@',
        'rcmme_amanda1_stand_loop_cop',
        'Piega braccia 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['crossarms6'] = {
        'random@shop_gunstore',
        '_idle',
        'Braccia conserte 6',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['foldarms'] = {
        'anim@amb@business@bgen@bgen_no_work@',
        'stand_phone_phoneputdown_idle_nowork',
        'Piega braccia',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['crossarmsside'] = {
        'rcmnigel1a_band_groupies',
        'base_m2',
        'Braccia conserte di lato',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['damn'] = {
        'gestures@m@standing@casual',
        'gesture_damn',
        'Damn',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ['damn2'] = {
        'anim@am_hold_up@male',
        'shoplift_mid',
        'Damn 2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ['pointdown'] = {
        'gestures@f@standing@casual',
        'gesture_hand_down',
        'Punta in basso',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ['surrender'] = {
        'random@arrests@busted',
        'idle_a',
        'Arrenditi',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ['surrender2'] = {
        'mp_bank_heist_1',
        'f_cower_02',
        'Arrenditi 2',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ['surrender3'] = {
        'mp_bank_heist_1',
        'm_cower_01',
        'Arrenditi 3',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ['surrender4'] = {
        'mp_bank_heist_1',
        'm_cower_02',
        'Arrenditi 4',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ['surrender5'] = {
        'random@arrests',
        'kneeling_arrest_idle',
        'Arrenditi 5',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ['surrender6'] = {
        'rcmbarry',
        'm_cower_01',
        'Arrenditi 6',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ['facepalm2'] = {
        'anim@mp_player_intcelebrationfemale@face_palm',
        'face_palm',
        'Facepalm 2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ['facepalm'] = {
        'random@car_thief@agitated@idle_a',
        'agitated_idle_a',
        'Facepalm',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ['facepalm3'] = {
        'missminuteman_1ig_2',
        'tasered_2',
        'Facepalm 3',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ['facepalm4'] = {
        'anim@mp_player_intupperface_palm',
        'idle_a',
        'Facepalm 4',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['fallover'] = {'random@drunk_driver_1', 'drunk_fall_over', 'Cadi'},
    ['fallover2'] = {'mp_suicide', 'pistol', 'Cadi 2'},
    ['fallover3'] = {'mp_suicide', 'pill', 'Cadi 3'},
    ['fallover4'] = {'friends@frf@ig_2', 'knockout_plyr', 'Cadi 4'},
    ['fallover5'] = {'anim@gangops@hostage@', 'victim_fail', 'Cadi 5'},
    ['fallasleep'] = {
        'mp_sleep',
        'sleep_loop',
        'Addormentati',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['fightme'] = {'anim@deathmatch_intros@unarmed', 'intro_male_unarmed_c', 'Combattimi'},
    ['fightme2'] = {'anim@deathmatch_intros@unarmed', 'intro_male_unarmed_e', 'Combattimi 2'},
    ['finger'] = {
        'anim@mp_player_intselfiethe_bird',
        'idle_a',
        'Dito',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['finger2'] = {
        'anim@mp_player_intupperfinger',
        'idle_a_fp',
        'Dito 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['handshake'] = {
        'mp_ped_interaction',
        'handshake_guy_a',
        'Stretta di mano',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ['handshake2'] = {
        'mp_ped_interaction',
        'handshake_guy_b',
        'Stretta di mano 2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ['wait'] = {
        'random@shop_tattoo',
        '_idle_a',
        'Aspetta',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waitb'] = {
        'missbigscore2aig_3',
        'wait_for_van_c',
        'Aspetta B',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waitc'] = {
        'amb@world_human_hang_out_street@female_hold_arm@idle_a',
        'idle_a',
        'Aspetta C',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waitd'] = {
        'amb@world_human_hang_out_street@Female_arm_side@idle_a',
        'idle_a',
        'Aspetta D',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waite'] = {
        'missclothing',
        'idle_storeclerk',
        'Aspetta E',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waitf'] = {
        'timetable@amanda@ig_2',
        'ig_2_base_amanda',
        'Aspetta F',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waitg'] = {
        'rcmnigel1cnmt_1c',
        'base',
        'Aspetta G',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waith'] = {
        'rcmjosh1',
        'idle',
        'Aspetta H',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waiti'] = {
        'rcmjosh2',
        'josh_2_intp1_base',
        'Aspetta I',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waitj'] = {
        'timetable@amanda@ig_3',
        'ig_3_base_tracy',
        'Aspetta J',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waitk'] = {
        'misshair_shop@hair_dressers',
        'keeper_base',
        'Aspetta K',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waitl'] = {
        'rcmjosh1',
        'keeper_base',
        'Aspetta L',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['waitm'] = {
        'rcmnigel1a',
        'base',
        'Aspetta M',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['hiking'] = {
        'move_m@hiking',
        'idle',
        'Escursione',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['hug'] = {'mp_ped_interaction', 'kisses_guy_a', 'Abbraccia'},
    ['hug2'] = {'mp_ped_interaction', 'kisses_guy_b', 'Abbraccia 2'},
    ['hug3'] = {'mp_ped_interaction', 'hugs_guy_a', 'Abbraccia 3'},
    ['inspect'] = {'random@train_tracks', 'idle_e', 'Ispeziona'},
    ['jazzhands'] = {
        'anim@mp_player_intcelebrationfemale@jazz_hands',
        'jazz_hands',
        'Saluto speciale',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 6000
        }
    },
    ['jog2'] = {
        'amb@world_human_jog_standing@male@idle_a',
        'idle_a',
        'Jogging 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['jog3'] = {
        'amb@world_human_jog_standing@female@idle_a',
        'idle_a',
        'Jogging 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['jog4'] = {
        'amb@world_human_power_walker@female@idle_a',
        'idle_a',
        'Jogging 4',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['jog5'] = {
        'move_m@joy@a',
        'walk',
        'Jogging 5',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['jumpingjacks'] = {
        'timetable@reunited@ig_2',
        'jimmy_getknocked',
        'Stretching completo',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['kneel2'] = {
        'rcmextreme3',
        'idle',
        'Inginocchiati 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['kneel3'] = {
        'amb@world_human_bum_wash@male@low@idle_a',
        'idle_a',
        'Inginocchiati 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['knock'] = {
        'timetable@jimmy@doorknock@',
        'knockdoor_idle',
        'Bussa',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['knock2'] = {
        'missheistfbi3b_ig7',
        'lift_fibagent_loop',
        'Bussa 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['knucklecrunch'] = {
        'anim@mp_player_intcelebrationfemale@knuckle_crunch',
        'knuckle_crunch',
        'Scricchiolio',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['lean2'] = {
        'amb@world_human_leaning@female@wall@back@hand_up@idle_a',
        'idle_a',
        'Appoggiati 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lean3'] = {
        'amb@world_human_leaning@female@wall@back@holding_elbow@idle_a',
        'idle_a',
        'Appoggiati 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lean4'] = {
        'amb@world_human_leaning@male@wall@back@foot_up@idle_a',
        'idle_a',
        'Appoggiati 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['leanflirt'] = {
        'random@street_race',
        '_car_a_flirt_girl',
        'Bar',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['leanbar2'] = {
        'amb@prop_human_bum_shopping_cart@male@idle_a',
        'idle_c',
        'Bar 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['leanbar3'] = {
        'anim@amb@nightclub@lazlow@ig1_vip@',
        'clubvip_base_laz',
        'Bar 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['leanbar4'] = {
        'anim@heists@prison_heist',
        'ped_b_loop_a',
        'Bar 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['leanhigh'] = {
        'anim@mp_ferris_wheel',
        'idle_a_player_one',
        'Carrello',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['leanhigh2'] = {
        'anim@mp_ferris_wheel',
        'idle_a_player_two',
        'Carrello 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['leanside'] = {
        'timetable@mime@01_gc',
        'idle_a',
        'Appoggiati',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['leanside2'] = {
        'misscarstealfinale',
        'packer_idle_1_trevor',
        'Appoggiati 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['leanside3'] = {
        'misscarstealfinalecar_5_ig_1',
        'waitloop_lamar',
        'Appoggiati 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['leanside4'] = {
        'misscarstealfinalecar_5_ig_1',
        'waitloop_lamar',
        'Appoggiati 4',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['leanside5'] = {
        'rcmjosh2',
        'josh_2_intp1_base',
        'Appoggiati 5',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['me'] = {
        'gestures@f@standing@casual',
        'gesture_me_hard',
        'Me',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ['mechanic'] = {
        'mini@repair',
        'fixing_a_ped',
        'Meccanico',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['mechanic2'] = {
        'mini@repair',
        'fixing_a_player',
        'Meccanico 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['mechanic3'] = {
        'amb@world_human_vehicle_mechanic@male@base',
        'base',
        'Meccanico 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['mechanic4'] = {
        'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        'machinic_loop_mechandplayer',
        'Meccanico 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['mechanic5'] = {
        'amb@prop_human_movie_bulb@idle_a',
        'idle_b',
        'Meccanico 6',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['medic2'] = {
        'amb@medic@standing@tendtodead@base',
        'base',
        'Medico 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['meditate'] = {
        'rcmcollect_paperleadinout@',
        'meditiate_idle',
        'Medita',
        AnimationOptions = -- CHANGE ME
        {
            EmoteLoop = true
        }
    },
    ['meditate2'] = {
        'rcmepsilonism3',
        'ep_3_rcm_marnie_meditating',
        'Medita 2',
        AnimationOptions = -- CHANGE ME
        {
            EmoteLoop = true
        }
    },
    ['meditate3'] = {
        'rcmepsilonism3',
        'base_loop',
        'Medita 3',
        AnimationOptions = -- CHANGE ME
        {
            EmoteLoop = true
        }
    },
    ['metal'] = {
        'anim@mp_player_intincarrockstd@ps@',
        'idle_a',
        'Metal',
        AnimationOptions = -- CHANGE ME
        {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['no'] = {
        'anim@heists@ornate_bank@chat_manager',
        'fail',
        'No',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['no2'] = {
        'mp_player_int_upper_nod',
        'mp_player_int_nod_no',
        'No 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['nosepick'] = {
        'anim@mp_player_intcelebrationfemale@nose_pick',
        'nose_pick',
        'Prendi in giro',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['noway'] = {
        'gestures@m@standing@casual',
        'gesture_no_way',
        'No Way',
        AnimationOptions = {
            EmoteDuration = 1500,
            EmoteMoving = true
        }
    },
    ['ok'] = {
        'anim@mp_player_intselfiedock',
        'idle_a',
        'OK',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['dock'] = {
        'anim@mp_player_intincardockstd@rds@',
        'idle_a',
        'Fai il volgare',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['outofbreath'] = {
        're@construction',
        'out_of_breath',
        'Senza fiato',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pickup'] = {'random@domestic', 'pickup_low', 'Raccogli'},
    ['push'] = {
        'missfinale_c2ig_11',
        'pushcar_offcliff_f',
        'Spingi',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['push2'] = {
        'missfinale_c2ig_11',
        'pushcar_offcliff_m',
        'Spingi 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['point'] = {
        'gestures@f@standing@casual',
        'gesture_point',
        'Punta',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pushup'] = {
        'amb@world_human_push_ups@male@idle_a',
        'idle_d',
        'Pushup',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['countdown'] = {
        'random@street_race',
        'grid_girl_race_start',
        'Countdown',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pointright'] = {
        'mp_gun_shop_tut',
        'indicate_right',
        'Punta a destra',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['salute'] = {
        'anim@mp_player_intincarsalutestd@ds@',
        'idle_a',
        'Saluta',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['salute2'] = {
        'anim@mp_player_intincarsalutestd@ps@',
        'idle_a',
        'Saluta 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['salute3'] = {
        'anim@mp_player_intuppersalute',
        'idle_a',
        'Saluta 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['scared'] = {
        'random@domestic',
        'f_distressed_loop',
        'Spaventato',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['scared2'] = {
        'random@homelandsecurity',
        'knees_loop_girl',
        'Spaventato 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['screwyou'] = {
        'misscommon@response',
        'screw_you',
        'Fottiti',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['shakeoff'] = {
        'move_m@_idles@shake_off',
        'shakeoff_1',
        'Pulisciti',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3500
        }
    },
    ['shot'] = {
        'random@dealgonewrong',
        'idle_a',
        'Ferito',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sleep'] = {
        'timetable@tracy@sleep@',
        'idle_c',
        'Dormi',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['shrug'] = {
        'gestures@f@standing@casual',
        'gesture_shrug_hard',
        'Alza spalle',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ['shrug2'] = {
        'gestures@m@standing@casual',
        'gesture_shrug_hard',
        'Alza spalle 2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ['sit'] = {
        'anim@amb@business@bgen@bgen_no_work@',
        'sit_phone_phoneputdown_idle_nowork',
        'Siediti',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sit2'] = {
        'rcm_barry3',
        'barry_3_sit_loop',
        'Siediti 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sit3'] = {
        'amb@world_human_picnic@male@idle_a',
        'idle_a',
        'Siediti 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sit4'] = {
        'amb@world_human_picnic@female@idle_a',
        'idle_a',
        'Siediti 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sit5'] = {
        'anim@heists@fleeca_bank@ig_7_jetski_owner',
        'owner_idle',
        'Siediti 5',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sit6'] = {
        'timetable@jimmy@mics3_ig_15@',
        'idle_a_jimmy',
        'Siediti 6',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sit7'] = {
        'anim@amb@nightclub@lazlow@lo_alone@',
        'lowalone_base_laz',
        'Siediti 7',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sit8'] = {
        'timetable@jimmy@mics3_ig_15@',
        'mics3_15_base_jimmy',
        'Siediti 8',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sit9'] = {
        'amb@world_human_stupor@male@idle_a',
        'idle_a',
        'Siediti 9',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitlean'] = {
        'timetable@tracy@ig_14@',
        'ig_14_base_tracy',
        'Siediti',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitsad'] = {
        'anim@amb@business@bgen@bgen_no_work@',
        'sit_phone_phoneputdown_sleeping-noworkfemale',
        'Siediti Triste',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitscared'] = {
        'anim@heists@ornate_bank@hostages@hit',
        'hit_loop_ped_b',
        'Siediti spaventato',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitscared2'] = {
        'anim@heists@ornate_bank@hostages@ped_c@',
        'flinch_loop',
        'Siediti spaventato 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitscared3'] = {
        'anim@heists@ornate_bank@hostages@ped_e@',
        'flinch_loop',
        'Siediti spaventato 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitdrunk'] = {
        'timetable@amanda@drunk@base',
        'base',
        'Siediti Ubriaco',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitchair2'] = {
        'timetable@ron@ig_5_p3',
        'ig_5_p3_base',
        'Siediti 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitchair3'] = {
        'timetable@reunited@ig_10',
        'base_amanda',
        'Siediti 3 (Female)',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitchair4'] = {
        'timetable@ron@ig_3_couch',
        'base',
        'Siediti 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitchair5'] = {
        'timetable@jimmy@mics3_ig_15@',
        'mics3_15_base_tracy',
        'Siediti a gambe incrociate',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitchair6'] = {
        'timetable@maid@couch@',
        'base',
        'Siediti Appoggiato',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sitchairside'] = {
        'timetable@ron@ron_ig_2_alt1',
        'ig_2_alt1_base',
        'Siediti a lato',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['situp'] = {
        'amb@world_human_sit_ups@male@idle_a',
        'idle_a',
        'Siediti',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['clapangry'] = {
        'anim@arena@celeb@flat@solo@no_props@',
        'angry_clap_a_player_a',
        'Applaudi 5',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['slowclap3'] = {
        'anim@mp_player_intupperslow_clap',
        'idle_a',
        'Applaudi 4',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },

    ['divdance1'] = {
        'divined@dancesv2@new',
        'divdance1',
        'Altro Ballo 1',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance2'] = {
        'divined@dancesv2@new',
        'divdance2',
        'Altro Ballo 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance3'] = {
        'divined@dancesv2@new',
        'divdance3',
        'Altro Ballo 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance4'] = {
        'divined@dancesv2@new',
        'divdance4',
        'Altro Ballo 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance5'] = {
        'divined@dancesv2@new',
        'divdance5',
        'Altro Ballo 5',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance6'] = {
        'divined@dancesv2@new',
        'divdance6',
        'Altro Ballo 6',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance7'] = {
        'divined@dancesv2@new',
        'divdance7',
        'Altro Ballo 7',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance8'] = {
        'divined@dancesv2@new',
        'divdance8',
        'Altro Ballo 8',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance9'] = {
        'divined@dancesv2@new',
        'divdance9',
        'Altro Ballo 9',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance10'] = {
        'divined@dancesv2@new',
        'divdance10',
        'Altro Ballo 10',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance11'] = {
        'divined@dancesv2@new',
        'divdance11',
        'Altro Ballo 11',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance12'] = {
        'divined@dancesv2@new',
        'divdance12',
        'Altro Ballo 12',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance13'] = {
        'divined@dancesv2@new',
        'divdance13',
        'Altro Ballo 13',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['divdance14'] = {
        'divined@dancesv2@new',
        'divdance14',
        'Altro Ballo 14',
        AnimationOptions = {
            EmoteLoop = true
        }
    },

    ['clap'] = {
        'amb@world_human_cheering@male_a',
        'base',
        'Applaudi',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['slowclap'] = {
        'anim@mp_player_intcelebrationfemale@slow_clap',
        'slow_clap',
        'Applaudi 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['slowclap2'] = {
        'anim@mp_player_intcelebrationmale@slow_clap',
        'slow_clap',
        'Applaudi 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['smell'] = {
        'move_p_m_two_idles@generic',
        'fidget_sniff_fingers',
        'Odora',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['stickup'] = {
        'random@countryside_gang_fight',
        'biker_02_stickup_loop',
        'Mira',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['stumble'] = {
        'misscarsteal4@actor',
        'stumble',
        'Inciampa',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['stunned'] = {
        'stungun@standing',
        'damage',
        'Stordito',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sunbathe'] = {
        'amb@world_human_sunbathe@male@back@base',
        'base',
        'Prendi il sole',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['sunbathe2'] = {
        'amb@world_human_sunbathe@female@back@base',
        'base',
        'Prendi il sole 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['t'] = {
        'missfam5_yoga',
        'a2_pose',
        'T',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['t2'] = {
        'mp_sleep',
        'bind_pose_180',
        'T 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['think5'] = {
        'mp_cp_welcome_tutthink',
        'b_think',
        'Pensa 5',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ['think'] = {
        'misscarsteal4@aliens',
        'rehearsal_base_idle_director',
        'Pensa',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['think3'] = {
        'timetable@tracy@ig_8@base',
        'base',
        'Pensa 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },

    ['think2'] = {
        'missheist_jewelleadinout',
        'jh_int_outro_loop_a',
        'Pensa 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['thumbsup3'] = {
        'anim@mp_player_intincarthumbs_uplow@ds@',
        'enter',
        'Pollice in Su 3',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ['thumbsup2'] = {
        'anim@mp_player_intselfiethumbs_up',
        'idle_a',
        'Pollice in Su 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['thumbsup'] = {
        'anim@mp_player_intupperthumbs_up',
        'idle_a',
        'Pollice in Su',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['type'] = {
        'anim@heists@prison_heiststation@cop_reactions',
        'cop_b_idle',
        'Digita',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['type2'] = {
        'anim@heists@prison_heistig1_p1_guard_checks_bus',
        'loop',
        'Digita 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['type3'] = {
        'mp_prison_break',
        'hack_loop',
        'Digita 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['type4'] = {
        'mp_fbi_heist',
        'loop',
        'Digita 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['warmth'] = {
        'amb@world_human_stand_fire@male@idle_a',
        'idle_a',
        'Calore',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['wave4'] = {
        'random@mugging5',
        '001445_01_gangintimidation_1_female_idle_b',
        'Onda 4',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ['wave2'] = {
        'anim@mp_player_intcelebrationfemale@wave',
        'wave',
        'Onda 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['wave3'] = {
        'friends@fra@ig_1',
        'over_here_idle_a',
        'Onda 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['wave'] = {
        'friends@frj@ig_1',
        'wave_a',
        'Onda',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['wave5'] = {
        'friends@frj@ig_1',
        'wave_b',
        'Onda 5',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['wave6'] = {
        'friends@frj@ig_1',
        'wave_c',
        'Onda 6',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['wave7'] = {
        'friends@frj@ig_1',
        'wave_d',
        'Onda 7',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['wave8'] = {
        'friends@frj@ig_1',
        'wave_e',
        'Onda 8',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['wave9'] = {
        'gestures@m@standing@casual',
        'gesture_hello',
        'Onda 9',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['whistle'] = {
        'taxi_hail',
        'hail_taxi',
        'Fischia',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1300
        }
    },
    ['whistle2'] = {
        'rcmnigel1c',
        'hailing_whistle_waive_a',
        'Fischia 2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ['yeah'] = {
        'anim@mp_player_intupperair_shagging',
        'idle_a',
        'Yeah',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['lift'] = {
        'random@hitch_lift',
        'idle_f',
        'Solleva',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['lol'] = {
        'anim@arena@celeb@flat@paired@no_props@',
        'laugh_a_player_b',
        'LOL',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['lol2'] = {
        'anim@arena@celeb@flat@solo@no_props@',
        'giggle_a_player_b',
        'LOL 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['statue2'] = {
        'fra_0_int-1',
        'cs_lamardavis_dual-1',
        'Statua 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['statue3'] = {
        'club_intro2-0',
        'csb_englishdave_dual-0',
        'Statua 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['gangsign'] = {
        'mp_player_int_uppergang_sign_a',
        'mp_player_int_gang_sign_a',
        'Segno Gang',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['gangsign2'] = {
        'mp_player_int_uppergang_sign_b',
        'mp_player_int_gang_sign_b',
        'Segno Gang 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['passout'] = {
        'missarmenian2',
        'drunk_loop',
        'Passout',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['passout2'] = {
        'missarmenian2',
        'corpse_search_exit_ped',
        'Passout 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['passout3'] = {
        'anim@gangops@morgue@table@',
        'body_search',
        'Passout 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['passout4'] = {
        'mini@cpr@char_b@cpr_def',
        'cpr_pumpchest_idle',
        'Passout 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['passout5'] = {
        'random@mugging4',
        'flee_backward_loop_shopkeeper',
        'Passout 5',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['petting'] = {
        'creatures@rottweiler@tricks@',
        'petting_franklin',
        'Gioca col cane',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['crawl'] = {
        'move_injured_ground',
        'front_loop',
        'Striscia',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['flip2'] = {'anim@arena@celeb@flat@solo@no_props@', 'cap_a_player_a', 'Capriola 2'},
    ['flip'] = {'anim@arena@celeb@flat@solo@no_props@', 'flip_a_player_a', 'Capriola'},
    ['slide'] = {'anim@arena@celeb@flat@solo@no_props@', 'slide_a_player_a', 'Slide'},
    ['slide2'] = {'anim@arena@celeb@flat@solo@no_props@', 'slide_b_player_a', 'Slide 2'},
    ['slide3'] = {'anim@arena@celeb@flat@solo@no_props@', 'slide_c_player_a', 'Slide 3'},
    ['slugger'] = {'anim@arena@celeb@flat@solo@no_props@', 'slugger_a_player_a', 'Colpisci'},
    ['flipoff'] = {
        'anim@arena@celeb@podium@no_prop@',
        'flip_off_a_1st',
        'Manda a fanculo',
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ['flipoff2'] = {
        'anim@arena@celeb@podium@no_prop@',
        'flip_off_c_1st',
        'Manda a fanculo 2',
        AnimationOptions = {
            EmoteMoving = true
        }
    },
    ['bow'] = {
        'anim@arena@celeb@podium@no_prop@',
        'regal_c_1st',
        'Arco',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['bow2'] = {
        'anim@arena@celeb@podium@no_prop@',
        'regal_a_1st',
        'Arco 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['keyfob'] = {
        'anim@mp_player_intmenu@key_fob@',
        'fob_click',
        'Portachiavi',
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ['reaching'] = {
        'move_m@intimidation@cop@unarmed',
        'idle',
        'Raggiungi',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['slap'] = {
        'melee@unarmed@streamed_variations',
        'plyr_takedown_front_slap',
        'Schiaffo',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ['headbutt'] = {'melee@unarmed@streamed_variations', 'plyr_takedown_front_headbutt', 'Testata'},
    ['fishdance'] = {
        'anim@mp_player_intupperfind_the_fish',
        'idle_a',
        'Ballo del Pesce',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['peace'] = {
        'mp_player_int_upperpeace_sign',
        'mp_player_int_peace_sign',
        'Pace',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['peace2'] = {
        'anim@mp_player_intupperpeace',
        'idle_a',
        'Pace 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['cpr'] = {
        'mini@cpr@char_a@cpr_str',
        'cpr_pumpchest',
        'CPR',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['cpr2'] = {
        'mini@cpr@char_a@cpr_str',
        'cpr_pumpchest',
        'CPR 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ledge'] = {
        'missfbi1',
        'ledge_loop',
        'Sporgenza',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['airplane'] = {
        'missfbi1',
        'ledge_loop',
        'Aereo',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['peek'] = {
        'random@paparazzi@peek',
        'left_peek_a',
        'Sbircia',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['cough'] = {
        'timetable@gardener@smoking_joint',
        'idle_cough',
        'Tosse',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['stretch'] = {
        'mini@triathlon',
        'idle_e',
        'Stretching',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['stretch2'] = {
        'mini@triathlon',
        'idle_f',
        'Stretching 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['stretch3'] = {
        'mini@triathlon',
        'idle_d',
        'Stretching 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['stretch4'] = {
        'rcmfanatic1maryann_stretchidle_b',
        'idle_e',
        'Stretching 4',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['celebrate'] = {
        'rcmfanatic1celebrate',
        'celebrate',
        'Celebra',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['punching'] = {
        'rcmextreme2',
        'loop_punching',
        'Colpisci',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['superhero'] = {
        'rcmbarry',
        'base',
        'Supereroe',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['superhero2'] = {
        'rcmbarry',
        'base',
        'Supereroe 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mindcontrol'] = {
        'rcmbarry',
        'mind_control_b_loop',
        'Controllo mentale',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['mindcontrol2'] = {
        'rcmbarry',
        'bar_1_attack_idle_aln',
        'Controllo mentale 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['clown'] = {
        'rcm_barry2',
        'clown_idle_0',
        'Clown',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['clown2'] = {
        'rcm_barry2',
        'clown_idle_1',
        'Clown 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['clown3'] = {
        'rcm_barry2',
        'clown_idle_2',
        'Clown 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['clown4'] = {
        'rcm_barry2',
        'clown_idle_3',
        'Clown 4',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['tryclothes'] = {
        'mp_clothing@female@trousers',
        'try_trousers_neutral_a',
        'Prova Vestiti',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['tryclothes2'] = {
        'mp_clothing@female@shirt',
        'try_shirt_positive_a',
        'Prova Vestiti 2',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['tryclothes3'] = {
        'mp_clothing@female@shoes',
        'try_shoes_positive_a',
        'Prova Vestiti 3',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['nervous2'] = {
        'mp_missheist_countrybank@nervous',
        'nervous_idle',
        'Nervoso 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['nervous'] = {
        'amb@world_human_bum_standing@twitchy@idle_a',
        'idle_c',
        'Nervoso',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['nervous3'] = {
        'rcmme_tracey1',
        'nervous_loop',
        'Nervoso 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['uncuff'] = {
        'mp_arresting',
        'a_uncuff',
        'Smanetta',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['namaste'] = {
        'timetable@amanda@ig_4',
        'ig_4_base',
        'Namaste',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['threaten'] = {
        'random@atmrobberygen',
        'b_atm_mugging',
        'Minaccia',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['radio'] = {
        'random@arrests',
        'generic_radio_chatter',
        'Radio',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pull'] = {
        'random@mugging4',
        'struggle_loop_b_thief',
        'Tira',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['bird'] = {'random@peyote@bird', 'wakeup', 'Uccello'},
    ['chicken'] = {
        'random@peyote@chicken',
        'wakeup',
        'Gallina',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['bark'] = {'random@peyote@dog', 'wakeup', 'Abbaia'},
    ['rabbit'] = {'random@peyote@rabbit', 'wakeup', 'Coniglio'},
    ['spiderman'] = {
        'missexile3',
        'ex03_train_roof_idle',
        'Spider-Man',
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ['boi'] = {
        'special_ped@jane@monologue_5@monologue_5c',
        'brotheradrianhasshown_2',
        'Guai a te!',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ['adjust'] = {
        'missmic4',
        'michael_tux_fidget',
        'Aggiusta',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ['handsup'] = {
        'mp_arresting',
        'idle',
        'Alza le mani',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['handsup2'] = {
        'anim@mp_player_intuppersurrender',
        'idle_a_fp',
        'Alza le mani 2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['pee'] = {
        'misscarsteal2peeing',
        'peeing_loop',
        'Piscia',
        AnimationOptions = {
            EmoteStuck = true,
            PtfxAsset = 'scr_amb_chop',
            PtfxName = 'ent_anim_dog_peeing',
            PtfxNoProp = true,
            PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, 1.0},
            PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
            PtfxWait = 3000
        }
    },
    ['valet'] = {
        'anim@amb@casino@valet_scenario@pose_a@',
        'base_a_m_y_vinewood_01',
        'Stendi mani',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['valet2'] = {
        'anim@amb@casino@valet_scenario@pose_b@',
        'base_a_m_y_vinewood_01',
        'Appoggiati',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['valet3'] = {
        'anim@amb@casino@valet_scenario@pose_d@',
        'base_a_m_y_vinewood_01',
        'Osserva',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['hump'] = {
        'timetable@trevor@skull_loving_bear',
        'skull_loving_bear',
        'Gobba',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['tighten'] = {
        'timetable@denice@ig_1',
        'idle_b',
        'Yoga',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['fspose'] = {
        'missfam5_yoga',
        'c2_pose',
        'Posa',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['fspose2'] = {
        'missfam5_yoga',
        'c6_pose',
        'Posa 2',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['fspose4'] = {
        'anim@amb@carmeet@checkout_car@',
        'female_c_idle_d',
        'Posa 4',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['showerf'] = {
        'mp_safehouseshower@female@',
        'shower_enter_into_idle',
        'Entra in docciaF',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['showerf2'] = {
        'mp_safehouseshower@female@',
        'shower_idle_a',
        'DocciaF',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['showerf3'] = {
        'mp_safehouseshower@female@',
        'shower_idle_b',
        'DocciaF 2',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['showerm'] = {
        'mp_safehouseshower@male@',
        'male_shower_idle_a',
        'Entra in doccia',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['showerm2'] = {
        'mp_safehouseshower@male@',
        'male_shower_idle_b',
        'Doccia 2',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['showerm3'] = {
        'mp_safehouseshower@male@',
        'male_shower_idle_c',
        'Doccia 3',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['showerm4'] = {
        'mp_safehouseshower@male@',
        'male_shower_idle_d',
        'Doccia 4',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true

        }
    },
    ['picklock'] = {
        'missheistfbisetup1',
        'hassle_intro_loop_f',
        'Picklock',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true

        }
    },
    ['cleanhands'] = {
        'missheist_agency3aig_23',
        'urinal_sink_loop',
        'Puliscili le mani',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true

        }
    },
    ['cleanface'] = {
        'switch@michael@wash_face',
        'loop_michael',
        'Pulsici faccia',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true

        }
    },
    ['buzz'] = {
        'anim@apt_trans@buzzer',
        'buzz_reg',
        'Citofona',
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = false

        }
    },
    ['mgangsign_1'] = {
        'mikey@gangsigns@new',
        'mgangsign_1',
        'Segno Gang 1',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mgangsign_2'] = {
        'mikey@gangsigns@new',
        'mgangsign_2',
        'Segno Gang 2',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mgangsign_3'] = {
        'mikey@gangsigns@new',
        'mgangsign_3',
        'Segno Gang 3',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mgangsign_4'] = {
        'mikey@gangsigns@new',
        'mgangsign_4',
        'Segno Gang 4',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mgangsign_5'] = {
        'mikey@gangsigns@new',
        'mgangsign_5',
        'Segno Gang 5',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mgangsign_6'] = {
        'mikey@gangsigns@new',
        'mgangsign_6',
        'Segno Gang 6',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mgangsign_7'] = {
        'mikey@gangsigns@new',
        'mgangsign_7',
        'Segno Gang 7',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mgangsign_8'] = {
        'mikey@gangsigns@new',
        'mgangsign_8',
        'Segno Gang 8',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mgangsign_9'] = {
        'mikey@gangsigns@new',
        'mgangsign_9',
        'Segno Gang 9',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mgangsign_10'] = {
        'mikey@gangsigns@new',
        'mgangsign_10',
        'Segno Gang 10',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mgangsign_11'] = {
        'mikey@gangsigns@new',
        'mgangsign_11',
        'Segno Gang 11',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['downward_fortnite'] = {
        'export@downward_fortnite',
        'Downward_fortnite',
        'Fortnite 1',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },

    ['pullup'] = {
        'export@pullup',
        'pullup',
        'Fortnite 2',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },

    ['rollie'] = {
        'export@rollie',
        'rollie',
        'Fortnite 3',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },

    ['wanna_see_me'] = {
        'export@wanna_see_me',
        'wanna_see_me',
        'Fortnite 4',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },

    ['billybounce'] = {
        'export@billybounce',
        'billybounce',
        'Fortnite 5',
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ['atm'] = {'Scenario', 'PROP_HUMAN_ATM', 'ATM'},
    ['bbq'] = {'MaleScenario', 'PROP_HUMAN_BBQ', 'BBQ'},
    ['bumbin'] = {'Scenario', 'PROP_HUMAN_BUM_BIN', 'Bidone'},
    ['bumsleep'] = {'Scenario', 'WORLD_HUMAN_BUM_SLUMPED', 'Dormi'},
    ['cheer'] = {'Scenario', 'WORLD_HUMAN_CHEERING', 'Allegria'},
    ['chinup'] = {'Scenario', 'PROP_HUMAN_MUSCLE_CHIN_UPS', 'Chinup'},
    ['cop'] = {'Scenario', 'WORLD_HUMAN_COP_IDLES', 'Cop'},
    ['drilling'] = {'Scenario', 'WORLD_HUMAN_CONST_DRILL', 'Usa Trapano'},
    ['filmshocking'] = {'Scenario', 'WORLD_HUMAN_MOBILE_FILM_SHOCKING', 'Shock'},
    ['flex'] = {'Scenario', 'WORLD_HUMAN_MUSCLE_FLEX', 'Flex'},
    ['guard'] = {'Scenario', 'WORLD_HUMAN_GUARD_STAND', 'Guardia'},
    ['garden'] = {'Scenario', 'WORLD_HUMAN_GARDENER_PLANT', 'Giardinaggio'},
    ['hammer'] = {'Scenario', 'WORLD_HUMAN_HAMMERING', 'Martello'},
    ['hangout'] = {'Scenario', 'WORLD_HUMAN_HANG_OUT_STREET', 'Esci'},
    ['impatient'] = {'Scenario', 'WORLD_HUMAN_STAND_IMPATIENT', 'Impaziente'},
    ['janitor'] = {'Scenario', 'WORLD_HUMAN_JANITOR', 'Pulizie'},
    ['jog'] = {'Scenario', 'WORLD_HUMAN_JOG_STANDING', 'Jogging'},
    ['kneel'] = {'Scenario', 'CODE_HUMAN_MEDIC_KNEEL', 'Inginocchiarsi'},
    ['lean'] = {'Scenario', 'WORLD_HUMAN_LEANING', 'Lean'},
    ['leanbar'] = {'Scenario', 'PROP_HUMAN_BUM_SHOPPING_CART', 'Lean Bar'},
    ['lookout'] = {'Scenario', 'CODE_HUMAN_CROSS_ROAD_WAIT', 'Attenzione'},
    ['maid'] = {'Scenario', 'WORLD_HUMAN_MAID_CLEAN', 'Domestica'},
    ['medic'] = {'Scenario', 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 'Medico'},
    ['musician'] = {'MaleScenario', 'WORLD_HUMAN_MUSICIAN', 'Musicista'}, -- Ambient Music Doesn't Seem To Work For Female, Hence It's Male Only
    ['notepad2'] = {'Scenario', 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 'Notepad 2'},
    ['parkingmeter'] = {'Scenario', 'PROP_HUMAN_PARKING_METER', 'Parchimetro'},
    ['party'] = {'Scenario', 'WORLD_HUMAN_PARTYING', 'Party'},
    ['texting'] = {'Scenario', 'WORLD_HUMAN_STAND_MOBILE', 'SMS'},
    ['prosthigh'] = {'Scenario', 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS', 'Prostituta Alto'},
    ['prostlow'] = {'Scenario', 'WORLD_HUMAN_PROSTITUTE_LOW_CLASS', 'Prostituta Basso'},
    ['puddle'] = {'Scenario', 'WORLD_HUMAN_BUM_WASH', 'Pozzanghera'},
    ['record'] = {'Scenario', 'WORLD_HUMAN_MOBILE_FILM_SHOCKING', 'Disco'},
    -- Sitchair is a litte special, since you want the player to be seated correctly.
    -- So we set it as 'ScenarioObject' and do TaskStartScenarioAtPosition() instead of 'AtPlace'
    ['sitchair'] = {'ScenarioObject', 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER', 'Siediti'},
    ['smoke'] = {'Scenario', 'WORLD_HUMAN_SMOKING', 'Fuma'},
    ['smokeweed'] = {'MaleScenario', 'WORLD_HUMAN_DRUG_DEALER', 'Fuma Marijuana'}, -- Male
    ['smokepot'] = {'Scenario', 'WORLD_HUMAN_SMOKING_POT', 'Fuma Marijuana 2'}, -- Female
    ['statue'] = {'Scenario', 'WORLD_HUMAN_HUMAN_STATUE', 'Statua'},
    ['sunbatheback'] = {'Scenario', 'WORLD_HUMAN_SUNBATHE_BACK', 'Abbronzati Dietro'},
    ['weld'] = {'Scenario', 'WORLD_HUMAN_WELDING', 'Saldare'},
    ['windowshop'] = {'Scenario', 'WORLD_HUMAN_WINDOW_SHOP_BROWSE', 'Vetreria'},
    ['yoga'] = {'Scenario', 'WORLD_HUMAN_YOGA', 'Yoga'},
    -- CASINO DLC EMOTES (Requires gamebuild 2060 or higher)
    ['karate'] = {'anim@mp_player_intcelebrationfemale@karate_chops', 'karate_chops', 'Karate'},
    ['karate2'] = {'anim@mp_player_intcelebrationmale@karate_chops', 'karate_chops', 'Karate 2'},
    ['cutthroat'] = {'anim@mp_player_intcelebrationmale@cut_throat', 'cut_throat', 'Tagliare la gola'},
    ['cutthroat2'] = {'anim@mp_player_intcelebrationfemale@cut_throat', 'cut_throat', 'Tagliare la gola 2'},
    ['mindblown'] = {
        'anim@mp_player_intcelebrationmale@mind_blown',
        'mind_blown',
        'Sbalordisci',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ['mindblown2'] = {
        'anim@mp_player_intcelebrationfemale@mind_blown',
        'mind_blown',
        'Sbalordisci 2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ['boxing'] = {
        'anim@mp_player_intcelebrationmale@shadow_boxing',
        'shadow_boxing',
        'Boxing',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ['boxing2'] = {
        'anim@mp_player_intcelebrationfemale@shadow_boxing',
        'shadow_boxing',
        'Boxing 2',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ['stink'] = {
        'anim@mp_player_intcelebrationfemale@stinker',
        'stinker',
        'Puzza',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['think4'] = {
        'anim@amb@casino@hangout@ped_male@stand@02b@idles',
        'idle_a',
        'Pensa 4',
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['adjusttie'] = {
        'clothingtie',
        'try_tie_positive_a',
        'Aggiusta Cravatta',
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 5000
        }
    }
}

DP.PropEmotes = {
    ['umbrella'] = {
        'amb@world_human_drinking@coffee@male@base',
        'base',
        'Ombrello',
        AnimationOptions = {
            Prop = 'p_amb_brolly_01',
            PropBone = 57005,
            PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['umbrella2'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Ombrello 2',
        AnimationOptions = {
            Prop = 'p_amb_brolly_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.0100, 0.1100, 2.3402393, -150.9605721, 57.3374916},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },

    -----------------------------------------------------------------------------------------------------
    ------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
    -----------------------------------------------------------------------------------------------------

    ['notepad'] = {
        'missheistdockssetup1clipboard@base',
        'base',
        'Notepad',
        AnimationOptions = {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 58866,
            SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
            -- EmoteLoop is used for emotes that should loop, its as simple as that.
            -- Then EmoteMoving is used for emotes that should only play on the upperbody.
            -- The code then checks both values and sets the MovementType to the correct one
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['box'] = {
        'anim@heists@box_carry@',
        'idle',
        'Box',
        AnimationOptions = {
            Prop = 'hei_prop_heist_box',
            PropBone = 60309,
            PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['rose'] = {
        'anim@heists@humane_labs@finale@keycards',
        'ped_a_enter_loop',
        'Rosa',
        AnimationOptions = {
            Prop = 'prop_single_rose',
            PropBone = 18905,
            PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['smoke2'] = {
        'amb@world_human_aa_smoke@male@idle_a',
        'idle_c',
        'Fuma 2',
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['smoke3'] = {
        'amb@world_human_aa_smoke@male@idle_a',
        'idle_b',
        'Fuma 3',
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['smoke4'] = {
        'amb@world_human_smoking@female@idle_a',
        'idle_b',
        'Fuma 4',
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['bong'] = {
        'anim@safehouse@bong',
        'bong_stage3',
        'Bong',
        AnimationOptions = {
            Prop = 'hei_heist_sh_bong_01',
            PropBone = 18905,
            PropPlacement = {0.10, -0.25, 0.0, 95.0, 190.0, 180.0}
        }
    },
    ['fishing1'] = {
        'amb@world_human_stand_fishing@idle_a',
        'idle_a',
        'Pesca',
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['fishing2'] = {
        'amb@world_human_stand_fishing@idle_a',
        'idle_b',
        'Pesca 2',
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['fishing3'] = {
        'amb@world_human_stand_fishing@idle_a',
        'idle_c',
        'Pesca 3',
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['suitcase'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Valigia',
        AnimationOptions = {
            Prop = 'prop_ld_suitcase_01',
            PropBone = 57005,
            PropPlacement = {0.35, 0.0, 0.0, 0.0, 266.0, 90.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['suitcase2'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Valigia 2',
        AnimationOptions = {
            Prop = 'prop_security_case_01',
            PropBone = 57005,
            PropPlacement = {0.13, 0.0, -0.01, 0.0, 280.0, 90.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['boombox'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Boombox',
        AnimationOptions = {
            Prop = 'prop_boombox_01',
            PropBone = 57005,
            PropPlacement = {0.27, 0.0, 0.0, 0.0, 263.0, 58.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['toolbox'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Toolbox',
        AnimationOptions = {
            Prop = 'prop_tool_box_04',
            PropBone = 28422,
            PropPlacement = {0.3960, 0.0410, -0.0030, -90.00, 0.0, 90.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['toolbox2'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Toolbox 2',
        AnimationOptions = {
            Prop = 'imp_prop_tool_box_01a',
            PropBone = 28422,
            PropPlacement = {0.3700, 0.0200, 0.0, 90.00, 0.0, -90.00},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['gbag'] = {
        'missfbi4prepp1',
        '_idle_garbage_man',
        'Busta della spazzatura',
        AnimationOptions = {
            Prop = 'prop_cs_street_binbag_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0400, -0.0200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['beerbox'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Scatola di Birra 1',
        AnimationOptions = {
            Prop = 'v_ret_ml_beerdus',
            PropBone = 57005,
            PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['beerbox2'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Scatola di Birra 2',
        AnimationOptions = {
            Prop = 'v_ret_ml_beeram',
            PropBone = 57005,
            PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['beerbox3'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Scatola di Birra 3',
        AnimationOptions = {
            Prop = 'v_ret_ml_beerpride',
            PropBone = 57005,
            PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['beerbox4'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Scatola di Birra 4',
        AnimationOptions = {
            Prop = 'v_ret_ml_beerbar',
            PropBone = 57005,
            PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 60.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mugshot'] = {
        'mp_character_creation@customise@male_a',
        'loop',
        'Mugshot',
        AnimationOptions = {
            Prop = 'prop_police_id_board',
            PropBone = 58868,
            PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['coffee'] = {
        'amb@world_human_drinking@coffee@male@idle_a',
        'idle_c',
        'Caffe',
        AnimationOptions = {
            Prop = 'p_amb_coffeecup_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['whiskey'] = {
        'amb@world_human_drinking@coffee@male@idle_a',
        'idle_c',
        'Whiskey',
        AnimationOptions = {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['whiskeyb'] = {
        'amb@world_human_drinking@beer@male@idle_a',
        'idle_a',
        'Bottiglia Whiskey',
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.05, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },

    ['beer'] = {
        'amb@world_human_drinking@beer@male@idle_a',
        'idle_c',
        'Birra',
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.06, 0.0, 15.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['beer2'] = {
        'amb@world_human_drinking@beer@male@idle_a',
        'idle_a',
        'Birra 2',
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.05, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['beer3'] = {
        'amb@world_human_drinking@beer@male@idle_a',
        'idle_c',
        'Birra 3',
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.06, 0.0, 15.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['beer4'] = {
        'amb@world_human_drinking@beer@male@idle_a',
        'idle_a',
        'Birra 4',
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.05, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['beerf'] = {
        'amb@world_human_drinking@beer@female@idle_a',
        'idle_a',
        'BirraD',
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, -0.0, 0.05, 15.0, 15.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['beerf2'] = {
        'amb@world_human_drinking@beer@female@idle_a',
        'idle_e',
        'BirraD 2',
        AnimationOptions = {
            Prop = 'prop_wine_rose',
            PropBone = 28422,
            PropPlacement = {-0.0, 0.04, -0.19, 10.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
            ---       PropPlacement = {-0.0, 0.03, -0.20, 5.0, 0.0, 0.0},
            ---                         F&B   L&R   U&D  R.F&B
        }
    },
    ['beerf3'] = {
        'amb@world_human_drinking@beer@female@idle_a',
        'idle_a',
        'BirraD 3',
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, -0.0, 0.05, 15.0, 15.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
        }
    },
    ['beerf4'] = {
        'amb@world_human_drinking@beer@female@idle_a',
        'idle_e',
        'BirraD 4',
        AnimationOptions = {
            Prop = 'prop_wine_rose',
            PropBone = 28422,
            PropPlacement = {-0.0, 0.04, -0.19, 10.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = false
            ---       PropPlacement = {-0.0, 0.03, -0.20, 5.0, 0.0, 0.0},
            ---                         F&B   L&R   U&D  R.F&B
        }
    },
    ['cup'] = {
        'amb@world_human_drinking@coffee@male@idle_a',
        'idle_c',
        'Tazza',
        AnimationOptions = {
            Prop = 'prop_plastic_cup_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['donut'] = {
        'mp_player_inteat@burger',
        'mp_player_int_eat_burger',
        'Ciambella',
        AnimationOptions = {
            Prop = 'prop_amb_donut',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true
        }
    },
    ['burger'] = {
        'mp_player_inteat@burger',
        'mp_player_int_eat_burger',
        'Burger',
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true
        }
    },
    ['sandwich'] = {
        'mp_player_inteat@burger',
        'mp_player_int_eat_burger',
        'Sandwich',
        AnimationOptions = {
            Prop = 'prop_sandwich_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true
        }
    },
    ['soda'] = {
        'amb@world_human_drinking@coffee@male@idle_a',
        'idle_c',
        'Soda',
        AnimationOptions = {
            Prop = 'prop_ecola_can',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['water'] = {
        'amb@world_human_drinking@coffee@male@idle_a',
        'idle_c',
        'Acqua',
        AnimationOptions = {
            Prop = 'ba_prop_club_water_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.090, 0.0, 0.0, 130.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['egobar'] = {
        'mp_player_inteat@burger',
        'mp_player_int_eat_burger',
        'Ego Bar',
        AnimationOptions = {
            Prop = 'prop_choc_ego',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true
        }
    },
    ['candy'] = {
        'mp_player_inteat@pnq',
        'loop',
        'Caramella',
        AnimationOptions = {
            Prop = 'prop_candy_pqs',
            PropBone = 60309,
            PropPlacement = {-0.0300, 0.0180, 0.0, 180.0, 180.0, -88.099},
            EmoteMoving = true
        }
    },
    ['wine'] = {
        'anim@heists@humane_labs@finale@keycards',
        'ped_a_enter_loop',
        'Vino',
        AnimationOptions = {
            Prop = 'prop_drink_redwine',
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['flute'] = {
        'anim@heists@humane_labs@finale@keycards',
        'ped_a_enter_loop',
        'Flauto',
        AnimationOptions = {
            Prop = 'prop_champ_flute',
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['champagne'] = {
        'anim@heists@humane_labs@finale@keycards',
        'ped_a_enter_loop',
        'Champagne',
        AnimationOptions = {
            Prop = 'prop_drink_champ',
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['cigar'] = {
        'amb@world_human_smoking@male@male_a@enter',
        'enter',
        'Sigaro',
        AnimationOptions = {
            Prop = 'prop_cigar_02',
            PropBone = 47419,
            PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ['cigar2'] = {
        'amb@world_human_smoking@male@male_a@enter',
        'enter',
        'Sigaro 2',
        AnimationOptions = {
            Prop = 'prop_cigar_01',
            PropBone = 47419,
            PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ['guitar'] = {
        'amb@world_human_musician@guitar@male@idle_a',
        'idle_b',
        'Chitarra',
        AnimationOptions = {
            Prop = 'prop_acc_guitar_01',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['guitar2'] = {
        'switch@trevor@guitar_beatdown',
        '001370_02_trvs_8_guitar_beatdown_idle_busker',
        'Chitarra 2',
        AnimationOptions = {
            Prop = 'prop_acc_guitar_01',
            PropBone = 24818,
            PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['guitarelectric'] = {
        'amb@world_human_musician@guitar@male@idle_a',
        'idle_b',
        'Chitarra Elettrica',
        AnimationOptions = {
            Prop = 'prop_el_guitar_01',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['guitarelectric2'] = {
        'amb@world_human_musician@guitar@male@idle_a',
        'idle_b',
        'Chitarra Elettrica 2',
        AnimationOptions = {
            Prop = 'prop_el_guitar_03',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['book'] = {
        'cellphone@',
        'cellphone_text_read_base',
        'Libro',
        AnimationOptions = {
            Prop = 'prop_novel_01',
            PropBone = 6286,
            PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['bouquet'] = {
        'impexp_int-0',
        'mp_m_waremech_01_dual-0',
        'Bouquet',
        AnimationOptions = {
            Prop = 'prop_snow_flower_02',
            PropBone = 24817,
            PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['teddy'] = {
        'impexp_int-0',
        'mp_m_waremech_01_dual-0',
        'Teddy',
        AnimationOptions = {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 24817,
            PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['backpack'] = {
        'move_p_m_zero_rucksack',
        'nill',
        'Zaino',
        AnimationOptions = {
            Prop = 'p_michael_backpack_s',
            PropBone = 24818,
            PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['clipboard'] = {
        'missfam4',
        'base',
        'Appunti',
        AnimationOptions = {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['map'] = {
        'amb@world_human_tourist_map@male@base',
        'base',
        'Mappa',
        AnimationOptions = {
            Prop = 'prop_tourist_map_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ['map2'] = {
        'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
        'idle_a',
        'Mappa 2',
        AnimationOptions = {
            Prop = 'prop_tourist_map_01',
            PropBone = 28422,
            PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['beg'] = {
        'amb@world_human_bum_freeway@male@base',
        'base',
        'Elemosina',
        AnimationOptions = {
            Prop = 'prop_beggers_sign_03',
            PropBone = 58868,
            PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['makeitrain'] = {
        'anim@mp_player_intupperraining_cash',
        'idle_a',
        'Flexa Soldi',
        AnimationOptions = {
            Prop = 'prop_anim_cash_pile_01',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = 'scr_xs_celebration',
            PtfxName = 'scr_xs_money_rain',
            PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
            PtfxInfo = Config.Languages[Config.MenuLanguage]['makeitrain'],
            PtfxWait = 500
        }
    },
    ['camera'] = {
        'amb@world_human_paparazzi@male@base',
        'base',
        'Fotocamera',
        AnimationOptions = {
            Prop = 'prop_pap_camera_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
            PtfxAsset = 'scr_bike_business',
            PtfxName = 'scr_bike_cfid_camera_flash',
            PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200
        }
    },
    ['champagnespray'] = {
        'anim@mp_player_intupperspray_champagne',
        'idle_a',
        'Spray Champagne',
        AnimationOptions = {
            Prop = 'ba_prop_battle_champ_open',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = 'scr_ba_club',
            PtfxName = 'scr_ba_club_champagne_spray',
            PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            PtfxInfo = Config.Languages[Config.MenuLanguage]['spraychamp'],
            PtfxWait = 500
        }
    },
    ['joint'] = {
        'amb@world_human_smoking@male@male_a@enter',
        'enter',
        'Joint',
        AnimationOptions = {
            Prop = 'p_cs_joint_02',
            PropBone = 47419,
            PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ['cig'] = {
        'amb@world_human_smoking@male@male_a@enter',
        'enter',
        'Sigaro',
        AnimationOptions = {
            Prop = 'prop_amb_ciggy_01',
            PropBone = 47419,
            PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ['brief'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Valigetta',
        AnimationOptions = {
            Prop = 'prop_ld_case_01',
            PropBone = 57005,
            PropPlacement = {0.12, 0.0, 0.0, 0.0, 255.0, 80.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['tablet'] = {
        'amb@world_human_tourist_map@male@base',
        'base',
        'Tablet',
        AnimationOptions = {
            Prop = 'prop_cs_tablet',
            PropBone = 28422,
            PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['tablet2'] = {
        'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
        'idle_a',
        'Tablet 2',
        AnimationOptions = {
            Prop = 'prop_cs_tablet',
            PropBone = 28422,
            PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['phonecall'] = {
        'cellphone@',
        'cellphone_call_listen_base',
        'Chiama al Telefono',
        AnimationOptions = {
            Prop = 'prop_phone_ing',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['phonecall2'] = {
        'random@kidnap_girl',
        'ig_1_girl_on_phone_loop',
        'Telefono 2',
        AnimationOptions = {
            Prop = 'prop_phone_ing',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['phone'] = {
        'cellphone@',
        'cellphone_text_read_base',
        'Telefono',
        AnimationOptions = {
            Prop = 'prop_phone_cs_frank',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['clean'] = {
        'timetable@floyd@clean_kitchen@base',
        'base',
        'Pulisci',
        AnimationOptions = {
            Prop = 'prop_sponge_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['clean2'] = {
        'amb@world_human_maid_clean@',
        'base',
        'Pulisci 2',
        AnimationOptions = {
            Prop = 'prop_sponge_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['protest'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Protesta',
        AnimationOptions = {
            Prop = 'prop_cs_protest_sign_01',
            PropBone = 57005,
            PropPlacement = {0.1820, 0.2400, 0.0600, -69.3774235, 5.9142048, -13.9572354},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['binoculars'] = {
        'amb@world_human_binoculars@male@idle_b',
        'idle_f',
        'Binocolo',
        AnimationOptions = {
            Prop = 'prop_binoc_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['binoculars2'] = {
        'amb@world_human_binoculars@male@idle_a',
        'idle_c',
        'Binocolo 2',
        AnimationOptions = {
            Prop = 'prop_binoc_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['tennisplay'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Tennis',
        AnimationOptions = {
            Prop = 'prop_tennis_bag_01',
            PropBone = 57005,
            PropPlacement = {0.27, 0.0, 0.0, 91.0, 0.0, -82.9999951},
            SecondProp = 'prop_tennis_rack_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0800, 0.0300, 0.0, -130.2907295, 3.8782324, 6.588224},
            EmoteLoop = true,
            EmoteMoving = true

        }
    },
    ['weights'] = {
        'amb@world_human_muscle_free_weights@male@barbell@base',
        'base',
        'Pesi',
        AnimationOptions = {
            Prop = 'prop_curl_bar_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['weights2'] = {
        'amb@world_human_muscle_free_weights@male@barbell@idle_a',
        'idle_d',
        'Pesi 2',
        AnimationOptions = {
            Prop = 'prop_curl_bar_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['fuel'] = {
        'weapons@misc@jerrycan@',
        'fire',
        'Benzina',
        AnimationOptions = {
            Prop = 'w_am_jerrycan',
            PropBone = 57005,
            PropPlacement = {0.1800, 0.1300, -0.2400, -165.8693883, -11.2122753, -32.9453021},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['fuel2'] = {
        'weapons@misc@jerrycan@franklin',
        'idle',
        'Benzina 2',
        AnimationOptions = {
            Prop = 'w_am_jerrycan',
            PropBone = 28422,
            PropPlacement = {0.26, 0.050, 0.0300, 80.00, 180.000, 79.99},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['hitchhike'] = {
        'random@hitch_lift',
        'idle_f',
        'Autostop',
        AnimationOptions = {
            Prop = 'w_am_jerrycan',
            PropBone = 18905,
            PropPlacement = {0.32, -0.0100, 0.0, -162.423, 74.83, 58.79},
            SecondProp = 'prop_michael_backpack',
            SecondPropBone = 40269,
            SecondPropPlacement = {-0.07, -0.21, -0.11, -144.93, 117.358, -6.16},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ssign'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Segnale Cartello ',
        AnimationOptions = {
            Prop = 'prop_sign_road_01a',
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ssign2'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Segnale Cartello 2 ',
        AnimationOptions = {
            Prop = 'prop_sign_road_02a',
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ssign3'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Segnale Cartello 3 ',
        AnimationOptions = {
            Prop = 'prop_sign_road_03d',
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ssign4'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Segnale Cartello 4 ',
        AnimationOptions = {
            Prop = 'prop_sign_road_04a',
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ssign5'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Segnale Cartello 5 ',
        AnimationOptions = {
            Prop = 'prop_sign_road_04w',
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ssign6'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Segnale Cartello 6 ',
        AnimationOptions = {
            Prop = 'prop_sign_road_05a',
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ssign7'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Segnale Cartello ',
        AnimationOptions = {
            Prop = 'prop_sign_road_05t',
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ssign8'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Segnale Cartello Autostrada ',
        AnimationOptions = {
            Prop = 'prop_sign_freewayentrance',
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['ssign9'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Segnale STOP Neve ',
        AnimationOptions = {
            Prop = 'prop_snow_sign_road_01a',
            PropBone = 60309,
            PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['conehead'] = {
        'move_m@drunk@verydrunk_idles@',
        'fidget_07',
        'Testa di Cono ',
        AnimationOptions = {
            Prop = 'prop_roadcone02b',
            PropBone = 31086,
            PropPlacement = {0.0500, 0.0200, -0.000, 30.0000004, 90.0, 0.0},
            --
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodtray'] = {
        'anim@heists@box_carry@',
        'idle',
        'Vassoio di cibo',
        AnimationOptions = {
            Prop = 'prop_food_bs_tray_03',
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodtray2'] = {
        'anim@heists@box_carry@',
        'idle',
        'Vassoio di cibo 2',
        AnimationOptions = {
            Prop = 'prop_food_bs_tray_02',
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodtray3'] = {
        'anim@heists@box_carry@',
        'idle',
        'Vassoio di cibo 3',
        AnimationOptions = {
            Prop = 'prop_food_cb_tray_02',
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodtray4'] = {
        'anim@heists@box_carry@',
        'idle',
        'Vassoio di cibo 4',
        AnimationOptions = {
            Prop = 'prop_food_tray_02',
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodtray5'] = {
        'anim@heists@box_carry@',
        'idle',
        'Vassoio di cibo 5',
        AnimationOptions = {
            Prop = 'prop_food_tray_03',
            PropBone = 28422,
            PropPlacement = {0.0100, -0.0400, -0.1390, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodtray6'] = {
        'anim@heists@box_carry@',
        'idle',
        'Vassoio di cibo 6',
        AnimationOptions = {
            Prop = 'prop_food_bs_tray_02',
            PropBone = 57005,
            PropPlacement = {0.2500, 0.1000, 0.0700, -110.5483936, 73.3529273, -16.338362},
            SecondProp = 'prop_food_bs_tray_03',
            SecondPropBone = 18905,
            SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodtray7'] = {
        'anim@heists@box_carry@',
        'idle',
        'Vassoio di cibo 7',
        AnimationOptions = {
            Prop = 'prop_food_cb_tray_02',
            PropBone = 57005,
            PropPlacement = {0.2500, 0.1000, 0.0700, -110.5483936, 73.3529273, -16.338362},
            SecondProp = 'prop_food_cb_tray_02',
            SecondPropBone = 18905,
            SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodtray8'] = {
        'anim@heists@box_carry@',
        'idle',
        'Vassoio di cibo 8',
        AnimationOptions = {
            Prop = 'prop_food_tray_02',
            PropBone = 57005,
            PropPlacement = {0.2500, 0.1000, 0.0700, -110.5483936, 73.3529273, -16.338362},
            SecondProp = 'prop_food_tray_03',
            SecondPropBone = 18905,
            SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodtraytray9'] = {
        'anim@heists@box_carry@',
        'idle',
        'Vassoio di cibo 9',
        AnimationOptions = {
            Prop = 'prop_food_tray_02',
            PropBone = 57005,
            PropPlacement = {0.2500, 0.1000, 0.0700, -110.5483936, 73.3529273, -16.338362},
            SecondProp = 'prop_food_tray_02',
            SecondPropBone = 18905,
            SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carrypizza'] = {
        'anim@heists@box_carry@',
        'idle',
        'Pizza',
        AnimationOptions = {
            Prop = 'prop_pizza_box_02',
            PropBone = 28422,
            PropPlacement = {0.0100, -0.1000, -0.1590, 20.0000007, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodbag'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Sacco Cibo',
        AnimationOptions = {
            Prop = 'prop_food_bs_bag_01',
            PropBone = 57005,
            PropPlacement = {0.3300, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodbag2'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Sacco Cibo 2',
        AnimationOptions = {
            Prop = 'prop_food_cb_bag_01',
            PropBone = 57005,
            PropPlacement = {0.3800, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['carryfoodbag3'] = {
        'move_weapon@jerrycan@generic',
        'idle',
        'Sacco Cibo 3',
        AnimationOptions = {
            Prop = 'prop_food_bag1',
            PropBone = 57005,
            PropPlacement = {0.3800, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['tag'] = {
        'anim@scripted@freemode@postertag@graffiti_spray@male@',
        'shake_can_male',
        'Spray',
        AnimationOptions = {
            Prop = 'prop_cs_spray_can',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['tag2'] = {
        'anim@scripted@freemode@postertag@graffiti_spray@heeled@',
        'shake_can_female',
        'Spray 2',
        AnimationOptions = {
            Prop = 'prop_cs_spray_can',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['tag3'] = {
        'anim@scripted@freemode@postertag@graffiti_spray@male@',
        'spray_can_var_01_male',
        'Spray 3',
        AnimationOptions = {
            Prop = 'prop_cs_spray_can',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['tag4'] = {
        'anim@scripted@freemode@postertag@graffiti_spray@male@',
        'spray_can_var_02_male',
        'Spray 4',
        AnimationOptions = {
            Prop = 'prop_cs_spray_can',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['tag5'] = {
        'anim@scripted@freemode@postertag@graffiti_spray@heeled@',
        'spray_can_var_01_female',
        'Spray 5',
        AnimationOptions = {
            Prop = 'prop_cs_spray_can',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['tag6'] = {
        'anim@scripted@freemode@postertag@graffiti_spray@heeled@',
        'spray_can_var_02_female',
        'Spray 6',
        AnimationOptions = {
            Prop = 'prop_cs_spray_can',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['beans'] = {
        'anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1',
        'base_idle',
        'Fagioli',
        AnimationOptions = {
            Prop = 'h4_prop_h4_caviar_tin_01a',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0},
            SecondProp = 'h4_prop_h4_caviar_spoon_01a',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['newscam'] = {
        'missfinale_c2mcs_1',
        'fin_c2_mcs_1_camman',
        'News Camera',
        AnimationOptions = {
            Prop = 'prop_v_cam_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['newsmic'] = {
        'anim@heists@humane_labs@finale@keycards',
        'ped_a_enter_loop',
        'Microfono News',
        AnimationOptions = {
            Prop = 'p_ing_microphonel_01',
            PropBone = 4154,
            PropPlacement = {-0.00, -0.0200, 0.1100, 0.00, 0.0, 60.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['newsbmic'] = {
        'missfra1',
        'mcs2_crew_idle_m_boom',
        'Microfono Boom',
        AnimationOptions = {
            Prop = 'prop_v_bmike_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['leafblower'] = {
        'amb@world_human_gardener_leaf_blower@base',
        'base',
        'Leaf Blower',
        AnimationOptions = {
            Prop = 'prop_leaf_blower_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['bbqf'] = {
        'amb@prop_human_bbq@male@idle_a',
        'idle_b',
        'BBQ (Female)',
        AnimationOptions = {
            Prop = 'prop_fish_slice_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pump'] = {
        'missfbi4prepp1',
        'idle',
        'Zucca',
        AnimationOptions = {
            Prop = 'prop_veg_crop_03_pump',
            PropBone = 28422,
            PropPlacement = {0.0200, 0.0600, -0.1200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['pump2'] = {
        'anim@heists@box_carry@',
        'idle',
        'Zucca 2',
        AnimationOptions = {
            Prop = 'prop_veg_crop_03_pump',
            PropBone = 28422,
            PropPlacement = {0.0100, -0.16000, -0.2100, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mop'] = {
        'missfbi4prepp1',
        'idle',
        'Mocio',
        AnimationOptions = {
            Prop = 'prop_cs_mop_s',
            PropBone = 28422,
            PropPlacement = {-0.0200, -0.0600, -0.2000, -13.377, 10.3568, 17.9681},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['mop2'] = {
        'move_mop',
        'idle_scrub_small_player',
        'Mop 2',
        AnimationOptions = {
            Prop = 'prop_cs_mop_s',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.1200, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['jerkf'] = {
        'switch@trevor@jerking_off',
        'trev_jerking_off_loop',
        'Jerk Off Donna',
        AnimationOptions = {
            Prop = 'prop_cs_dildo_01',
            PropBone = 28422,
            PropPlacement = {0.09, 0.05, -0.03, 90.0, 80.0, 30.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['rake'] = {
        'anim@amb@drug_field_workers@rake@male_a@base',
        'base',
        'Rastrello',
        AnimationOptions = {
            Prop = 'prop_tool_rake',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ['rake2'] = {
        'anim@amb@drug_field_workers@rake@male_a@idles',
        'idle_b',
        'Rastrello 2',
        AnimationOptions = {
            Prop = 'prop_tool_rake',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ['rake3'] = {
        'anim@amb@drug_field_workers@rake@male_b@base',
        'base',
        'Rastrello 3',
        AnimationOptions = {
            Prop = 'prop_tool_rake',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ['rake4'] = {
        'anim@amb@drug_field_workers@rake@male_b@idles',
        'idle_d',
        'Rastrello 4',
        AnimationOptions = {
            Prop = 'prop_tool_rake',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ['broom'] = {
        'anim@amb@drug_field_workers@rake@male_a@base',
        'base',
        'Pulisci',
        AnimationOptions = {
            Prop = 'prop_tool_broom',
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ['broom2'] = {
        'anim@amb@drug_field_workers@rake@male_a@idles',
        'idle_b',
        'Pulisci 2',
        AnimationOptions = {
            Prop = 'prop_tool_broom',
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ['broom3'] = {
        'anim@amb@drug_field_workers@rake@male_b@base',
        'base',
        'Pulisci 3',
        AnimationOptions = {
            Prop = 'prop_tool_broom',
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    ['broom4'] = {
        'anim@amb@drug_field_workers@rake@male_b@idles',
        'idle_d',
        'Pulisci 4',
        AnimationOptions = {
            Prop = 'prop_tool_broom',
            PropBone = 28422,
            PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
            EmoteLoop = true
        }
    },
    --
    ['detonatore'] = {
        'missheistdockssetup1clipboard@base',
        'base',
        'Notepad',
        AnimationOptions = {
            Prop = 'prop_bomb_01_s',
            PropBone = 18905,
            PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['cinturac4'] = {
        'missheistdockssetup1clipboard@base',
        'base',
        'Cintura C4',
        AnimationOptions = {
            Prop = 'h4_prop_h4_ld_bomb_01a',
            PropBone = 24818,
            PropPlacement = {0.1, 0.15, 0.05, 180.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ['veleno'] = {
        'missheistdockssetup1clipboard@base',
        'base',
        'Notepad',
        AnimationOptions = {
            Prop = 'prop_cs_vial_01',
            PropBone = 18905,
            PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jclean3"] = {
        "switch@franklin@cleaning_car",
        "001946_01_gc_fras_v2_ig_5_base",
        "Clean 3",
        AnimationOptions = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jmicro"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Hold a microphone",
        AnimationOptions = {
            Prop = "p_ing_microphonel_01",
            PropBone = 18905,
            PropPlacement = {0.11, 0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jmicro2"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Hold a microphone 2",
        AnimationOptions = {
            Prop = "prop_microphone_02",
            PropBone = 18905,
            PropPlacement = {0.11, 0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jmicro3"] = {
        "missfra1",
        "mcs2_crew_idle_m_boom",
        "Hold a microphone 3",
        AnimationOptions = {
            Prop = "prop_v_bmike_01",
            PropBone = 28422,
            PropPlacement = {-0.08, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jcamerabig"] = {
        "missfinale_c2mcs_1",
        "fin_c2_mcs_1_camman",
        "Hold A Camera",
        AnimationOptions = {
            Prop = "prop_v_cam_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["jdgrave1"] = {
        "anim@amb@drug_field_workers@rake@male_a@base",
        "base",
        "Digging Grave",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
            Prop = 'prop_tool_shovel006',
            PropBone = 28422,
            PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0}
        }
    }
}