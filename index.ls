_ = require \lodash

{TEST_TOKEN} = process.env
request = require \request-promise .defaults {+json, headers:authorization: "Bearer #TEST_TOKEN"}

{create-element:e} = require \react
{render-to-static-markup:render} = require \react-dom/server

BUCKET = 'ci-piers.urbit.org'

module.exports = (req,res)->
  {items} <- request.get "https://www.googleapis.com/storage/v1/b/#BUCKET/o" .then
  res.end render e \html {},
    e \head {} e \title {} "Yo"
    e \body {} e \ul {},
      _.sort-by items, (.updated) .map ({name,updated})->
        e \li {key:name},
          e \b {} updated
          " "
          e \a {href:"https://#BUCKET/#name"} name
