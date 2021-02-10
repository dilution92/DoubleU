/**
 * 텍스트 쓰기
 */

	summernote = function() {
		$('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 500,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video',]],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
	}; 
	