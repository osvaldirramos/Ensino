
var filters = {
	'requerido': function(el) {return ($(el).val() != "" && $(el).val() != 'null' && $(el).val() != 'undefined') ;},    
	'nome': function(el) {return /^[a-z. &A-Z0-9\xC0-\xC4\xC7-\xCA\xCC\xCD\xD1-\xDC\xE0-\xE4\xE7-\xEA\xEC\xED\xF0-\xF5\xF9\xFA]{3,}$/.test($(el).val());},   
	'email': function(el) {return /^[a-z][a-z.0-9_]*@[a-z0-9_]+\.[a-z0-9_.]+[a-z]$/.test($(el).val());},
	'telefone': function(el){return /^\(\d{2}\)\d{4}-\d{4}$/.test($(el).val());},
	'data1':function(el){ if(hoje < datainvert($(el).val())) return false; else return (/^((0?[1-9]|[12]\d)\/(0?[1-9]|1[0-2])|30\/(0?[13-9]|1[0-2])|31\/(0?[13578]|1[02]))\/(19|20)?\d{2}$/.test($(el).val()))},
	'data2':function(el){if($(el).val()!="") if((hoje<datainvert($(el).val())) || (datainvert($(el).val())<datainvert($('.data').val()))  ) return false; else return (/^((0?[1-9]|[12]\d)\/(0?[1-9]|1[0-2])|30\/(0?[13-9]|1[0-2])|31\/(0?[13578]|1[02]))\/(19|20)?\d{2}$/.test($(el).val())); else return true},
	'dataValida' : function(el) { return /^((0?[1-9]|[12]\d)\.(0?[1-9]|1[0-2])|30\.(0?[13-9]|1[0-2])|31\.(0?[13578]|1[02]))\.(19|20)?\d{2}$/.test($(el).val());},
	'numCartaoCred': function(el) { return  /^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$/.test($(el).val());},
	'cpf': function(el) {return valida_cpf($(el).val())},
	'cnpj': function(el) {valida_cnpj($(el).val());},
	'numero1': function(el) { return /^[0-9]+$/.test($(el).val());},
 	'numero2': function(el) { return ($(el).val()>0);}   
}

function valida(elemento){ 
	 if (elemento.each(function(){
		if (typeof filters == 'undefined') return true;
		var classe = $.browser.msie ? "className" : "class";
		$(this).find("input, textarea, select").each(function(x,el){
			if ($(el).attr(classe) != 'undefined' ) {
				$(el).removeClass("error");
				$.each(new String($(el).attr(classe)).split(" "), function(x, klass){
						if ($.isFunction(filters[klass]))
							if (!filters[klass](el)) $(el).addClass("error");
				});
			}
		});
	}).find(".error").length > 0) {
		$('.error').first().focus().addClass("error");
		return false;
	}
	else return true;
}





$(document).ready(function(){
	$('.error').live('keydown',function(){  
		$(this).removeClass('error');
	}).live('focus',function(){  
		$(this).removeClass('error');
	}).live('click',function(){  
		$(this).removeClass('error');
	});
//	$('#sair').click(function(){
//		window.location.href = $(this).attr('alvo');
//	})
	
	$('.button2').click(function(){
		var alvo = $(this).attr('alvo');
		var ref =$(this).attr('ref')
		if(alvo!="") $('#'+alvo).load(ref)
		else window.location.href = $(this).attr('alvo');
	})
	
	$('.button3').click(function(){
		$('#cmd_extra').hide();
		$('#pnl_extra').css('width',0)
		$('titulo').html($(this).attr('titulo'))
		if($('#div_avaliacao:visible')) $('#div_avaliacao').hide()
		
		var alvo = $(this).attr('alvo');
		var ref =$(this).attr('ref')
		if(alvo!="") $('#'+alvo).load(ref)
		else window.location.href = $(this).attr('alvo');
	})
	
	$('#cmd_extra ').click(function() {
		if($('#pnl_extra').width()>30) var larg =0;
		else var larg = 250;
	  $('#pnl_extra').animate({
		width: larg
	  }, 500, function() {
		// Animation complete.
	  });
	});
	
});