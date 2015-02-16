# Rest Collection Student
collection = settings.mongo_db['estudiantes']

# Finding

get '/estudiantes/?' do
  content_type :json
  collection.find.to_a.to_json
end

# find a document by its ID
get '/estudiante/:id/?' do
  content_type :json
  collection.find_one(:_id => params[:id].to_i).to_json
end

# Inserting

post '/new_estudiante/?' do
  content_type :json
  student = JSON.parse request.body.read
  puts 'Parameters: ' + student.to_s
  new_id = collection.insert student
  document_by_id(new_id)
end

# Updating

post '/update_name/:id/?' do
  content_type :json
  id = BSON::ObjectId.from_string(params[:id].to_s)
  params = JSON.parse request.body.read
  name = params['name'].to_s
  age = params['age'].to_i
  collection.update({:_id => id}, {'$set' => {:name => name, :age => age} })
  document_by_id(id)
end

post '/post/?' do
  params = JSON.parse request.body.read
  puts params['name']
end