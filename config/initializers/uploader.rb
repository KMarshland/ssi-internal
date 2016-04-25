#makes sure the upload directories exist
require 'fileutils'
path = Rails.root.join('public', 'uploads', 'internal', 'resumes', '_')
dirname = File.dirname(path)
unless File.directory?(dirname)
  FileUtils.mkdir_p(dirname)
end
