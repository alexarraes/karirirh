 $("input[type=submit]").click(function () {
        $.ajax({
          url: "UsuarioControlador",
            type: "GET",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
                login: $("input[placeholder=Login]").val(),
                senha: $("input[placeholder=Senha]").val()
            }),
            success: function (response) {
                alert("success");
            },
            error: function (e) {
                alert("error");
            }
        });
    });
