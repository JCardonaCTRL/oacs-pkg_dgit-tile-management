ad_library {}
namespace eval dgsom::dgit::tile {}

# (3.)
ad_proc -public dgsom::dgit::tile::get {
	{-column_array "tile_info"}
} {
	upvar $column_array row
	set exist_p [db_0or1row select {} -column_array row]
	return $exist_p
}
