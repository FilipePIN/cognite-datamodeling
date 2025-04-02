/* MAPPING_MODE_ENABLED: false */
/* {
  "version":1,
  "sourceType":"raw",
  "mappings":[{"from":"external_id","to":"externalId","asType":"STRING"}],
  "sourceLevel1":"radix_space",
  "sourceLevel2":"assets"
} */
select
  cast(`external_id` as STRING) as externalId,
  case
    when `parent_external_id` is not null and `parent_external_id` != ''
      then node_reference('radix_space', `parent_external_id`)
    else null
  end as parent,
  cast(`name` as STRING) as name,
  cast(`description` as STRING) as description
from
  `oee_nitric_acid_plant_demo`.`assets`;