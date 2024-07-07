<master>
<div class="container">
    <a href="@package_url;literal@" class="btn btn-primary pull-right text-white" >Back</a>

    <h1>Tile Manage Page</h1>
    <ul>
        <li>Module Name: @package_key@</li>
        <li>Version #:  @version_name@</li>
        <li>Last Modified: @last_modified@</li>
    </ul>
    <ul class="nav nav-pills mb-3" id="tileTab" role="tablist" >
        <li class="nav-item">
            <button class="nav-link active" id="internal-tab" data-target="#internal" data-toggle="pill" 
                data-bs-target="#internal" data-bs-toggle="pill" type="button" role="tab" aria-controls="tiles-tab" aria-selected="true">
                Internal Tile Properties (DATI)
            </button>
        </li>
        <li class="nav-item">
            <button class="nav-link" id="user-tab" data-target="#user" data-toggle="pill" 
                data-bs-target="#user" data-bs-toggle="pill" type="button" role="tab" aria-controls="tiles-tab" aria-selected="false">
                User Customizable Properties (DATC)
            </button>
        </li>
        <li class="nav-item">
            <button class="nav-link" id="inherited-tab" data-target="#inherited" data-toggle="pill" 
                data-bs-target="#inherited" data-bs-toggle="pill" type="button" role="tab" aria-controls="tiles-tab" aria-selected="false">
                @tab_name@ (DAC)
            </button>
        </li>
    </ul>
    <div class="tab-content" id="tileTabContent">
        <div class="tab-pane fade active show" id="internal" role="tabpanel" aria-labelledby="internal-tab">
            <include src="/packages/dgit-tile-management/lib/tile/properties"
                    tile_id=@tile_id@
                    section=dati
                    action_p=@action_p@/>
        </div>
        <div class="tab-pane fade" id="user" role="tabpanel" aria-labelledby="user-tab">
            <include src="/packages/dgit-tile-management/lib/tile/properties"
                    tile_id=@tile_id@
                    section=datc
                    action_p=@action_p@/>
        </div>
        <div class="tab-pane fade" id="inherited" role="tabpanel" aria-labelledby="inherited-tab">
            <include src="/packages/dgit-tile-management/lib/tile/properties"
                    tile_id=@tile_id@
                    section=dac
                    action_p=@action_p@/>
        </div>
    </div>
</div>
<script language="JavaScript" type="text/javascript" <if @::__csp_nonce@ not nil> nonce="@::__csp_nonce;literal@"</if>>
$(function(){
    var hash    = document.location.hash;
    var prefix  = "t";
    if (hash) {
        $('.nav-tabs a[href="'+hash.replace(prefix,"")+'"]').tab('show');
    }
    $('.nav-tabs a').on('shown.bs.tab', function (e) {
        window.location.hash = e.target.hash.replace("#", "#" + prefix);
    });

    $('.editValues').click(function () {
        var fields = $(this).attr('id').split('_');
        var a = fields[0];
        var b = fields[1];
        var c = fields[2];
        var property = $(this).data('property');
        var section = $(this).data('section');
        $(this).parents('tr').find('td.editableColumns').each(function() {
           var property_value = $(this).html();

           if (property == 'appDisplayInformation' || property == 'tileIcon' || section == 'dati') {
               var input = $('<textarea class="editableColumnsStyle" id="propertyValue" cols="75"/></textarea>');
               input.html(property_value);
               $(this).html(input);
           } else {
               var input = $('<input class="editableColumnsStyle" id="propertyValue" type="text" size=75/>');
               input.val(property_value);
               $(this).html(input);
           }
        });
        $(this).hide();
        $(this).closest(".editableColumnButton").
           append('<button class="editSaveButton btn btn-success" id="' + a + '_' + b + '_' + c + '" >Save</button> <button class="btn btn-warning" id="editCancelButton">Cancel</button>');
        $("button.editValues").attr("disabled", true);
    });

    $(document).on("click", "#editCancelButton", function() {
        location.reload();
    });

    $(document).on("click", ".editSaveButton", function() {
        var fields = $(this).attr('id').split('_');
        var a = fields[0];
        var b = fields[1];
        var c = fields[2];
        $.ajax({
            url:    "post",
            method: "post",
            data:  {
                section:  a,
                property: b,
                tile_id:  c,
                property_value: $('#propertyValue').val()
            }
        }).done(function(data, text) {
            console.log('SUCCESS: ' + data);
            location.reload();
        }).fail(function(request, status, error) {
            console.log('ERROR: ' + error);
        });
    });
});
</script>
