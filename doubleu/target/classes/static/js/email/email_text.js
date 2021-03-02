/**
 * 텍스트 쓰기
 */

	summernote = function() {
		$('#summernote').summernote({
        placeholder: '',
        tabsize: 2,
        height: 300,
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
	