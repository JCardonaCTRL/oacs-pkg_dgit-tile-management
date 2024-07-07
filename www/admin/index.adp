<master>
  <property name="title">Tile List</property>
  <style type="text/css">
   td.details-control {
	 background: url('/resources/dgit-tile-management/images/details_open.png') no-repeat center center;
	 cursor: pointer;
   }
   tr.shown td.details-control {
	 background: url('/resources/dgit-tile-management/images/details_close.png') no-repeat center center;
   }
  </style>
  <div class="container">
    <h1>@title;noquote@</h1>
	<table id="tile-list" width="100%" cellpadding="0" class="table table-stripped table-hover">
	  <thead></thead>
	  <tbody></tbody>
	  <tfoot></tfoot>
	</table>
  </div>
  <script type="text/javascript" <if @::__csp_nonce@ not nil> nonce="@::__csp_nonce;literal@"</if>>
   function formatBatchSteps(d) {
	 var html = $.ajax({
	   type: "GET",
	   url:  "details?tile_id="+d.tile_id+"&version_id="+d.version_id,
	   async: false
	 }).responseText;
	 return html;
   }
   $(document).ready(function() {
     t_table = $("#tile-list").DataTable({
       "processing": true,
       "serverSide": true,
       "searching": true,
       "pageLength": 25,
       "ajax": {
         "url": "@ajax_url;noquote@",
         "method": "get"
       },
       "columns": [
          { "data": null, "title": "", "searchable":false, "visible": true, "orderable":false, "className": "details-control", "defaultContent": "" , "width": "10%"},
          { "data": "tile_id", "title": "Tile ID"},
          { "data": "version_id", "title": "Version ID", "visible": true },
          { "data": "package_name", "title": "Module Name"},
          { "data": "package_key", "title": "Module Key"},
          { "data": "app_code", "title": "App Code"},
          { "data": "tile_priority", "title": "Tile Priority"},
          { "data": "actions", "title": "Actions", "orderable": false, "class": "center", "visible": true}
       ],
       "order": [["1","asc"]]
     });
	 $("#tile-list").on('click', 'td.details-control', function(e) {
	   e.preventDefault();
	   var tr = $(this).closest("tr");
	   var row = t_table.row(tr);
	   if ( row.child.isShown() ) {
		 row.child.hide();
		 tr.removeClass("shown");
	   } else {
		 row.child( formatBatchSteps( row.data() ) ).show();
		 tr.addClass("shown");
	   }
	 });
   });
  </script>
