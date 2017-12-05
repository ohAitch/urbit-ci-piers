storage = (require \@google-cloud/storage)!
{create-element:e} = require \react
{render-to-static-markup:render} = require \react-dom/server

BUCKET = 'ci-piers.urbit.org'
module.exports = (req,res)->
  [files] <- storage.bucket BUCKET .get-files!.then
  res.end render e \html {},
    e \head {} e \title {} "Yo"
    e \body {} e \ul {},
      files.map ({name,metadata:{updated}})->
        e \li {key:name},
          e \b {} updated
          " "
          e \a {href:"https://#BUCKET/#name"} name
