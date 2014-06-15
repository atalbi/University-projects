  var carrousel = {
	
	nbrSlide : 0,
	nbCourant : 1,
	stopmove : 0,
	elemCurrent : null,
	elem : null,
	timer : null,
	
	init : function(elem){
		this.nbrSlide = elem.find(".slide").length; // recoupirer le nombre de div = slide, donc recupirer le nombre d'images
		
		// Créer la pagination
		/*elem.append('<div class="navigation"></div>'); // ajouter un div ds le page html ds la fin des div slide
		for(var i = 1 ; i <= this.nbrSlide; i++){
			elem.find(".navigation").append("<span>"+i+"</span>");	// ajouter des span qui vont afficher le nombre d'images
		}
		elem.find(".navigation span").click(function(){ carrousel.gotoSlide($(this).text()); })
		*/
		// initialisation du carrousel
		this.elem = elem; // initialiser elem par les nouvelles element ajouter navigation et span
		elem.find(".slide").hide();  // caché tout les elements images car il va afficher le derniére de la liste
		elem.find(".slide:first").show();	// afficher la premier image de ma liste
		this.elemCurrent = elem.find(".slide:first"); 
		this.elem.find(".navigation span:first").addClass("active");	
		
		// on cré le timer
		this.timer = window.setInterval("carrousel.next()",5000);	
		//carrousel.play();
		
		// stop quon passe dessus
		elem.mouseover(carrousel.stop);
		elem.mouseout(carrousel.play);
		stopmove = 0;
	},
	
	gotoSlide : function(num){
		if(num == this.nbCourant){
			return false;
		}
		
		this.elemCurrent.fadeOut();
		this.elem.find("#slide"+num).fadeIn();
		/*
		var sens = 1;
		if(num < this.nbCourant){ sens = -1};
		
		var cssDeb = { "left": sens*this.elem.width()};
		var cssFin = { "left": -sens*this.elem.width()};
		this.elem.find("#slide"+num).show().css(cssDeb);
		
		this.elem.find("#slide"+num).animate({"top":0,"left":0},500);
		this.elemCurrent.animate(cssFin,500);
		*/
		//this.elem.find(".navigation span").removeClass("active");
		//this.elem.find(".navigation span:eq("+(num-1)+")").addClass("active");
		this.nbCourant = num;
		this.elemCurrent = this.elem.find("#slide"+num);
		
	},
	
	next : function(){
		if(stopmove == 0){
			var num = this.nbCourant + 1;
			if(num > this.nbrSlide){
				num = 1; 
			}
			this.gotoSlide(num);
		}
	},
	
	stop : function(){
		stopmove = 1;
	},
	
	play : function(){
		stopmove = 0;
	}

	
}
$(function(){
	carrousel.init($("#carrousel"));
});















