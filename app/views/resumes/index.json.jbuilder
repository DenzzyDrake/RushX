json.array!(@resumes) do |resume|
  json.extract! resume, :id, :name, :attachment
  json.url resume_url(resume, format: :json)
end
