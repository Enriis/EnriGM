let animacion = false;
var deg = 0;
var bottom = 0;
var right = 0;
var swipe = document.getElementById("swipe");
var select = document.getElementById("select");
select.volume = 0.1;
var over_button = document.getElementById("over_button");
over_button.volume=0.2;
(function() {


    let MenuTpl =
        '<div id="menu_{{_namespace}}_{{_name}}" class="menu{{#align}} align-{{align}}{{/align}}">' +
        '<div class="shake"><div class="arrow-left"></div><div class="head"><div class="headtitle">{{{title}}}</div><img src="https://i.imgur.com/lISzLwO.png" class="spinner"></div>' +
        '<div class="items-container"><div class="menu-items">' +
        '{{#elements}}' +
        '<div class="menu-item {{#selected}}selected{{/selected}}">' +
        '<span class="marker">»</span> {{{label}}}{{#isSlider}} : &lt;{{{sliderLabel}}}&gt;{{/isSlider}}' +
        '</div>' +
        '{{/elements}}' +
        '</div><div class="bg-items"></div></div></div>' +
        '</div>' +
        '</div>' +
        '';


    window.ESX_MENU = {};
    ESX_MENU.ResourceName = 'esx_menu_default';
    ESX_MENU.opened = {};
    ESX_MENU.focus = [];
    ESX_MENU.pos = {};

    ESX_MENU.open = function(namespace, name, data) {

        if (typeof ESX_MENU.opened[namespace] == 'undefined') {
            ESX_MENU.opened[namespace] = {};
        }

        if (typeof ESX_MENU.opened[namespace][name] != 'undefined') {
            ESX_MENU.close(namespace, name);
        }

        if (typeof ESX_MENU.pos[namespace] == 'undefined') {
            ESX_MENU.pos[namespace] = {};
        }

        for (let i = 0; i < data.elements.length; i++) {
            if (typeof data.elements[i].type == 'undefined') {
                data.elements[i].type = 'default';
            }
        }

        data._index = ESX_MENU.focus.length;
        data._namespace = namespace;
        data._name = name;

        for (let i = 0; i < data.elements.length; i++) {
            data.elements[i]._namespace = namespace;
            data.elements[i]._name = name;
        }

        ESX_MENU.opened[namespace][name] = data;
        ESX_MENU.pos[namespace][name] = 0;

        for (let i = 0; i < data.elements.length; i++) {
            if (data.elements[i].selected) {
                ESX_MENU.pos[namespace][name] = i;
            } else {
                data.elements[i].selected = false;
            }
        }

        ESX_MENU.focus.push({
            namespace: namespace,
            name: name
        });
        animacion = true;
        ESX_MENU.render();
        /*if($('.menu-item.selected').length > 1 ){
        	$('#menu_' + namespace + '_' + name).find('.menu-item.selected')[0].scrollIntoView();

        }*/
    };

    ESX_MENU.close = function(namespace, name) {


        for (let i = 0; i < ESX_MENU.focus.length; i++) {
            if (ESX_MENU.focus[i].namespace == namespace && ESX_MENU.focus[i].name == name) {
                ESX_MENU.focus.splice(i, 1);
                break;
            }
        }

        ESX_MENU.render();

    };

    ESX_MENU.closeAll = function(namespace, name) {

        $("#menus").html("");





    };

    ESX_MENU.render = function() {

        let menuContainer = document.getElementById('menus');
        let focused = ESX_MENU.getFocused();
        menuContainer.innerHTML = '';

        $(menuContainer).hide();

        for (let namespace in ESX_MENU.opened) {
            for (let name in ESX_MENU.opened[namespace]) {

                let menuData = ESX_MENU.opened[namespace][name];
                let view = JSON.parse(JSON.stringify(menuData));

                for (let i = 0; i < menuData.elements.length; i++) {
                    let element = view.elements[i];

                    switch (element.type) {
                        case 'default':
                            break;

                        case 'slider':
                            {
                                element.isSlider = true;
                                element.sliderLabel = (typeof element.options == 'undefined') ? element.value : element.options[element.value];

                                break;
                            }

                        default:
                            break;
                    }

                    if (i == ESX_MENU.pos[namespace][name]) {
                        element.selected = true;
                    }
                }

                let menu = $(Mustache.render(MenuTpl, view))[0];
                $(menu).hide();
                menuContainer.appendChild(menu);
            }
        }
        var animTemp = localStorage.getItem('anim');
        if (animacion) {
            if (animTemp != 'false') {

                $(".menu").addClass('abrirMenu');
                setTimeout(function() {
                    $(".menu").removeClass('abrirMenu');

                }, 250);

                //$(".head").addClass('anim-entrada');


            } else {
                $(".menu").removeClass('abrirMenu');
            }

        } else {
            $(".menu").removeClass('abrirMenu');

            //$(".head").removeClass('anim-entrada');


        }



        if (typeof focused != 'undefined') {
            $('#menu_' + focused.namespace + '_' + focused.name).show();


        }

        //$(".shake").css('transform','perspective(400px) rotateY('+localStorage.getItem("deg")+'deg)');;

        $(menuContainer).show();



        var width = parseInt($("body").width())-1;
        var prevX=-1;
        
        // $("body").mousemove(function(e) {
               
        //     });
        	
        	$("body").off('mousemove').on('mousemove', function (e) {
                 parallaxIt(e, ".shake2", -40);
        			// if(prevX< e.pageX || e.pageX == width ){

        			// 	if((deg+0.5)<=10){
        			// 		deg = deg+0.5;
        					
        			// 	}

        			// } else if(prevX > e.pageX ||e.pageX == 0){

        			// 	if((deg-0.5)>=-10){
        			// 		deg = deg-0.5;
        					
        			// 	}
        				
        			// }
            
        			// prevX = parseInt(e.pageX);
        			// $(".shake").css('transform','perspective(400px) rotateY('+deg+'deg)');
        	});



        if (focused) {
            if ($('.selected').length >= 1) {
                $('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
                $('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();




            }

        }


    };

    ESX_MENU.submit = function(namespace, name, data) {
        $.post('https://' + ESX_MENU.ResourceName + '/menu_submit', JSON.stringify({
            _namespace: namespace,
            _name: name,
            current: data,
            elements: ESX_MENU.opened[namespace][name].elements
        }));
    };

    ESX_MENU.cancel = function(namespace, name) {
        $.post('https://' + ESX_MENU.ResourceName + '/menu_cancel', JSON.stringify({
            _namespace: namespace,
            _name: name
        }));
    };

    ESX_MENU.change = function(namespace, name, data) {

        $.post('https://' + ESX_MENU.ResourceName + '/menu_change', JSON.stringify({
            _namespace: namespace,
            _name: name,
            current: data,
            elements: ESX_MENU.opened[namespace][name].elements
        }));

    };

    ESX_MENU.getFocused = function() {
        return ESX_MENU.focus[ESX_MENU.focus.length - 1];
    };

    window.onData = (data) => {

        switch (data.action) {

            case 'openMenu':
                {
                    animacion = true;
                    ESX_MENU.open(data.namespace, data.name, data.data);
                    break;
                }

            case 'closeMenu':
                {
                    animacion = false;
                    bottom = 0;
                    right = 0;
                    ESX_MENU.close(data.namespace, data.name);
                    break;
                }
            case 'closeAll':
                {

                    ESX_MENU.closeAll();
                    break;
                }

            case 'controlPressed':
                {
                    // localStorage.setItem('right', right);
                    // localStorage.setItem('bottom', bottom);
                    // localStorage.setItem('deg', deg);

                    animacion = false;
                    switch (data.control) {

                        case 'ENTER':
                            {



                                let focused = ESX_MENU.getFocused();

                                if (typeof focused != 'undefined') {
                                    let menu = ESX_MENU.opened[focused.namespace][focused.name];
                                    let pos = ESX_MENU.pos[focused.namespace][focused.name];
                                    let elem = menu.elements[pos];

                                    if (menu.elements.length > 0) {

                                        ESX_MENU.submit(focused.namespace, focused.name, elem);
                                        localStorage.setItem('anim', '');
                                        select.play();
                                    }
                                }

                                break;
                            }

                        case 'BACKSPACE': {
                            let focused = ESX_MENU.getFocused();
    
                            if (typeof focused != 'undefined') {
                                ESX_MENU.cancel(focused.namespace, focused.name);
                            }
    
                            break;
                        }

                        case 'TOP':
                            {




                                let focused = ESX_MENU.getFocused();

                                if (typeof focused != 'undefined') {

                                    let menu = ESX_MENU.opened[focused.namespace][focused.name];
                                    let pos = ESX_MENU.pos[focused.namespace][focused.name];

                                    if (pos > 0) {
                                        ESX_MENU.pos[focused.namespace][focused.name]--;
                                    } else {
                                        ESX_MENU.pos[focused.namespace][focused.name] = menu.elements.length - 1;
                                    }

                                    let elem = menu.elements[ESX_MENU.pos[focused.namespace][focused.name]];

                                    for (let i = 0; i < menu.elements.length; i++) {
                                        if (i == ESX_MENU.pos[focused.namespace][focused.name]) {
                                            menu.elements[i].selected = true;
                                        } else {
                                            menu.elements[i].selected = false;
                                        }
                                    }

                                    /*var index = $('.menu-item').index($('.selected'));
                                    var total = $(".menu-item").length-1;
                                    if(index-1>=0){
                                    	$('.menu-item:eq('+index+')').removeClass("selected");
                                    	$('.menu-item:eq('+(index-1)+')').addClass("selected");
                                    } else {
                                    	$('.menu-item:eq('+index+')').removeClass("selected");
                                    	$('.menu-item:eq('+total+')').addClass("selected");
                                    }*/
                                    ESX_MENU.change(focused.namespace, focused.name, elem);

                                    ESX_MENU.render();
                                    over_button.currentTime=0;


                                    //$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
                                }

                                break;

                            }

                        case 'DOWN':
                            {



                                let focused = ESX_MENU.getFocused();

                                if (typeof focused != 'undefined') {
                                    let menu = ESX_MENU.opened[focused.namespace][focused.name];
                                    let pos = ESX_MENU.pos[focused.namespace][focused.name];
                                    let length = menu.elements.length;

                                    if (pos < length - 1) {
                                        ESX_MENU.pos[focused.namespace][focused.name]++;
                                    } else {
                                        ESX_MENU.pos[focused.namespace][focused.name] = 0;
                                    }

                                    let elem = menu.elements[ESX_MENU.pos[focused.namespace][focused.name]];

                                    for (let i = 0; i < menu.elements.length; i++) {
                                        if (i == ESX_MENU.pos[focused.namespace][focused.name]) {
                                            menu.elements[i].selected = true;
                                        } else {
                                            menu.elements[i].selected = false;
                                        }
                                    }
                                    /*console.log($('.menu-item').index($('.selected')));
                                    var index = $('.menu-item').index($('.selected'));
                                    console.log($('.menu-item:eq('+index+')').html());
                                    if(index+1<$(".menu-item").length){
                                    	$('.menu-item:eq('+index+')').removeClass("selected");
                                    	$('.menu-item:eq('+(index+1)+')').addClass("selected");
                                    } else {
                                    	$('.menu-item:eq('+index+')').removeClass("selected");
                                    	$('.menu-item:eq(0)').addClass("selected");
                                    }
                                    */


                                    ESX_MENU.change(focused.namespace, focused.name, elem);

                                    ESX_MENU.render();
                                    over_button.currentTime=0;

                                    //$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
                                }

                                break;
                            }

                        case 'LEFT':
                            {



                                let focused = ESX_MENU.getFocused();

                                if (typeof focused != 'undefined') {
                                    let menu = ESX_MENU.opened[focused.namespace][focused.name];
                                    let pos = ESX_MENU.pos[focused.namespace][focused.name];
                                    let elem = menu.elements[pos];

                                    switch (elem.type) {
                                        case 'default':
                                            break;

                                        case 'slider':
                                            {
                                                let min = (typeof elem.min == 'undefined') ? 0 : elem.min;

                                                if (elem.value > min) {
                                                    elem.value--;

                                                    localStorage.setItem('anim', 'false');






                                                    ESX_MENU.change(focused.namespace, focused.name, elem);
                                                }

                                                ESX_MENU.render();
                                                 over_button.currentTime=0;
                                                
                                                break;
                                            }

                                        default:
                                            break;
                                    }

                                    //$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
                                }

                                break;
                            }

                        case 'RIGHT':
                            {


                                let focused = ESX_MENU.getFocused();

                                if (typeof focused != 'undefined') {
                                    let menu = ESX_MENU.opened[focused.namespace][focused.name];
                                    let pos = ESX_MENU.pos[focused.namespace][focused.name];
                                    let elem = menu.elements[pos];

                                    switch (elem.type) {
                                        case 'default':
                                            break;

                                        case 'slider':
                                            {
                                                if (typeof elem.options != 'undefined' && elem.value < elem.options.length - 1) {
                                                    elem.value++;
                                                    ESX_MENU.change(focused.namespace, focused.name, elem);
                                                }

                                                if (typeof elem.max != 'undefined' && elem.value < elem.max) {
                                                    elem.value++;
                                                    ESX_MENU.change(focused.namespace, focused.name, elem);
                                                }
                                                localStorage.setItem('anim', 'false');

                                                ESX_MENU.render();
                                                over_button.currentTime=0;

                                                break;
                                            }

                                        default:
                                            break;
                                    }

                                    //$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
                                }

                                break;
                            }

                        default:
                            break;

                    }

                    break;
                }

        }

    };

    window.onload = function(e) {
        window.addEventListener('message', (event) => {
            onData(event.data);
        });
    };

    function parallaxIt(e, target, movement) {
        var $this = $("body");
        var relX = e.pageX - $this.offset().left;
        var relY = e.pageY - $this.offset().top;
    
        TweenMax.to(target, 1, {
            x: (relX - $this.width() / 2) / $this.width() * movement,
            y: (relY - $this.height() / 2) / $this.height() * movement
        });

       


    }

})();