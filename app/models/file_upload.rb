# == Schema Information
#
# Table name: file_uploads
#
#  id         :integer          not null, primary key
#  name       :string
#  size       :integer
#  uri        :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FileUpload < ActiveRecord::Base

  def self.from_file(file, uploaded_io, opts={})
    puts file.methods.inspect
    path = opts.with_indifferent_access[:path] || Rails.root.join('public', 'uploads', 'internal', 'general')
    Dir.mkdir(path) unless Dir.exist?(path)

    path = path.join("#{DateTime.now.strftime('%Y%m%d-%H%M%S')}_#{file.original_filename}")
    File.open(path, 'wb') do |file|
      file.write(uploaded_io.read)
    end

    FileUpload.create(uri: path, name: file.original_filename, size: file.original_size, url: path.split('public')[1])
  end

end
