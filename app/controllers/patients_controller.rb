class PatientsController < ApplicationController


  def new
    @patient = Patient.new
  end


  def create
    save_patient("new")
  end

  def index 
    if current_user.profile_incomplete?
      redirect_to new_patient_path()
    else
      redirect_to patient_path(current_user.patient)
    end
  end

  def show   
  end

  def edit
     @patient = Patient.find(params[:id])
  end

  def update
    save_patient("edit")
  end

private
  def save_patient(success_path)
    @patient = current_user.build_patient(patient_params)
    if @patient.save
      current_user.update_attribute(:profile_incomplete, false)
      redirect_to patient_path(:id) 
    else
        render success_path
    end
  end

  def patient_params
    params.require(:patient).permit(:name, :age, :gender, :address, :city, :bloodgroup)
  end
end