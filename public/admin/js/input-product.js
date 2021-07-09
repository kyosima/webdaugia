function getProduct(url,id){
    $.ajax({
           type: "GET",
           url: url+"/"+id,
           data: form.serialize(), // serializes the form's elements.
           error: function()
           {
                console.log(data);
           },
           success: function(response)
           {
               alert(data); // show response from the php script.
           }
         });

    
}
   
