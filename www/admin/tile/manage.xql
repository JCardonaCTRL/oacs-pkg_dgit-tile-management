<?xml version="1.0"?>
<queryset>

  <fullquery name="apm_package_info_by_version_id">      
    <querytext>
      select
	  a.package_key,
	  a.pretty_name,
	  a.version_name,
	  a.installed_p,
	  to_char(b.last_modified, 'mm/dd/yyyy') as last_modified
      from apm_package_version_info a
	  inner join acs_objects b on (a.version_id = b.object_id)
      where b.object_id = :tile_id
    </querytext>
  </fullquery>

  <fullquery name="apm_package_info_by_tile_id">      
    <querytext>
      select
	  p.package_id,
	  p.package_key,
	  p.instance_name,
	  to_char(ao.last_modified, 'mm/dd/yyyy') as last_modified,
	  v.version_name
      from apm_packages p
	  inner join acs_objects ao on (p.package_id = ao.object_id)
	  inner join apm_package_version_info v on (p.package_key = v.package_key)
      where p.package_id = :tile_id
	  and (
      installed_p = 't' or enabled_p = 't' or not exists (
      select 1 
      from apm_package_versions v2 
      where v2.package_key = v.package_key 
      and (
      v2.installed_p = 't' 
      or v2.enabled_p = 't'
      ) 
      and apm_package_version__sortable_version_name(v2.version_name) > apm_package_version__sortable_version_name(v.version_name)
      )
	  )
	  
    </querytext>
  </fullquery>
  
  

</queryset>
