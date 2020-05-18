
function AjaxRotator_Update(result, context)
{
    var divContent = document.getElementById(context);
    divContent.innerHTML = result;
}

function AjaxRotator_Error(error)
{
    alert( error );
}
