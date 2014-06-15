$(function(){
   
    $("#Clique_cand").click(function(){
            var login = $("#can_log").val();
            var passe = $("#can_pass").val();
            $.get("Servlet/iden_cand",{login:login,mot_de_passe:passe},function(data){
               alert(data) ;
            });
            return false;
    });

    $("#clic_recrut").click(function(){
        var loginR = $("#recrut_log").val();
        var passR = $("#recrut_pass").val();
        alert(loginR+" "+passR);
        $get("Servlet/iden_recrut",{login_recrut:loginR,pass_recrut:passR},function(data){
            alert(data);
        });
        return false;
    });
});