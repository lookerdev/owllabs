connection: "redshift"

include: "/geo_map/devices_v_test.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: devices_v_test {
}

# map_layer: world_countries {
#   feature_key: "ISO_A3"
#   file: "/geo_map/world_countries.json"
#   format: topojson
#   label: "Countries JSON"
#   max_zoom_level: 12
#   min_zoom_level: 2
#   projection: airy
#   property_key: "ISO_A3"
#   property_label_key: "NAME"
# }

map_layer: world_countries_layer {
  file: "/geo_map/world_countries.json"
  max_zoom_level: 12
  min_zoom_level: 2
  # property_key: "iso3"
  property_key: "lastgeo_country_iso3"
}

map_layer: europe_countries_layer {
  file: "/geo_map/europe_countries.json"
  max_zoom_level: 12
  min_zoom_level: 2
  property_key: "lastgeo_country_iso3"
}
