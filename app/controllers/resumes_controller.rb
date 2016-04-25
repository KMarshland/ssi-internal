class ResumesController < ApplicationController
  protect_from_forgery

  before_action :set_resume, only: [:show, :edit, :update, :destroy]
  before_action :requires_logged_in, except: [:create]

  def upload
    file = params[:file]
    return render json: {success: false, errors: 'Must provide a file to upload'} if file.blank?

    uploaded_io = params[:file].tempfile

    return render json: {success: false, errors: 'Could not read file'} if uploaded_io.nil?
    return render json: {success: false, errors: 'Must be a pdf'} unless file.content_type == 'application/pdf'

    path = Rails.root.join('public', 'uploads', 'internal', 'resumes', current_user.id.to_s)
    Dir.mkdir(path) unless Dir.exist?(path)

    path = Rails.root.join('public', 'uploads', 'internal', 'resumes', current_user.id.to_s, "#{DateTime.now.strftime('%Y%m%d-%H%M%S')}_#{file.original_filename}")
    File.open(path, 'wb') do |file|
      file.write(uploaded_io.read)
    end

    render json: {success: true, uri: File.join('uploads', 'internal', 'resumes', current_user.id.to_s, "#{DateTime.now.strftime('%Y%m%d-%H%M%S')}_#{file.original_filename}").to_s}
  end

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = current_user.resumes
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resume
    @resume = Resume.find(params[:id])
    unless current_user.is_admin? || current_user.resumes.include?(@resume)
      redirect_to permissions_path
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resume_params
    puts params.inspect
    params.require(:resume).permit(:user_id, :title, :uri)
  end

end
