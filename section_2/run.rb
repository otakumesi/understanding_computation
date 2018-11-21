Dir[File.expand_path('../simple', __FILE__) << '/*.rb'].each do |file|
  require file
end
