class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end
    # sets the Content-Type header in the response to application/json (FAILED - 3)
    # returns an array of JSON objects for all bakeries in the database (FAILED - 4)
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)

  end
    # sets the Content-Type header in the response to application/json (FAILED - 5)
    # returns a single bakery as JSON with its baked goods nested (FAILED - 6)
  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end
    # returns an array of baked goods as JSON, sorted by price in descending order (FAILED - 7)
  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.all.order(price: :desc).first
    baked_good.to_json
  end
    # returns the single most expensive baked good as JSON (HINT: how can you sort the baked goods in a particular order?) (FAILED - 8)

end
