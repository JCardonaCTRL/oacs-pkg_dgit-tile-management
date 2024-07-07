#List all properties for the tile_id based on the section

#@author: Joe Camel (jcardona@mednet.ucla.edu)
#@creation-date: 2020-06-18

#parameters
#   tile_id
#   section (dac, dati, datc)
#   action_p f

#included in
#    packages/dgit-tile-management/www/tile/manage.adp

#
set action_p t

if {![info exists action_p]} {
    set action_p f
}

#we get the package_key of the package/tile
set package_key [dap::tile::getRefKey -tile_id $tile_id]

#we need the version_id of the package/tile so we can get the inheritance if it does exists
set version_id [dap::tile::getVersionId -tile_id $tile_id]

# prefix based on section
switch $section {
    "dac" {
        set prefix "_dac_"
    }
    "dati" {
        set prefix "_dati_"
    }
    "datc" {
        set prefix "_datc_"
    }
    "dai" {
        set prefix "_dai_"
    }
}

db_multirow -extend {is_extended_pretty extended_package actions} properties_list get_properties "" {

    set extended_refs [db_list is_extended_property ""]

    if {$extended_refs eq ""} {
        set is_extended_pretty "No"
    } else {
        set is_extended_pretty "Yes"
    }

    set extended_package [join $extended_refs ,]
    set actions "<button class='btn btn-primary editValues' id='${section}_${property}_${tile_id}' data-property='$property' data-section='$section' >Edit</button>"
}
