class CoursesController < ApplicationController
	

	def index
		if params[:title].blank?
			if params[:teacher].blank?
				if params[:time].blank?
					@courses=Course.all
				end
			end
		end
		if params[:title].present? 
			if params[:teacher].present?
				if params[:time].present?
					@courses = Course.where("title like ?","%#{params[:title]}%").where("teacher like ?","%#{params[:teacher]}%").where("time like ?","%#{params[:time]}%")
				end
				if params[:time].blank?
					@courses = Course.where("title like ?","%#{params[:title]}%").where("teacher like ?","%#{params[:teacher]}%")
				end
			end
			if params[:teacher].blank?
				if params[:time].present?
					@courses = Course.where("title like ?","%#{params[:title]}%").where("time like ?","%#{params[:time]}%")
				end
				if params[:time].blank?
					@courses = Course.where("title like ?","%#{params[:title]}%")
				end
			end
		end
		if params[:title].blank?
			if params[:teacher].present?
				if params[:time].present?
					@courses = Course.where("teacher like ?","%#{params[:teacher]}%").where("time like ?","%#{params[:time]}%")
				end
				if params[:time].blank?
					@courses = Course.where("teacher like ?","%#{params[:teacher]}%")
				end
			end
		end
		if params[:title].blank?
			if params[:teacher].blank?
				if params[:time].present?
					@courses = Course.where("time like ?","%#{params[:time]}%")
				end
			end	
		end	
	end

	def show
		@course=Course.find(params[:id])
	end

	def  new
		@course = Course.new
	end
	def create
		@course = Course.new(course_params)
		if @course.save
			redirect_to root_path
		else
			render  :new
		end
	end
	def edit
		@course=Course.find(params[:id])

	end
	def  update
		@course=Course.find(params[:id])
		if @course.update(course_params)
			redirect_to root_path
		else
			render :edit
		end

	end
	def destroy
		@course=Course.find(params[:id])
		@course.destroy
		redirect_to root_path
	end
	private
	def  course_params
	params.require(:course).permit(:title,:teacher,:time,:place,:credits)
	end


end
