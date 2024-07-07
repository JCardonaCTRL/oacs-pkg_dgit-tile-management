<?xml version="1.0"?>
<queryset>

  <fullquery name="get_properties">
    <querytext>
        select  param.default_value,
                substring(param.parameter_name from '${prefix}(.+)$' ) as property,
                param_values.attr_value as property_value
        from apm_parameter_values   param_values
        join apm_parameters         param on param.parameter_id = param_values.parameter_id
        where param.package_key         = :package_key
            and param_values.package_id = :tile_id
            and param.parameter_name    like '${prefix}%'
        order by property
    </querytext>
  </fullquery>

  <fullquery name="is_extended_property">
    <querytext>
        select type.pretty_name
        from apm_parameters             param
        join apm_package_dependencies   dep     on param.package_key = dep.service_uri
        join apm_package_types          type    on type.package_key = param.package_key
        where dep.version_id = :version_id
            and dep.dependency_type = 'extends'
            and substring(param.parameter_name from '${prefix}(.+)$' ) = :property
    </querytext>
  </fullquery>

</queryset>
