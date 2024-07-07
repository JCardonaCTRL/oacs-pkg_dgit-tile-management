<master>

<table width="100%">
    <thead>
        <th>Property</th>
        <th>Default</th>
        <th>Is Extended</th>
        <th>Extended Package</th>
        <th>Value</th>
        <if @action_p@><th>Actions</th></if>
    </thead>
    <tbody>
    <multiple name="properties_list">
        <tr>
        <td>@properties_list.property;noquote@</td>
        <td>@properties_list.default_value;noquote@</td>
        <td>@properties_list.is_extended_pretty;noquote@</td>
        <td>@properties_list.extended_package;noquote@</td>
        <td>@properties_list.property_value;noquote@</td>
        <if @action_p@><td>@properties_list.actions;noquote@</td></if>
        </tr>
    </multiple>
    </tbody>
</table>
