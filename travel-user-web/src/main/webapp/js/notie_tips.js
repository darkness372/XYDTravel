function success(msg) {
	notie.alert(1, msg, 5);
}

function warning(msg) {
	notie.alert(2, msg, 5);
}

function error(msg) {
	notie.alert(3,msg, 5);
}

function info(msg) {
	notie.alert(4, msg, 5);
}

function confirm(tip,msg) {
	notie.confirm(
		tip,
		'确认', '取消', function() {
			notie.alert(1, msg, 5);
		});
}

function input(tip) {
	notie.input(tip, '确认', '取消',
			'text', 'www.edu118.com', 
			function(value_entered) {
				notie.alert(1, 'You entered: ' + value_entered, 5);
			});
}