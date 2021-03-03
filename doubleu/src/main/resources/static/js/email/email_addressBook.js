/**
 * addressBook
 */


function getCheckboxValue()  {
	  // 선택된 목록 가져오기
	  
	  const query = 'input[name="emailAddressChk"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
		
	  var ResultContents = new Array();
	  var InputArray = new Array();  
	  // 선택된 목록에서 value 찾기
	  
	   for(var i=0; i<selectedEls.length; i++) {
		   ResultContents[i] = selectedEls[i].value;


		
		  var node = document.createElement('span');
		  node.setAttribute('value', ResultContents[i]);
		  node.setAttribute('name', 'emailReceiverAddress')
		  node.setAttribute('class', 'badge rounded-pill bg-light text-dark')
		  var textnode = document.createTextNode(ResultContents[i]);     
		  var appendNode = node.appendChild(textnode);
         
		  //부모
		  document.getElementById('result').appendChild(node);
		  
	  }

}

function getSendDel()  {
	  // 선택된 목록 가져오기
	  
	  const query = 'input[name="emailAddressChk"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);

	  var ResultContents = new Array();  

	   for(var i=0; i<selectedEls.length; i++) {
		   ResultContents[i] = selectedEls[i].value;

		  var parent = document.getElementById('result');
		  var child = parent.getElementsByTagName('span');      
		   parent.remove();
	  }

}




function getCheckboxValueRef()  {
	  // 선택된 목록 가져오기
	  
	  const query = 'input[name="emailAddressChk"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);

	  var ResultContents = new Array();  
	
	   for(var i=0; i<selectedEls.length; i++) {
		   ResultContents[i] = selectedEls[i].value;

		  var node = document.createElement('span');
		  node.setAttribute('value', ResultContents[i]);
		  node.setAttribute('name', 'emailReceiverRef')
		  node.setAttribute('class', 'badge rounded-pill bg-light text-dark')      
		  var textnode = document.createTextNode(ResultContents[i]);         
		  var appendNode = node.appendChild(textnode);

		  //부모
		  document.getElementById('resultRef').appendChild(node);
		  
	  }

		
}


function getSendDelRef()  {
	  // 선택된 목록 가져오기
	  
	  const query = 'input[name="emailAddressChk"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
		
	  var ResultContents = new Array();  


	   for(var i=0; i<selectedEls.length; i++) {
		   ResultContents[i] = selectedEls[i].value;

		  var parent = document.getElementById('resultRef');
		  var child = parent.getElementsByTagName('span');  
		  console.log("child" + child);    
		  parent.remove();
	  }

}


function addAddress() {

		 const query = 'span[name="emailReceiverAddress"]';
		 const selectedEls = 
		      document.querySelectorAll(query);	
			console.log(query)
		
		 var ResultContents = new Array();  
			
		 for(var i=0; i<selectedEls.length; i++) {
		   ResultContents[i] = selectedEls[i].innerHTML;
		   console.log(ResultContents)

		  var node = document.createElement('input');
		  node.setAttribute('value', ResultContents[i]);
		  node.setAttribute('name', 'emailReceiverAddress')
		  node.setAttribute('class', 'class="form-control"')
		  node.setAttribute('style', 'background-color: #f8f9fa; border:none;')
		  var textnode = document.createTextNode(ResultContents[i]);     
		  var appendNode = node.appendChild(textnode);
         
		  //부모
		  document.getElementById('revMail').appendChild(node);
	  }	

		 const queryRef = 'span[name="emailReceiverRef"]';
		 const selectedElsRef = document.querySelectorAll(queryRef);	
	      var ResultContentsRef = new Array();  
			
		 for(var i=0; i<selectedElsRef.length; i++) {
		   ResultContentsRef[i] = selectedElsRef[i].innerHTML;
		   console.log(ResultContentsRef)

		  var node = document.createElement('input');
		  node.setAttribute('value', ResultContentsRef[i]);
		  node.setAttribute('name', 'emailReceiverRef')
		  node.setAttribute('class', 'class="form-control"')
		  node.setAttribute('style', 'background-color: #f8f9fa; border:none;')
		  var textnode = document.createTextNode(ResultContentsRef[i]);     
		  var appendNode = node.appendChild(textnode);
         
		  //부모
		  document.getElementById('revRef').appendChild(node);
	  }	

	
}


