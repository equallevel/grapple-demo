initalizeCodeMirror = function(id, mode){
	var codeMirrorIds = ['controller', 'view']
	var codeMirrorModes = ["ruby", 'htmlmixed']

	var content = $('#' + id + '_hidden').text();
	var codeMirrorContainer = document.getElementById(id + '_codemirror');
	var codeMirror = CodeMirror(codeMirrorContainer, {
		value: content,
		mode: mode,
		readOnly: true,
		lineNumbers: true,
		viewportMargin: Infinity
	});

	//need to refresh code mirror on tab change
	$('a[href="#'+id+'"]').on('shown.bs.tab', function (e) {
  	codeMirror.refresh();
	});
}