$('#complain').hide();

$('#type').change(function() {
	switch($('#type :selected').val()) {
		case 'desktop':
			$('#make').append($('<option value="maker1">Maker 1</option>'));
			$('#make').append($('<option value="maker2">Maker 2</option>'));
			$('#make').append($('<option value="maker3">Maker 3</option>'));
			$('#make').append($('<option value="maker4">Maker 4</option>'));
			break;
		case 'laptop':
			$('#make').append($('<option value="maker1">Maker 1</option>'));
			$('#make').append($('<option value="maker2">Maker 2</option>'));
			$('#make').append($('<option value="maker3">Maker 3</option>'));
			$('#make').append($('<option value="maker4">Maker 4</option>'));
			break;
		case 'server':
			$('#make').append($('<option value="maker1">Maker 1</option>'));
			$('#make').append($('<option value="maker2">Maker 2</option>'));
			$('#make').append($('<option value="maker3">Maker 3</option>'));
			$('#make').append($('<option value="maker4">Maker 4</option>'));
			break;
		case 'printer':
			$('#make').append($('<option value="maker1">Maker 1</option>'));
			$('#make').append($('<option value="maker2">Maker 2</option>'));
			$('#make').append($('<option value="maker3">Maker 3</option>'));
			$('#make').append($('<option value="maker4">Maker 4</option>'));
			break;
		case 'network':
			$('#make').append($('<option value="maker1">Maker 1</option>'));
			$('#make').append($('<option value="maker2">Maker 2</option>'));
			$('#make').append($('<option value="maker3">Maker 3</option>'));
			$('#make').append($('<option value="maker4">Maker 4</option>'));
			break;
	}
});

$('#problem').change(function() {
	if($('#problem :selected').val() === 'Other') {
		$('#complain').show();
	}
});
