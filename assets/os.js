// Salut!
$(function() {
   news_get('nutzer');
	kat_get();
;})

// news holen und rendern
// tpl = template & wrapper für ansicht (nutzer, admin)
function news_get(tpl) {
   $.ajax({
      url: 'api.php',
      type: 'GET',
      data: {
         do: 'news_get',
         tpl: tpl
      },
      success: function(data, textStatus, xhr) {
         $('#news_wrapper_' + tpl).html(data);
      }
   });
}

// add
jQuery('#news_add_form').submit(function(event) {
	event.preventDefault();
   $.ajax({
      url: 'api.php',
      type: 'GET',
      data: {
         do: 'news_add',
         title: $('#modal-add_attitle').val(),
         cont: $('#modal-add_atext').val(),
         kid: $('#modal-add_kat').val()
      },
      success: function(data, textStatus, xhr) {
			$('#new_modal').modal('hide')
         $('#news_wrapper_admin').html(data);
      }
   });
});

// edit
jQuery('#news_edit_form').submit(function(event) {
	event.preventDefault();
   $.ajax({
      url: 'api.php',
      type: 'GET',
      data: {
         do: 'news_edit',
         id: $('#news_edit_button').data('aid'),
         title: $('#modal-edit_attitle').val(),
         cont: $('#modal-edit_atext').val(),
         kid: $('#modal-edit_kat').val()
      },
      success: function(data, textStatus, xhr) {
			$('#edit_modal').modal('hide')
         $('#news_wrapper_admin').html(data);
      }
   });
});

// del
$('#news_del_button').click(function() {
	var id = $('#news_del_button').data('aid');
   $.ajax({
      url: 'api.php',
      type: 'GET',
      data: {
         do: 'news_del',
         id: id
      },
      success: function(data, textStatus, xhr) {
         // $('#news_wrapper_admin').html(data);
			$('#del_modal').modal('hide')
			$('#el_'+id).slideUp('fast')
      }
   });
});

// move
// mit document wg. ajax - sont wirds nichts mit dem event nach dem laden
$(document).on("click", '.news_move_button', function(event) {
   var val = this.getAttribute('data-val');
   var ok = false;

   if (val == "up") {
      val = '-3';
      var $current = $(this).closest('.news_el')
      var $previous = $current.prev('.news_el');
      if ($previous.length !== 0) {
         $current.insertBefore($previous);
         var ok = true;
      }
   } else {
      val = '+3';
      var $current = $(this).closest('.news_el')
      var $next = $current.next('.news_el');
      if ($next.length !== 0) {
         $current.insertAfter($next);
         var ok = true;
      }
   }

	// sind wir am anfang oder ende
   if (ok == false) return;

   $.ajax({
      url: 'api.php',
      type: 'GET',
      data: {
         do: 'news_move',
         xid: this.getAttribute('data-aid'),
         val: val
      },
      success: function(data, textStatus, xhr) {
         // wir brauchen kein update, das machen wir schon per js
      }
   });
});

// alle kats für selector
function kat_get() {
   $.ajax({
      url: 'api.php',
      type: 'GET',
		dataType: 'json',
      data: {
         do: 'kat_get',
			json: 'true'
      },
      success: function(data, textStatus, xhr) {
			var html = "<option> - </option>";
			jQuery.each(data, function(i,val) {
			  html = html + '<option value="'+val["id"]+'">'+val["title"]+'</option>';
			});
			$("#modal-add_kat").html(html);
			$("#modal-edit_kat").html(html);
      }
   });
}

// UI stuff
$('#btn_nutzer').click(function() {
   news_get('nutzer');
});

$('#btn_admin').click(function() {
   news_get('admin');
});

// views
$('#btn_nutzer').click(function() {
   $('#nutzeransicht').show();
   $('#admin').hide();
   $('.navbar .btn').removeClass('btn-primary');
   $('.navbar .btn').removeClass('btn-secondary');
   $('#btn_nutzer').addClass('btn-primary');
   $('#btn_admin').addClass('btn-secondary');
})

$('#btn_admin').click(function() {
   $('#nutzeransicht').hide();
   $('#admin').show();
   $('.navbar .btn').removeClass('btn-primary');
   $('.navbar .btn').removeClass('btn-secondary');
   $('#btn_nutzer').addClass('btn-secondary');
   $('#btn_admin').addClass('btn-primary');
})

// modols
$('#new_modal').on('show.bs.modal', function(event) {
   $('#modal-add_attitle').val('');
   $('#modal-add_atext').val('');
})

$('#del_modal').on('show.bs.modal', function(event) {
   var button = $(event.relatedTarget);
   var datavalue = button.data('aid');
   var atitle = $('#atitle_' + datavalue).text();

   var modal = $(this);
   modal.find('.modal-atitle').text(atitle);
   $('#news_del_button').data("aid", datavalue);
})

$('#edit_modal').on('show.bs.modal', function(event) {
   var button = $(event.relatedTarget);
   var datavalue = button.data('aid');
	var katvalue = button.data('kid');
   var atitle = $('#atitle_' + datavalue).text();
   var atext = $('#atext_' + datavalue).text();

   $('#modal-edit_attitle').val(atitle);
   $('#modal-edit_atext').val(atext);
   $('#news_edit_button').data("aid", datavalue);
	$("#modal-edit_kat").val(katvalue);
})
