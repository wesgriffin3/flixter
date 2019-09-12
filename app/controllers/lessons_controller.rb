class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def show
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section), alert: "You Must Be Enrolled"
    end
  end

  private

  def require_authorized_for_current_lesson
    if current_user.enrolled_in? (current_lesson.section.course) != true
        flash[:notice] = "You Must Be Enrolled"
      redirect_to course_path(current_lesson.section.course)
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end