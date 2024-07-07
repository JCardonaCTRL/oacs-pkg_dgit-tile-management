<div class="col-sm-12">
  <div class="well">
	<if @tile_check@ eq 1>
	  <table class="table table-borderless">
		<thead>
		  <tr>
			<th>Module Name</th>
			<th>Module Key</th>
			<th>Version</th>
		  </tr>
		</thead>
		<tbody>
		  <multiple name="tiles">
			<tr>
			  <td>@tiles.pretty_name@</td>
			  <td>@tiles.service_uri@</td>
			  <td>@tiles.service_version@</td>
			</tr>
		  </multiple>
		</tbody>
	  </table>
	</if>
	<else>
	  <p>No extended tiles found.</p>
	</else>
  </div>
</div>
