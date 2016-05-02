class FileUploadsController < ApplicationController
  before_action :requires_logged_in

  def upload
    file = params[:file]
    return render json: {success: false, errors: 'Must provide a file to upload'} if file.blank?

    uploaded_io = params[:file].tempfile
    return render json: {success: false, errors: 'Could not read file'} if uploaded_io.nil?

    uploaded = FileUpload.from_file(file, uploaded_io)

    render json: {success: true, url: uploaded.url}
  end

end
