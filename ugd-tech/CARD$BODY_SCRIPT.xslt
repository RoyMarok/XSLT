 <script>
 function showLoadingIndicator() {
    $("#overlayCard").css({width: "100%"}).show();
    $("#loadingIndicatorCard").show();
  }
  
  function hideLoadingIndicator() {    
    $("#overlayCard, #loadingIndicatorCard").hide();
  }
  

  $(document).ready(function(){

    
   $(".block").on("click", ".sectionTitle",  function(){
      var self = $(this),
          parent= self.parents(".block"); //closest
          parent.toggleClass("close");      
      parent.children().not('p.sectionTitle').not('hr').slideToggle("fast", function(){          
      });      
    })   
    
    $(".subTitle").on("click", function(){
      var self = $(this),
          parent= self.closest(".block"); //closest
          parent.toggleClass("close");      
      parent.children().not('.subTitle').not('hr').slideToggle("fast", function(){          
      });      
    })   
    
  });

  </script>