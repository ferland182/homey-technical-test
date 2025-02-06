json.extract! status_change, :id, :status, :project_id, :user_id, :created_at, :updated_at
json.url status_change_url(status_change, format: :json)
