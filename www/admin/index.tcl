ad_page_contract {} {}
set title "Tiles"
set ajax_url "datatable-json/tiles"


template::head::add_css -href "//cdn.datatables.net/2.0.3/css/dataTables.dataTables.min.css" -order 99
template::head::add_javascript -src "//cdn.datatables.net/2.0.3/js/dataTables.min.js" -order 99

security::csp::require script-src cdn.datatables.net
security::csp::require style-src cdn.datatables.net