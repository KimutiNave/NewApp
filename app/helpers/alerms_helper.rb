module AlermsHelper
  def unchecked_alerms
    @alerms = current_user.alerms.where(notice: false)
  end
end
