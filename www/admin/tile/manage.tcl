ad_page_contract {

    @author: Joe Camel (jcardona@mednet.ucla.edu)

    @creation-date: 2020-05-13
} {
    {tile_id:naturalnum,notnull}
}

db_1row apm_package_info_by_tile_id {}

set action_p t
if {$package_key eq "dgit-base-tile"} {
	set tab_name "Base Tile Properties"
} else {
	set tab_name "Inherited Tile Properties"
}

set package_url [ad_conn vhost_package_url]
