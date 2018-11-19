Dir[File.expand_path('../classes', __FILE__) << '/*.rb'].each do |file|
  require file
end
