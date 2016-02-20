  $(function() {
    function log( message ) {
      $( "<div>" ).text( message ).prependTo( "#log" );
      $( "#log" ).scrollTop( 0 );
    }
	
	$('.autocomplete:input').each(function(i, el) {
    el = $(el);
    el.autocomplete({
        source: function(request, response) {
            var url = el.attr('data-source');
			$.ajax({
			  url: url,
			  dataType: "json",
			  data: {
				query: el.val(),
				type: el.attr('object-type')
			  },
			  success: function( data ) {
					response( $.map( data.result, function( object ) {
						return {
							label: object.description,
							value: object.id 
						}
					}));
		}})},
		select: function( event, ui ) {
		 event.preventDefault();
         el.val(ui.item.label);
		 $(el.attr('data-field1')).val(ui.item.value);
		 $(el.attr('data-field2')).val(ui.item.value);
      }
    });
	});
 
  });