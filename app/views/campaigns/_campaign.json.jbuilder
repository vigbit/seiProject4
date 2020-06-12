json.extract! campaign, :id, :title, :img_url, :content, :user_id, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
