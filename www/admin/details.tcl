ad_page_contract {} {
	{tile_id}
	{version_id}
}
set tile_check [db_0or1row check_tiles {}]
db_multirow -extend {module_name edit_link} tiles select_tiles {} {
	set module_name ""
	set edit_link "<a href='tile/manage?[export_vars -url {tile_id}]'>Manage</a>"
}

