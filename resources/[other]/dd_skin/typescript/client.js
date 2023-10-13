(() => {
    "use strict";
    var e = {
            390: (e, a) => {
                Object.defineProperty(a, "__esModule", {
                    value: !0
                }), a.DEFAULT_CUSTOMIZATION_CONFIG = a.HAIR_DECORATIONS = a.EYE_COLORS = a.HEAD_OVERLAYS = a.FACE_FEATURES = a.PED_PROPS_IDS = a.PED_COMPONENTS_IDS = void 0, a.PED_COMPONENTS_IDS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], a.PED_PROPS_IDS = [0, 1, 2, 6, 7], a.FACE_FEATURES = ["noseWidth", "nosePeakHigh", "nosePeakSize", "noseBoneHigh", "nosePeakLowering", "noseBoneTwist", "eyeBrownHigh", "eyeBrownForward", "cheeksBoneHigh", "cheeksBoneWidth", "cheeksWidth", "eyesOpening", "lipsThickness", "jawBoneWidth", "jawBoneBackSize", "chinBoneLowering", "chinBoneLenght", "chinBoneSize", "chinHole", "neckThickness"], a.HEAD_OVERLAYS = ["blemishes", "beard", "eyebrows", "ageing", "makeUp", "blush", "complexion", "sunDamage", "lipstick", "moleAndFreckles", "chestHair", "bodyBlemishes"], a.EYE_COLORS = ["Green", "Emerald", "Light Blue", "Ocean Blue", "Light Brown", "Dark Brown", "Hazel", "Dark Gray", "Light Gray", "Pink", "Yellow", "Purple", "Blackout", "Shades of Gray", "Tequila Sunrise", "Atomic", "Warp", "ECola", "Space Ranger", "Ying Yang", "Bullseye", "Lizard", "Dragon", "Extra Terrestrial", "Goat", "Smiley", "Possessed", "Demon", "Infected", "Alien", "Undead", "Zombie"], a.HAIR_DECORATIONS = {
                    male: [{
                        id: 0,
                        collection: "mpbeach_overlays",
                        overlay: "FM_Hair_Fuzz"
                    }, {
                        id: 1,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_001"
                    }, {
                        id: 2,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_002"
                    }, {
                        id: 3,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_003"
                    }, {
                        id: 4,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_004"
                    }, {
                        id: 5,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_005"
                    }, {
                        id: 6,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_006"
                    }, {
                        id: 7,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_007"
                    }, {
                        id: 8,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_008"
                    }, {
                        id: 9,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_009"
                    }, {
                        id: 10,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_013"
                    }, {
                        id: 11,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_002"
                    }, {
                        id: 12,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_011"
                    }, {
                        id: 13,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_012"
                    }, {
                        id: 14,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_014"
                    }, {
                        id: 15,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_015"
                    }, {
                        id: 16,
                        collection: "multiplayer_overlays",
                        overlay: "NGBea_M_Hair_000"
                    }, {
                        id: 17,
                        collection: "multiplayer_overlays",
                        overlay: "NGBea_M_Hair_001"
                    }, {
                        id: 18,
                        collection: "multiplayer_overlays",
                        overlay: "NGBus_M_Hair_000"
                    }, {
                        id: 19,
                        collection: "multiplayer_overlays",
                        overlay: "NGBus_M_Hair_001"
                    }, {
                        id: 20,
                        collection: "multiplayer_overlays",
                        overlay: "NGHip_M_Hair_000"
                    }, {
                        id: 21,
                        collection: "multiplayer_overlays",
                        overlay: "NGHip_M_Hair_001"
                    }, {
                        id: 22,
                        collection: "multiplayer_overlays",
                        overlay: "NGInd_M_Hair_000"
                    }, {
                        id: 24,
                        collection: "mplowrider_overlays",
                        overlay: "LR_M_Hair_000"
                    }, {
                        id: 25,
                        collection: "mplowrider_overlays",
                        overlay: "LR_M_Hair_001"
                    }, {
                        id: 26,
                        collection: "mplowrider_overlays",
                        overlay: "LR_M_Hair_002"
                    }, {
                        id: 27,
                        collection: "mplowrider_overlays",
                        overlay: "LR_M_Hair_003"
                    }, {
                        id: 28,
                        collection: "mplowrider2_overlays",
                        overlay: "LR_M_Hair_004"
                    }, {
                        id: 29,
                        collection: "mplowrider2_overlays",
                        overlay: "LR_M_Hair_005"
                    }, {
                        id: 30,
                        collection: "mplowrider2_overlays",
                        overlay: "LR_M_Hair_006"
                    }, {
                        id: 31,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_000_M"
                    }, {
                        id: 32,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_001_M"
                    }, {
                        id: 33,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_002_M"
                    }, {
                        id: 34,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_003_M"
                    }, {
                        id: 35,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_004_M"
                    }, {
                        id: 36,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_005_M"
                    }, {
                        id: 72,
                        collection: "mpgunrunning_overlays",
                        overlay: "MP_Gunrunning_Hair_M_000_M"
                    }, {
                        id: 73,
                        collection: "mpgunrunning_overlays",
                        overlay: "MP_Gunrunning_Hair_M_001_M"
                    }, {
                        id: 74,
                        collection: "mpVinewood_overlays",
                        overlay: "MP_Vinewood_Hair_M_000_M"
                    }],
                    female: [{
                        id: 0,
                        collection: "mpbeach_overlays",
                        overlay: "FM_Hair_Fuzz"
                    }, {
                        id: 1,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_001"
                    }, {
                        id: 2,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_002"
                    }, {
                        id: 3,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_003"
                    }, {
                        id: 4,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_004"
                    }, {
                        id: 5,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_005"
                    }, {
                        id: 6,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_006"
                    }, {
                        id: 7,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_007"
                    }, {
                        id: 8,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_008"
                    }, {
                        id: 9,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_009"
                    }, {
                        id: 10,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_010"
                    }, {
                        id: 11,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_011"
                    }, {
                        id: 12,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_012"
                    }, {
                        id: 13,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_013"
                    }, {
                        id: 14,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_014"
                    }, {
                        id: 15,
                        collection: "multiplayer_overlays",
                        overlay: "NG_M_Hair_015"
                    }, {
                        id: 16,
                        collection: "multiplayer_overlays",
                        overlay: "NGBea_F_Hair_000"
                    }, {
                        id: 17,
                        collection: "multiplayer_overlays",
                        overlay: "NGBea_F_Hair_001"
                    }, {
                        id: 18,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_007"
                    }, {
                        id: 19,
                        collection: "multiplayer_overlays",
                        overlay: "NGBus_F_Hair_000"
                    }, {
                        id: 20,
                        collection: "multiplayer_overlays",
                        overlay: "NGBus_F_Hair_001"
                    }, {
                        id: 21,
                        collection: "multiplayer_overlays",
                        overlay: "NGBea_F_Hair_001"
                    }, {
                        id: 22,
                        collection: "multiplayer_overlays",
                        overlay: "NGHip_F_Hair_000"
                    }, {
                        id: 23,
                        collection: "multiplayer_overlays",
                        overlay: "NGInd_F_Hair_000"
                    }, {
                        id: 25,
                        collection: "mplowrider_overlays",
                        overlay: "LR_F_Hair_000"
                    }, {
                        id: 26,
                        collection: "mplowrider_overlays",
                        overlay: "LR_F_Hair_001"
                    }, {
                        id: 27,
                        collection: "mplowrider_overlays",
                        overlay: "LR_F_Hair_002"
                    }, {
                        id: 28,
                        collection: "mplowrider2_overlays",
                        overlay: "LR_F_Hair_003"
                    }, {
                        id: 29,
                        collection: "mplowrider2_overlays",
                        overlay: "LR_F_Hair_003"
                    }, {
                        id: 30,
                        collection: "mplowrider2_overlays",
                        overlay: "LR_F_Hair_004"
                    }, {
                        id: 31,
                        collection: "mplowrider2_overlays",
                        overlay: "LR_F_Hair_006"
                    }, {
                        id: 32,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_000_F"
                    }, {
                        id: 33,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_001_F"
                    }, {
                        id: 34,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_002_F"
                    }, {
                        id: 35,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_003_F"
                    }, {
                        id: 36,
                        collection: "multiplayer_overlays",
                        overlay: "NG_F_Hair_003"
                    }, {
                        id: 37,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_006_F"
                    }, {
                        id: 38,
                        collection: "mpbiker_overlays",
                        overlay: "MP_Biker_Hair_004_F"
                    }, {
                        id: 76,
                        collection: "mpgunrunning_overlays",
                        overlay: "MP_Gunrunning_Hair_F_000_F"
                    }, {
                        id: 77,
                        collection: "mpgunrunning_overlays",
                        overlay: "MP_Gunrunning_Hair_F_001_F"
                    }, {
                        id: 78,
                        collection: "mpVinewood_overlays",
                        overlay: "MP_Vinewood_Hair_F_000_F"
                    }]
                }, a.DEFAULT_CUSTOMIZATION_CONFIG = {
                    ped: !0,
                    headBlend: !0,
                    faceFeatures: !0,
                    headOverlays: !0,
                    components: !0,
                    props: !0
                }
            },
            174: function (e, a, r) {
                var o = this && this.__awaiter || function (e, a, r, o) {
                    return new(r || (r = Promise))((function (t, i) {
                        function n(e) {
                            try {
                                c(o.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(o.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var a;
                            e.done ? t(e.value) : (a = e.value, a instanceof r ? a : new r((function (e) {
                                e(a)
                            }))).then(n, l)
                        }
                        c((o = o.apply(e, a || [])).next())
                    }))
                };
                Object.defineProperty(a, "__esModule", {
                    value: !0
                }), a.setPlayerAppearance = a.setPedProps = a.setPedProp = a.setPedComponents = a.setPedComponent = a.setPedEyeColor = a.setPedHair = a.setPedHeadOverlays = a.setPedFaceFeatures = a.setPedHeadBlend = a.setPlayerModel = a.getPedAppearance = a.pedModels = void 0;
                const t = r(916),
                    i = r(390),
                    n = r(229),
                    l = r.g.exports;
                a.pedModels = JSON.parse(LoadResourceFile(GetCurrentResourceName(), "peds.json"));
                const c = a.pedModels.reduce(((e, a) => Object.assign(Object.assign({}, e), {
                    [GetHashKey(a)]: a
                })), {});

                function _(e) {
                    return c[GetEntityModel(e)]
                }

                function s(e) {
                    const a = [];
                    return i.PED_COMPONENTS_IDS.forEach((r => {
                        a.push({
                            component_id: r,
                            drawable: GetPedDrawableVariation(e, r),
                            texture: GetPedTextureVariation(e, r)
                        })
                    })), a
                }

                function d(e) {
                    const a = [];
                    return i.PED_PROPS_IDS.forEach((r => {
                        a.push({
                            prop_id: r,
                            drawable: GetPedPropIndex(e, r),
                            texture: GetPedPropTextureIndex(e, r)
                        })
                    })), a
                }

                function y(e) {
                    const a = new ArrayBuffer(80);
                    r.g.Citizen.invokeNative("0x2746bd9d88c5c5d0", e, new Uint32Array(a));
                    const {
                        0: o,
                        2: t,
                        6: i,
                        8: n
                    } = new Uint32Array(a), {
                        0: l,
                        2: c
                    } = new Float32Array(a, 48);
                    return {
                        shapeFirst: o,
                        shapeSecond: t,
                        skinFirst: i,
                        skinSecond: n,
                        shapeMix: parseFloat(l.toFixed(1)),
                        skinMix: parseFloat(c.toFixed(1))
                    }
                }

                function p(e) {
                    return i.FACE_FEATURES.reduce(((a, r, o) => {
                        const t = parseFloat(GetPedFaceFeature(e, o).toFixed(1));
                        return Object.assign(Object.assign({}, a), {
                            [r]: t
                        })
                    }), {})
                }

                function u(e) {
                    return i.HEAD_OVERLAYS.reduce(((a, r, o) => {
                        const [, t, , i, , n] = GetPedHeadOverlayData(e, o), l = 255 !== t, c = l ? t : 0, _ = l ? parseFloat(n.toFixed(1)) : 0;
                        return Object.assign(Object.assign({}, a), {
                            [r]: {
                                style: c,
                                opacity: _,
                                color: i
                            }
                        })
                    }), {})
                }

                function m(e) {
                    return {
                        style: GetPedDrawableVariation(e, 2),
                        color: GetPedHairColor(e),
                        highlight: GetPedHairHighlightColor(e)
                    }
                }

                function v(e) {
                    const a = GetPedEyeColor(e);
                    return {
                        model: _(e) || "mp_m_freemode_01",
                        headBlend: y(e),
                        faceFeatures: p(e),
                        headOverlays: u(e),
                        components: s(e),
                        props: d(e),
                        hair: m(e),
                        eyeColor: a < i.EYE_COLORS.length ? a : 0
                    }
                }

                function P(e) {
                    return o(this, void 0, void 0, (function* () {
                        if (!e) return;
                        if (!IsModelInCdimage(e)) return;
                        for (RequestModel(e); !HasModelLoaded(e);) yield t.Delay(0);
                        SetPlayerModel(PlayerId(), e), SetModelAsNoLongerNeeded(e);
                        const a = PlayerPedId();
                        t.isPedFreemodeModel(a) && (SetPedDefaultComponentVariation(a), SetPedHeadBlendData(a, 0, 0, 0, 0, 0, 0, 0, 0, 0, !1))
                    }))
                }

                function f(e, a) {
                    if (!a) return;
                    const {
                        shapeFirst: r,
                        shapeSecond: o,
                        shapeMix: i,
                        skinFirst: n,
                        skinSecond: l,
                        skinMix: c
                    } = a;
                    t.isPedFreemodeModel(e) && SetPedHeadBlendData(e, r, o, 0, n, l, 0, i, c, 0, !1)
                }

                function g(e, a) {
                    a && i.FACE_FEATURES.forEach(((r, o) => {
                        const t = a[r];
                        SetPedFaceFeature(e, o, t)
                    }))
                }

                function h(e, a) {
                    a && i.HEAD_OVERLAYS.forEach(((r, o) => {
                        const t = a[r];
                        if (SetPedHeadOverlay(e, o, t.style, t.opacity), t.color || 0 === t.color) {
                            let a = 1;
                            ({
                                blush: !0,
                                lipstick: !0,
                                makeUp: !0
                            })[r] && (a = 2), SetPedHeadOverlayColor(e, o, a, t.color, t.color)
                        }
                    }))
                }

                function H(e, a) {
                    if (!a) return;
                    const {
                        style: r,
                        color: o,
                        highlight: t
                    } = a;
                    SetPedComponentVariation(e, 2, r, 0, 0), SetPedHairColor(e, o, t);
                    const n = function (e, a) {
                        const r = function (e) {
                            const a = GetEntityModel(e);
                            let r;
                            return a === GetHashKey("mp_m_freemode_01") ? r = "male" : a === GetHashKey("mp_f_freemode_01") && (r = "female"), r
                        }(e);
                        if (r) return i.HAIR_DECORATIONS[r].find((e => e.id === a))
                    }(e, r);
                    if (ClearPedDecorations(e), n) {
                        const {
                            collection: a,
                            overlay: r
                        } = n;
                        AddPedDecorationFromHashes(e, GetHashKey(a), GetHashKey(r))
                    }
                }

                function C(e, a) {
                    a && SetPedEyeColor(e, a)
                }

                function F(e, a) {
                    if (!a) return;
                    const {
                        component_id: r,
                        drawable: o,
                        texture: i
                    } = a;
                    ({
                        0: !0,
                        2: !0
                    })[r] && t.isPedFreemodeModel(e) || SetPedComponentVariation(e, r, o, i, 0)
                }

                function M(e, a) {
                    a && a.forEach((a => F(e, a)))
                }

                function S(e, a) {
                    if (!a) return;
                    const {
                        prop_id: r,
                        drawable: o,
                        texture: t
                    } = a; - 1 === o ? ClearPedProp(e, r) : SetPedPropIndex(e, r, o, t, !1)
                }

                function N(e, a) {
                    a && a.forEach((a => S(e, a)))
                }

                function G(e) {
                    return o(this, void 0, void 0, (function* () {
                        if (!e) return;
                        const {
                            model: a,
                            components: r,
                            props: o,
                            headBlend: t,
                            faceFeatures: i,
                            headOverlays: n,
                            hair: l,
                            eyeColor: c
                        } = e;
                        yield P(a);
                        const _ = PlayerPedId();
                        M(_, r), N(_, o), t && f(_, t), i && g(_, i), n && h(_, n), l && H(_, l), c && C(_, c)
                    }))
                }
                a.getPedAppearance = v, a.setPlayerModel = P, a.setPedHeadBlend = f, a.setPedFaceFeatures = g, a.setPedHeadOverlays = h, a.setPedHair = H, a.setPedEyeColor = C, a.setPedComponent = F, a.setPedComponents = M, a.setPedProp = S, a.setPedProps = N, a.setPlayerAppearance = G, n.default.loadModule(), l("getPedModel", _), l("getPedComponents", s), l("getPedProps", d), l("getPedHeadBlend", y), l("getPedFaceFeatures", p), l("getPedHeadOverlays", u), l("getPedHair", m), l("getPedAppearance", v), l("setPlayerModel", P), l("setPedHeadBlend", f), l("setPedFaceFeatures", g), l("setPedHeadOverlays", h), l("setPedHair", H), l("setPedEyeColor", C), l("setPedComponent", F), l("setPedComponents", M), l("setPedProp", S), l("setPedProps", N), l("setPlayerAppearance", G), l("setPedAppearance", (function (e, a) {
                    if (!a) return;
                    const {
                        components: r,
                        props: o,
                        headBlend: t,
                        faceFeatures: i,
                        headOverlays: n,
                        hair: l,
                        eyeColor: c
                    } = a;
                    M(e, r), N(e, o), t && f(e, t), i && g(e, i), n && h(e, n), l && H(e, l), c && C(e, c)
                }))
            },
            229: function (e, a, r) {
                var o = this && this.__awaiter || function (e, a, r, o) {
                    return new(r || (r = Promise))((function (t, i) {
                        function n(e) {
                            try {
                                c(o.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(o.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var a;
                            e.done ? t(e.value) : (a = e.value, a instanceof r ? a : new r((function (e) {
                                e(a)
                            }))).then(n, l)
                        }
                        c((o = o.apply(e, a || [])).next())
                    }))
                };
                Object.defineProperty(a, "__esModule", {
                    value: !0
                }), a.loadModule = a.exitPlayerCustomization = a.pedTurnAround = a.rotateCamera = a.setCamera = a.getConfig = a.getAppearanceSettings = a.getPropSettings = a.getComponentSettings = a.getAppearance = a.playerHeading = void 0;
                const t = r(390),
                    i = r(174),
                    n = r(916),
                    l = r(789),
                    c = r.g.exports,
                    _ = {
                        default: {
                            coords: {
                                x: 0,
                                y: 2.2,
                                z: .2
                            },
                            point: {
                                x: 0,
                                y: 0,
                                z: -.05
                            }
                        },
                        head: {
                            coords: {
                                x: 0,
                                y: .9,
                                z: .65
                            },
                            point: {
                                x: 0,
                                y: 0,
                                z: .6
                            }
                        },
                        body: {
                            coords: {
                                x: 0,
                                y: 1.2,
                                z: .2
                            },
                            point: {
                                x: 0,
                                y: 0,
                                z: .2
                            }
                        },
                        bottom: {
                            coords: {
                                x: 0,
                                y: .98,
                                z: -.7
                            },
                            point: {
                                x: 0,
                                y: 0,
                                z: -.9
                            }
                        }
                    },
                    s = {
                        default: {
                            x: 1.5,
                            y: -1
                        },
                        head: {
                            x: .7,
                            y: -.45
                        },
                        body: {
                            x: 1.2,
                            y: -.45
                        },
                        bottom: {
                            x: .7,
                            y: -.45
                        }
                    };
                let d, y, p, u, m, v, P, f;

                function g() {
                    return p || (p = i.getPedAppearance(PlayerPedId())), p
                }

                function h(e, a) {
                    const r = GetPedDrawableVariation(e, a);
                    return {
                        component_id: a,
                        drawable: {
                            min: 0,
                            max: GetNumberOfPedDrawableVariations(e, a) - 1
                        },
                        texture: {
                            min: 0,
                            max: GetNumberOfPedTextureVariations(e, a, r) - 1
                        }
                    }
                }

                function H(e, a) {
                    const r = GetPedPropIndex(e, a);
                    return {
                        prop_id: a,
                        drawable: {
                            min: -1,
                            max: GetNumberOfPedPropDrawableVariations(e, a) - 1
                        },
                        texture: {
                            min: -1,
                            max: GetNumberOfPedPropTextureVariations(e, a, r) - 1
                        }
                    }
                }

                function C(e) {
                    if (f) return;
                    "current" !== e && (v = e);
                    const {
                        coords: a,
                        point: r
                    } = _[v], o = P ? -1 : 1;
                    if (m) {
                        const e = n.arrayToVector3(GetOffsetFromEntityInWorldCoords(PlayerPedId(), a.x * o, a.y * o, a.z)),
                            t = n.arrayToVector3(GetOffsetFromEntityInWorldCoords(PlayerPedId(), r.x, r.y, r.z)),
                            i = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", e.x, e.y, e.z, 0, 0, 0, 50, !1, 0);
                        PointCamAtCoord(i, t.x, t.y, t.z), SetCamActiveWithInterp(i, m, 1e3, 1, 1), f = !0;
                        const l = setInterval((() => {
                            !IsCamInterpolating(m) && IsCamActive(i) && (DestroyCam(m, !1), m = i, f = !1, clearInterval(l))
                        }), 500)
                    } else {
                        const e = n.arrayToVector3(GetOffsetFromEntityInWorldCoords(PlayerPedId(), a.x, a.y, a.z)),
                            o = n.arrayToVector3(GetOffsetFromEntityInWorldCoords(PlayerPedId(), r.x, r.y, r.z));
                        m = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", e.x, e.y, e.z, 0, 0, 0, 50, !1, 0), PointCamAtCoord(m, o.x, o.y, o.z), SetCamActive(m, !0)
                    }
                }

                function F(e, r = t.DEFAULT_CUSTOMIZATION_CONFIG) {
                    const o = PlayerPedId();
                    p = i.getPedAppearance(o), d = e, y = r, u = n.arrayToVector3(GetEntityCoords(o, !0)), a.playerHeading = GetEntityHeading(o), P = !1, f = !1, C("default"), SetNuiFocus(!0, !0), SetNuiFocusKeepInput(!1), RenderScriptCams(!0, !1, 0, !0, !0), DisplayRadar(!1), SetEntityInvincible(o, !0), TaskStandStill(o, -1), SendNuiMessage(JSON.stringify({
                        type: "appearance_display",
                        payload: {}
                    }))
                }

                function M(e) {
                    e === GetCurrentResourceName() && (SetNuiFocus(!1, !1), SetNuiFocusKeepInput(!1))
                }

                function S() {
                    l.registerNuiCallbacks(), on("onResourceStop", M), c("startPlayerCustomization", F)
                }
                a.getAppearance = g, a.getComponentSettings = h, a.getPropSettings = H, a.getAppearanceSettings = function () {
                    const e = PlayerPedId(),
                        a = {
                            model: {
                                items: i.pedModels
                            }
                        },
                        r = t.PED_COMPONENTS_IDS.map((a => h(e, a))),
                        o = t.PED_PROPS_IDS.map((a => H(e, a))),
                        n = t.FACE_FEATURES.reduce(((e, a) => Object.assign(Object.assign({}, e), {
                            [a]: {
                                min: -1,
                                max: 1,
                                factor: .1
                            }
                        })), {}),
                        l = function () {
                            const e = {
                                hair: [],
                                makeUp: []
                            };
                            for (let a = 0; a < GetNumHairColors(); a++) e.hair.push(GetPedHairRgbColor(a));
                            for (let a = 0; a < GetNumMakeupColors(); a++) e.makeUp.push(GetMakeupRgbColor(a));
                            return e
                        }(),
                        c = {
                            beard: l.hair,
                            eyebrows: l.hair,
                            chestHair: l.hair,
                            makeUp: l.makeUp,
                            blush: l.makeUp,
                            lipstick: l.makeUp
                        };
                    return {
                        ped: a,
                        components: r,
                        props: o,
                        headBlend: {
                            shapeFirst: {
                                min: 0,
                                max: 45
                            },
                            shapeSecond: {
                                min: 0,
                                max: 45
                            },
                            skinFirst: {
                                min: 0,
                                max: 45
                            },
                            skinSecond: {
                                min: 0,
                                max: 45
                            },
                            shapeMix: {
                                min: 0,
                                max: 1,
                                factor: .1
                            },
                            skinMix: {
                                min: 0,
                                max: 1,
                                factor: .1
                            }
                        },
                        faceFeatures: n,
                        headOverlays: t.HEAD_OVERLAYS.reduce(((e, a, r) => {
                            const o = {
                                style: {
                                    min: 0,
                                    max: GetPedHeadOverlayNum(r) - 1
                                },
                                opacity: {
                                    min: 0,
                                    max: 1,
                                    factor: .1
                                }
                            };
                            return c[a] && Object.assign(o, {
                                color: {
                                    items: c[a]
                                }
                            }), Object.assign(Object.assign({}, e), {
                                [a]: o
                            })
                        }), {}),
                        hair: {
                            style: {
                                min: 0,
                                max: GetNumberOfPedDrawableVariations(e, 2) - 1
                            },
                            color: {
                                items: l.hair
                            },
                            highlight: {
                                items: l.hair
                            }
                        },
                        eyeColor: {
                            min: 0,
                            max: 30
                        }
                    }
                }, a.getConfig = function () {
                    return y
                }, a.setCamera = C, a.rotateCamera = function (e) {
                    return o(this, void 0, void 0, (function* () {
                        if (f) return;
                        const {
                            coords: a,
                            point: r
                        } = _[v], o = s[v];
                        let t;
                        const i = P ? -1 : 1;
                        "left" === e ? t = 1 : "right" === e && (t = -1);
                        const l = n.arrayToVector3(GetOffsetFromEntityInWorldCoords(PlayerPedId(), (a.x + o.x) * t * i, (a.y + o.y) * i, a.z)),
                            c = n.arrayToVector3(GetOffsetFromEntityInWorldCoords(PlayerPedId(), r.x, r.y, r.z)),
                            d = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", l.x, l.y, l.z, 0, 0, 0, 50, !1, 0);
                        PointCamAtCoord(d, c.x, c.y, c.z), SetCamActiveWithInterp(d, m, 1e3, 1, 1), f = !0;
                        const y = setInterval((() => {
                            !IsCamInterpolating(m) && IsCamActive(d) && (DestroyCam(m, !1), m = d, f = !1, clearInterval(y))
                        }), 500)
                    }))
                }, a.pedTurnAround = function (e) {
                    P = !P, OpenSequenceTask(0), TaskGoStraightToCoord(0, u.x, u.y, u.z, 8, -1, GetEntityHeading(e) - 180, .1), TaskStandStill(0, -1), CloseSequenceTask(0), ClearPedTasks(e), TaskPerformSequence(e, 0), ClearSequenceTask(0)
                }, a.exitPlayerCustomization = function (e) {
                    RenderScriptCams(!1, !1, 0, !0, !0), DestroyCam(m, !1), DisplayRadar(!0), SetNuiFocus(!1, !1);
                    const a = PlayerPedId();
                    ClearPedTasksImmediately(a), SetEntityInvincible(a, !1), SendNuiMessage(JSON.stringify({
                        type: "appearance_hide",
                        payload: {}
                    })), e || i.setPlayerAppearance(g()), d && d(e), d = null, y = null, p = null, u = null, m = null, v = null, P = null, f = null
                }, a.loadModule = S, a.default = {
                    loadModule: S
                }
            },
            789: function (e, a, r) {
                var o = this && this.__awaiter || function (e, a, r, o) {
                    return new(r || (r = Promise))((function (t, i) {
                        function n(e) {
                            try {
                                c(o.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(o.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var a;
                            e.done ? t(e.value) : (a = e.value, a instanceof r ? a : new r((function (e) {
                                e(a)
                            }))).then(n, l)
                        }
                        c((o = o.apply(e, a || [])).next())
                    }))
                };
                Object.defineProperty(a, "__esModule", {
                    value: !0
                }), a.registerNuiCallbacks = void 0;
                const t = r(229),
                    i = r(174);
                a.registerNuiCallbacks = function () {
                    RegisterNuiCallbackType("appearance_get_locales"), RegisterNuiCallbackType("appearance_get_settings_and_data"), RegisterNuiCallbackType("appearance_set_camera"), RegisterNuiCallbackType("appearance_turn_around"), RegisterNuiCallbackType("appearance_rotate_camera"), RegisterNuiCallbackType("appearance_change_model"), RegisterNuiCallbackType("appearance_change_head_blend"), RegisterNuiCallbackType("appearance_change_face_feature"), RegisterNuiCallbackType("appearance_change_hair"), RegisterNuiCallbackType("appearance_change_head_overlay"), RegisterNuiCallbackType("appearance_change_eye_color"), RegisterNuiCallbackType("appearance_change_component"), RegisterNuiCallbackType("appearance_change_prop"), RegisterNuiCallbackType("appearance_save"), RegisterNuiCallbackType("appearance_exit"), on("__cfx_nui:appearance_get_locales", ((e, a) => {
                        a(LoadResourceFile(GetCurrentResourceName(), `locales/${GetConvar("fivem-appearance:locale","en")}.json`))
                    })), on("__cfx_nui:appearance_get_settings_and_data", ((e, a) => {
                        a({
                            config: t.getConfig(),
                            appearanceData: t.getAppearance(),
                            appearanceSettings: t.getAppearanceSettings()
                        })
                    })), on("__cfx_nui:appearance_set_camera", ((e, a) => {
                        a({}), t.setCamera(e)
                    })), on("__cfx_nui:appearance_turn_around", ((e, a) => {
                        a({}), t.pedTurnAround(PlayerPedId())
                    })), on("__cfx_nui:appearance_rotate_camera", ((e, a) => {
                        a({}), t.rotateCamera(e)
                    })), on("__cfx_nui:appearance_change_model", ((e, a) => o(this, void 0, void 0, (function* () {
                        yield i.setPlayerModel(e);
                        const r = PlayerPedId();
                        SetEntityHeading(PlayerPedId(), t.playerHeading), SetEntityInvincible(r, !0), TaskStandStill(r, -1);
                        const o = i.getPedAppearance(r),
                            n = t.getAppearanceSettings();
                        a({
                            appearanceSettings: n,
                            appearanceData: o
                        })
                    })))), on("__cfx_nui:appearance_change_component", ((e, a) => {
                        const r = PlayerPedId();
                        i.setPedComponent(r, e), a(t.getComponentSettings(r, e.component_id))
                    })), on("__cfx_nui:appearance_change_prop", ((e, a) => {
                        const r = PlayerPedId();
                        i.setPedProp(r, e), a(t.getPropSettings(r, e.prop_id))
                    })), on("__cfx_nui:appearance_change_head_blend", ((e, a) => {
                        a({}), i.setPedHeadBlend(PlayerPedId(), e)
                    })), on("__cfx_nui:appearance_change_face_feature", ((e, a) => {
                        a({}), i.setPedFaceFeatures(PlayerPedId(), e)
                    })), on("__cfx_nui:appearance_change_head_overlay", ((e, a) => {
                        a({}), i.setPedHeadOverlays(PlayerPedId(), e)
                    })), on("__cfx_nui:appearance_change_hair", ((e, a) => {
                        a({}), i.setPedHair(PlayerPedId(), e)
                    })), on("__cfx_nui:appearance_change_eye_color", ((e, a) => {
                        a({}), i.setPedEyeColor(PlayerPedId(), e)
                    })), on("__cfx_nui:appearance_save", ((e, a) => {
                        a({}), t.exitPlayerCustomization(e)
                    })), on("__cfx_nui:appearance_exit", ((e, a) => {
                        a({}), t.exitPlayerCustomization()
                    }))
                }
            },
            916: (e, a) => {
                Object.defineProperty(a, "__esModule", {
                    value: !0
                }), a.arrayToVector3 = a.isPedFreemodeModel = a.Delay = void 0, a.Delay = e => new Promise((a => setTimeout(a, e))), a.isPedFreemodeModel = e => {
                    const a = GetEntityModel(e),
                        r = GetHashKey("mp_m_freemode_01"),
                        o = GetHashKey("mp_f_freemode_01");
                    return a === r || a === o
                }, a.arrayToVector3 = function (e) {
                    return {
                        x: e[0],
                        y: e[1],
                        z: e[2]
                    }
                }
            }
        },
        a = {};

    function r(o) {
        var t = a[o];
        if (void 0 !== t) return t.exports;
        var i = a[o] = {
            exports: {}
        };
        return e[o].call(i.exports, i, i.exports, r), i.exports
    }
    r.g = function () {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || new Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), r(174)
})();