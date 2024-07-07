<br />
<div class="col-sm-12">
    <div class="well">
        <if @properties_list:rowcount@ gt 0>
        <table class="table table-border" width="100%">
            <thead>
                <tr>
                    <th>Property</th>
                    <th>Default</th>
                    <th>Is Extended</th>
                    <th>Extended Ref</th>
                    <th>Value</th>
                    <if @action_p@><th>Actions</th></if>
                </tr>
            </thead>
            <tbody>
            <multiple name="properties_list">
                <tr>
                    <td>@properties_list.property@</td>
                    <td>@properties_list.default_value@</td>
                    <td>@properties_list.is_extended_pretty@</td>
                    <td>@properties_list.extended_package@</td>
                    <td class="editableColumns" >@properties_list.property_value;noquote@</td>
                    <if @action_p@>
					  <td class="editableColumnButton" >@properties_list.actions;noquote@</td>
					</if>
                </tr>
            </multiple>
            </tbody>
        </table>
        </if><else>
            No properties found
        </else>
    </div>
</div>
