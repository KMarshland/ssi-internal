#makes sure the upload directories exist
require 'fileutils'
paths = [
    Rails.root.join('public', 'uploads', 'internal', 'resumes', '_'),
    Rails.root.join('public', 'uploads', 'resume-exports', '_'),
    Rails.root.join('public', 'uploads', 'general', '_')
]
paths.each do |path|
  dirname = File.dirname(path)
  unless File.directory?(dirname)
    FileUtils.mkdir_p(dirname)
  end
end
