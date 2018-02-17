class Api::V1::SearchController < BaseController

  def find_users
    if !params[:search_users].blank?
      search = params[:search_users] == '*' ? nil : params[:search_users]
      @users = User.search search, where: {_id: {not: current_user.id}}, fields: [:name], match: :text_middle
      render :find_users, status: :ok
    else
      head(:not_found)
    end
  end

end
