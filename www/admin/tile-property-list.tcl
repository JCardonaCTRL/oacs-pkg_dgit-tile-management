ad_page_contract {
    List all properties for the tile_id where they have prefixes _datc_

    @author:        jcardona@mednet.ucla.edu
    @creation-date: 2020-06-02
} {
    {tile_id}
    {action_p f}
}

#we get the package_key of the package/tile
set package_key     [apm_package_key_from_id $tile_id]

#we get the package_information based on the package_key of the package/tile
apm_version_get -package_key $package_key -array "tile_info"

#we need the version_id of the package/tile so we can get the inheritance if it does exists
set version_id      $tile_info(version_id)

db_multirow -extend {is_extended_pretty extended_package actions} properties_list get "
    select  param.default_value,
            param.parameter_name as property,
            param_values.attr_value as property_value
    from apm_parameter_values param_values
    join apm_parameters param on param.parameter_id = param_values.parameter_id
    where param.package_key = :package_key
        and param_values.package_id = :tile_id
        and param.parameter_name like '_dac_%'
    " {

    set is_extended_pretty "No"
    set extended_package ""

    #for consistency purposes we are going to strip the prefix of the property
    #set property [string range $property 6 end]
    set actions "<button>Edit</button>"
}
#select *
#	from   apm_package_dependencies
#	where  version_id = 991
#	and    dependency_type = 'extends'
#	order by service_uri;
#
#select  pd.dependency_id,
#        t_provides.pretty_name as dep_pretty_name,
#        t_provides.package_key as dep_package_key,
#        v_provides.version_name as dep_version_name,
#        v_provides.version_id as dep_version_id
#from apm_package_dependencies pd
#join apm_package_dependencies pd_provides on pd_provides.service_uri = pd.service_uri
#join apm_package_versions v_provides  on v_provides.version_id = pd_provides.version_id
#join apm_package_types t_provides on t_provides.package_key = v_provides.package_key
#where pd.version_id = 991
#    and   pd.dependency_type = 'extends'
#    and   pd_provides.dependency_type = 'provides'
#order by pd.service_uri;
#
#select  param.default_value,
#        param.parameter_name as property
#from apm_parameters param
#where param.package_key = 'dgit-base-tile'
#    and param.parameter_name like '_datc_%'
