<script type="text/javascript">
	$(document).ready(function() {
		// инициализации подсказок для всех элементов на странице, имеющих атрибут data-toggle="tooltip"
		$('[data-toggle="tooltip"]').tooltip();
	});

	$('.this_tns_shema_link').on('click',function(){
		console.log("this_tns_shema_link"); 
		var code = this.parentNode.querySelector('.this_tns_shema').innerText; // #text - блок из которого нужно скопировать
		console.log(code); 
		
		var $tmp = $("<textarea>");
		$("body").append($tmp);
		$tmp.val(code).select();
		document.execCommand("copy");
		$tmp.remove();
		/*var range = document.createRange();
		range.selectNode(code);
		window.getSelection().addRange(range);
		*/
		try {
			var successful = document.execCommand('copy');
			var msg = successful?'удачно':'неудачно';
			alert('TNS скопирован '+msg);
		} catch(err) {
			alert('Код не скопирован автоматически :с'+'\n'+'Попробуйте вручную');
		}
		window.getSelection().removeAllRanges();
	});
	
	
	
	
	
</script>