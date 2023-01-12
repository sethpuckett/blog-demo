json.articles @articles do |article|
  json.partial! "article", article: article
end