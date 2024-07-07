<?xml version="1.0"?>
<queryset>

  <fullquery name="dgsom::dgit::tile::get.select">
    <querytext>
	  select 
	  v.version_id, 
	  v.package_key, 
	  t.pretty_name, 
	  v.version_name, 
	  to_char(v.release_date, 'YYYY-MM-DD') as release_date
	  from 
	  apm_package_versions v
	  inner join apm_package_types t on (t.package_key = v.package_key) 
	  where v.package_key = 'dgit-base-tile'

	  and (
      installed_p = 't' 
      or enabled_p = 't' 
      or not exists (
      select 1 
      from apm_package_versions v2 
      where v2.package_key = v.package_key 
      and (v2.installed_p = 't' or v2.enabled_p = 't') 
      and apm_package_version__sortable_version_name(v2.version_name) > apm_package_version__sortable_version_name(v.version_name)
      )
	  )
	  
    </querytext>
  </fullquery>

</queryset>
