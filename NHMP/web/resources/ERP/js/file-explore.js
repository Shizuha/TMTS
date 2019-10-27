(function($){
    $.fn.filetree = function(method){
       
        var settings = { // 노출 설정
            animationSpeed      : 'slow',            
            collapsed           : true,
            console             : false
        }
        var methods = {
            init : function(options){
                // 표준 설정 가져 오기 및 전달 된 값과 병합
                var options = $.extend(settings, options); 
                // 문서에있는 모든 파일 트리에 대해이 작업을 수행하십시오.
                return this.each(function(){
                    
                    var $fileList = $(this);
                   
                    $fileList
                        .addClass('file-list')
                        .find('li')
                        .has('ul') // 내부에 목록이있는 모든 li은 폴더 루트입니다.
                            .addClass('folder-root closed')
                            .on('click', 'a[href="#"]', function(e){ // 폴더 루트 링크에 ​​대한 클릭 재정의 추가
                                e.preventDefault();
                                $(this).parent().toggleClass('closed').toggleClass('open');
                                
                                
                                return false;
                            });
                    
                    //alert(options.animationSpeed); Are the settings coming in

                });
                
                
            }
        }
        
        

        
        if (typeof method === 'object' || !method){
            return methods.init.apply(this, arguments);
        } else {
            $.on( "error", function(){
                console.log(method + " 파일 탐색기에 플러그인에 없습니다");
            } );
        }  
    }
    
}(jQuery));