ad_page_contract {

} {
	{tile_id}
	{section}
	{property}
	{property_value:allhtml}
}
# ------------------------
# call based on section
# ------------------------
switch $section {
    "dati" {
		# Internal Tile Properties (DATI)
		set result [dap::tile::setTileInternalProperty -tile_id $tile_id -property $property -value $property_value]
    }
	"datc" {
		# User Customizable Properties (DATC)
		set result [dap::tile::setUserCustomProperty -tile_id $tile_id -property $property -value $property_value]
    }
    "dac" {
		# Inherieted Tile Properties (DAC)
		set result [dap::tile::setAppCustomProperty -tile_id $tile_id -property $property -value $property_value]
    }
}
# ------------------------


doc_return 200 text/plain "-result $result"
ad_script_abort
