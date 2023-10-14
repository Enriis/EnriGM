// None of that!

// Firefox struggles :(
// It's responsive but mobile isn't very user friendly coz it's done by hover :(

// Plenty of Easter Eggs scattered about - Have fun!

let Lingue = {
  ["home"]:"Spawn Selector",
  ["paleto"]:"Paleto",
  ["sandy"]:"Sandy",
  ["police"]:"Police",
  ["airport"]:"Airport",
  ["last"]:"Last Position"
};

Object.keys(Lingue).forEach(key => {
  document.getElementById(key).innerHTML = Lingue[key];
});

addEventListener("message", function(event){
	if (event.data.toggle == true) {
		document.getElementById("ok").style.display = "flex";
        $( "#personaggio_1_text" ).html(``);
        $( "#personaggio_2_text" ).html(``);
        $( "#personaggio_3_text" ).html(``);
        /*
            SET PLAYER
        */
        var info = event.data.info;
        var personaggi_disponibili = event.data.personaggi;
        if (personaggi_disponibili === 1) {
            $(".p2hover").hide()
            $(".p3hover").hide()
            $("wall2").hide()
            $("wall3").hide()
        } else if (personaggi_disponibili === 2) {
            $(".p3hover").hide()
            $("wall3").hide()
        } else if (personaggi_disponibili === 3) {
            $(".p2hover").show()
            $(".p3hover").show()
            $("wall2").show()
            $("wall3").show()
        }
		if (info["1"] != null && info["2"] != null && info["3"] != null) {

            document.getElementById("personaggio_1_img").src = info["1"].image;
            $( "#personaggio_1_text" ).html(`
                ▫️ ` + info["1"].nome + `<br />
                ▫️ ` + info["1"].nome2 + `<br />
                ▫️ ` + info["1"].lavoro + `<br />
                ▫️ <small>` + info["1"].datadinascita + `</small>
            `);            
            //2
            document.getElementById("personaggio_2_img").src = info["2"].image;
            $( "#personaggio_2_text" ).html(`
                ▫️ ` + info["2"].nome + `<br />
                ▫️ ` + info["2"].nome2 + `<br />
                ▫️ ` + info["2"].lavoro + `<br />
                ▫️ <small>` + info["2"].datadinascita + `</small>
            `);
            //3
            document.getElementById("personaggio_3_img").src = info["3"].image;
            $( "#personaggio_3_text" ).html(`
                ▫️ ` + info["3"].nome + `<br />
                ▫️ ` + info["3"].nome2 + `<br />
                ▫️ ` + info["3"].lavoro + `<br />
                ▫️ <small>` + info["3"].datadinascita + `</small>
            `);

        } else if  (info["1"] != null && info["2"] != null) {

			document.getElementById("personaggio_1_img").src = info["1"].image;
			$( "#personaggio_1_text" ).html(`
				▫️ ` + info["1"].nome + `<br />
                ▫️ ` + info["1"].nome2 + `<br />
				▫️ ` + info["1"].lavoro + `<br />
				▫️ <small>` + info["1"].datadinascita + `</small>
			`);			
			//2
			document.getElementById("personaggio_2_img").src = info["2"].image;
			$( "#personaggio_2_text" ).html(`
				▫️ ` + info["2"].nome + `<br />
                ▫️ ` + info["2"].nome2 + `<br />
				▫️ ` + info["2"].lavoro + `<br />
				▫️ <small>` + info["2"].datadinascita + `</small>
			`);    

			document.getElementById("personaggio_3_img").src = "https://cdn.discordapp.com/attachments/1001843597617938524/1059492049482678292/add-user-icon.png"

        } else if  (info["1"] != null && info["3"] != null) {

			document.getElementById("personaggio_1_img").src = info["1"].image;
			$( "#personaggio_1_text" ).html(`
				▫️ ` + info["1"].nome + `<br />
                ▫️ ` + info["1"].nome2 + `<br />
				▫️ ` + info["1"].lavoro + `<br />
				▫️ <small>` + info["1"].datadinascita + `</small>
			`);			
			//2
			document.getElementById("personaggio_3_img").src =  info["3"].image;
			$( "#personaggio_3_text" ).html(`
				▫️ ` + info["3"].nome + `<br />
                ▫️ ` + info["3"].nome2 + `<br />
				▫️ ` + info["3"].lavoro + `<br />
				▫️ <small>` + info["3"].datadinascita + `</small>
			`);    

			document.getElementById("personaggio_2_img").src = "https://cdn.discordapp.com/attachments/1001843597617938524/1059492049482678292/add-user-icon.png"

        } else if (info["1"] != null) {
            
			document.getElementById("personaggio_1_img").src = info["1"].image;
			$( "#personaggio_1_text" ).html(`
				▫️ ` + info["1"].nome + `<br />
                ▫️ ` + info["1"].nome2 + `<br />
				▫️ ` + info["1"].lavoro + `<br />
				▫️ <small>` + info["1"].datadinascita + `<br />
                
			`);

			document.getElementById("personaggio_2_img").src = "https://cdn.discordapp.com/attachments/1001843597617938524/1059492049482678292/add-user-icon.png";
			document.getElementById("personaggio_3_img").src = "https://cdn.discordapp.com/attachments/1001843597617938524/1059492049482678292/add-user-icon.png";
        } else if (info["1"] == null && info["2"] == null && info["3"] == null) {
     		console.log("sono qui");
            document.getElementById("personaggio_1_img").src = "https://cdn.discordapp.com/attachments/1001843597617938524/1059492049482678292/add-user-icon.png";
			document.getElementById("personaggio_2_img").src = "https://cdn.discordapp.com/attachments/1001843597617938524/1059492049482678292/add-user-icon.png";
			document.getElementById("personaggio_3_img").src = "https://cdn.discordapp.com/attachments/1001843597617938524/1059492049482678292/add-user-icon.png";
		}
    }else if (event.data.toggle_load === true) {
        document.getElementById("toggle_load").style.display = "block";
    }else if (event.data.toggle_load === false) {
        document.getElementById("toggle_load").style.display = "none";
    }else if (event.data.type === "openSpawnSelector") {
        openSpawnSelector();
    }else{
    	document.getElementById("ok").style.display = "none";
    }
});



function openSpawnSelector() {
    document.body.style.backgroundImage = "url('https://cdn.discordapp.com/attachments/1052910824865402892/1115627315737673798/Mappa.jpg')";
    document.querySelector(".map").style.display = "block";
    document.querySelector(".title").style.display = "block";
    document.querySelector(".boxkaros").style.display = "block";
    document.querySelector(".boxkaros2").style.display = "block";
    document.querySelector(".boxkaros3").style.display = "block";
    document.querySelector(".boxkaros4").style.display = "block";
    document.querySelector(".boxkaros5").style.display = "block";
    
  
}  
  
  
  function selectSandy() {
      $.post(`https://esx_multicharacter/sandy`)
      document.querySelector(".title").style.display = "none";
      document.querySelector(".boxkaros").style.display = "none";
      document.querySelector(".boxkaros2").style.display = "none";
      document.querySelector(".boxkaros3").style.display = "none";
      document.querySelector(".boxkaros4").style.display = "none";
      document.querySelector(".boxkaros5").style.display = "none";
      document.querySelector(".map").style.display = "none";
      document.body.style.backgroundImage = "none";
  }
  function selectPolice() {
      $.post('https://esx_multicharacter/police')
      document.querySelector(".title").style.display = "none";
      document.querySelector(".boxkaros").style.display = "none";
      document.querySelector(".boxkaros2").style.display = "none";
      document.querySelector(".boxkaros3").style.display = "none";
      document.querySelector(".boxkaros4").style.display = "none";
      document.querySelector(".boxkaros5").style.display = "none";
      document.querySelector(".map").style.display = "none";
      document.body.style.backgroundImage = "none";
  }
  function selectAirport() {
      $.post(`https://esx_multicharacter/airport`)
      document.querySelector(".title").style.display = "none";
      document.querySelector(".boxkaros").style.display = "none";
      document.querySelector(".boxkaros2").style.display = "none";
      document.querySelector(".boxkaros3").style.display = "none";
      document.querySelector(".boxkaros4").style.display = "none";
      document.querySelector(".boxkaros5").style.display = "none";
      document.querySelector(".map").style.display = "none";
      document.body.style.backgroundImage = "none";
  }
  
  function selectPaleto() {
    $.post(`https://esx_multicharacter/paleto`)
      document.querySelector(".title").style.display = "none";
      document.querySelector(".boxkaros").style.display = "none";
      document.querySelector(".boxkaros2").style.display = "none";
      document.querySelector(".boxkaros3").style.display = "none";
      document.querySelector(".boxkaros4").style.display = "none";
      document.querySelector(".boxkaros5").style.display = "none";
      document.querySelector(".map").style.display = "none";
      document.body.style.backgroundImage = "none";
  }
  function selectSpawn() {
    $.post(`https://esx_multicharacter/spawn`)
      document.querySelector(".title").style.display = "none";
      document.querySelector(".boxkaros").style.display = "none";
      document.querySelector(".boxkaros2").style.display = "none";
      document.querySelector(".boxkaros3").style.display = "none";
      document.querySelector(".boxkaros4").style.display = "none";
      document.querySelector(".boxkaros5").style.display = "none";
      document.querySelector(".map").style.display = "none";
      document.body.style.backgroundImage = "none";
  }
  

$( "#exit_porta" ).click(function() {
    $.post('https://esx_multicharacter/disconnettiPlayer', JSON.stringify({}))
});

$( "#button_si_1").click(function() {
    $.post('https://esx_multicharacter/SelezionaPlayer', JSON.stringify({num : "1"}))
    $("#button_back_1").click()
});
$( "#button_si_2").click(function() {
    $.post('https://esx_multicharacter/SelezionaPlayer', JSON.stringify({num : "2"}))
    $("#button_back_2").click()
});
$( "#button_si_3").click(function() {
    $.post('https://esx_multicharacter/SelezionaPlayer', JSON.stringify({num : "3"}))
    $("#button_back_3").click()
});
$( "#button_no_1").click(function() {
    $.post('https://esx_multicharacter/EliminaPlayer', JSON.stringify({num : "1"}))
    $("#button_back_1").click()
});
$( "#button_no_2").click(function() {
    $.post('https://esx_multicharacter/EliminaPlayer', JSON.stringify({num : "2"}))
    $("#button_back_2").click()
});
$( "#button_no_3").click(function() {
    $.post('https://esx_multicharacter/EliminaPlayer', JSON.stringify({num : "3"}))
    $("#button_back_3").click() 
});

$("#infotasto").click(function() {
    $("#info2").fadeIn("fast");
});

$("#info3").click(function(){
    $("#info2").fadeOut("fast");
});



$( "#button_back_1").click(function() {
    document.getElementById('button_si_1').style.opacity = "0";
    document.getElementById('button_no_1').style.opacity = "0";
    document.getElementById('button_si_2').style.opacity = "0";
    document.getElementById('button_no_2').style.opacity = "0";
    document.getElementById('button_si_3').style.opacity = "0";
    document.getElementById('button_no_3').style.opacity = "0";
    document.getElementById('button_back_1').style.opacity = "0";
    document.getElementById('button_back_2').style.opacity = "0";
    document.getElementById('button_back_3').style.opacity = "0";
    setTimeout(function(){
        document.getElementById('button_si_1').style.display = "none";
        document.getElementById('button_no_1').style.display = "none";
        document.getElementById('button_si_2').style.display = "none";
        document.getElementById('button_no_2').style.display = "none";
        document.getElementById('button_si_3').style.display = "none";
        document.getElementById('button_no_3').style.display = "none";
        document.getElementById('button_back_1').style.display = "none";
        document.getElementById('button_back_2').style.display = "none";
        document.getElementById('button_back_3').style.display = "none";
    }, 500);
    $(".p1hover").removeClass('selected');
    $(".p1hover").removeClass('selectedtext');
    $(".p2hover").removeClass('selected');
    $(".p2hover").removeClass('selectedtext');
    $(".p3hover").removeClass('selected');
    $(".p3hover").removeClass('selectedtext');
    $("label").show()
});
$( "#button_back_2").click(function() {
    document.getElementById('button_si_1').style.opacity = "0";
    document.getElementById('button_no_1').style.opacity = "0";
    document.getElementById('button_si_2').style.opacity = "0";
    document.getElementById('button_no_2').style.opacity = "0";
    document.getElementById('button_si_3').style.opacity = "0";
    document.getElementById('button_no_3').style.opacity = "0";
    document.getElementById('button_back_1').style.opacity = "0";
    document.getElementById('button_back_2').style.opacity = "0";
    document.getElementById('button_back_3').style.opacity = "0";
    setTimeout(function(){
        document.getElementById('button_si_1').style.display = "none";
        document.getElementById('button_no_1').style.display = "none";
        document.getElementById('button_si_2').style.display = "none";
        document.getElementById('button_no_2').style.display = "none";
        document.getElementById('button_si_3').style.display = "none";
        document.getElementById('button_no_3').style.display = "none";
        document.getElementById('button_back_1').style.display = "none";
        document.getElementById('button_back_2').style.display = "none";
        document.getElementById('button_back_3').style.display = "none";
    }, 500);
    $(".p1hover").removeClass('selected');
    $(".p1hover").removeClass('selectedtext');
    $(".p2hover").removeClass('selected');
    $(".p2hover").removeClass('selectedtext');
    $(".p3hover").removeClass('selected');
    $(".p3hover").removeClass('selectedtext');
    $("label").show()
});
$( "#button_back_3").click(function() {
    document.getElementById('button_si_1').style.opacity = "0";
    document.getElementById('button_no_1').style.opacity = "0";
    document.getElementById('button_si_2').style.opacity = "0";
    document.getElementById('button_no_2').style.opacity = "0";
    document.getElementById('button_si_3').style.opacity = "0";
    document.getElementById('button_no_3').style.opacity = "0";
    document.getElementById('button_back_1').style.opacity = "0";
    document.getElementById('button_back_2').style.opacity = "0";
    document.getElementById('button_back_3').style.opacity = "0";
    setTimeout(function(){
        document.getElementById('button_si_1').style.display = "none";
        document.getElementById('button_no_1').style.display = "none";
        document.getElementById('button_si_2').style.display = "none";
        document.getElementById('button_no_2').style.display = "none";
        document.getElementById('button_si_3').style.display = "none";
        document.getElementById('button_no_3').style.display = "none";
        document.getElementById('button_back_1').style.display = "none";
        document.getElementById('button_back_2').style.display = "none";
        document.getElementById('button_back_3').style.display = "none";
    }, 500);
    $(".p1hover").removeClass('selected');
    $(".p1hover").removeClass('selectedtext');
    $(".p2hover").removeClass('selected');
    $(".p2hover").removeClass('selectedtext');
    $(".p3hover").removeClass('selected');
    $(".p3hover").removeClass('selectedtext');
    $("label").show()
});

$(".p1hover").click(function() {
    $(this).addClass('selected');
    $(this).addClass('selectedtext');

  
    $("label").hide()
    document.getElementById('button_si_1').style.display = "inline";
    document.getElementById('button_no_1').style.display = "inline";
    document.getElementById('button_back_1').style.display = "inline";
    setTimeout(function(){
        document.getElementById('button_si_1').style.opacity = "1";
        document.getElementById('button_no_1').style.opacity = "1";
        document.getElementById('button_back_1').style.opacity = "1";
    }, 500);
    
});

$(".p2hover").click(function() {
    if (document.getElementById("personaggio_2_img").src === "https://cdn.discordapp.com/attachments/1001843597617938524/1059492049482678292/add-user-icon.png") {
        $.post('https://esx_multicharacter/CreaPlayer', JSON.stringify({num : "2"}))
    } else {
        $(this).addClass('selected');
        $(this).addClass('selectedtext');
    
      
        $("label").hide()
        document.getElementById('button_si_2').style.display = "inline";
        document.getElementById('button_no_2').style.display = "inline";
        document.getElementById('button_back_2').style.display = "inline";
        setTimeout(function(){
            document.getElementById('button_si_2').style.opacity = "1";
            document.getElementById('button_no_2').style.opacity = "1";
            document.getElementById('button_back_2').style.opacity = "1";
        }, 500);
    }    
});

$(".p3hover").click(function() {
    if (document.getElementById("personaggio_3_img").src === "https://cdn.discordapp.com/attachments/1001843597617938524/1059492049482678292/add-user-icon.png") {
        $.post('https://esx_multicharacter/CreaPlayer', JSON.stringify({num : "3"}))
    } else {
        $(this).addClass('selected');
        $(this).addClass('selectedtext');

    
        $("label").hide()
        document.getElementById('button_si_3').style.display = "inline";
        document.getElementById('button_no_3').style.display = "inline";
        document.getElementById('button_back_3').style.display = "inline";
        setTimeout(function(){
            document.getElementById('button_si_3').style.opacity = "1";
            document.getElementById('button_no_3').style.opacity = "1";
            document.getElementById('button_back_3').style.opacity = "1";
        }, 500);
    }
});


  