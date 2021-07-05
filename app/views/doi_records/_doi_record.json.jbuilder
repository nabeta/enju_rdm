json.extract! doi_record, :id, :identifier, :dataset_id, :created_at, :updated_at
json.url doi_record_url(doi_record, format: :json)
