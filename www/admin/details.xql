<?xml version="1.0"?>
<queryset>

  
  <fullquery name="check_tiles">
    <querytext>
	  select 1
	  from apm_package_dependencies
	  where version_id = :version_id
	  and dependency_type = 'extends'
	  and service_uri != 'dgit-base-tile'
	  limit 1
    </querytext>
  </fullquery>

  <fullquery name="select_tiles">
    <querytext>
	  select
	  a.version_id,
	  a.service_uri,
	  a.service_version,
	  b.pretty_name
	  from apm_package_dependencies a
	  left join apm_package_version_info b on (a.service_uri = b.package_key)
	  where a.version_id = :version_id
	  and a.dependency_type = 'extends'
	  and a.service_uri != 'dgit-base-tile'	  
	  order by service_uri
    </querytext>
  </fullquery>
  
  <fullquery name="select_module_name">
    <querytext>
      select a.pretty_name
      from apm_package_version_info a
      where a.version_id = :version_id
    </querytext>
  </fullquery>

	
</queryset>
