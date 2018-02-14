module SearchHelper

  def find_all_users(params)
    search = check_search_params(params)
    @users = User.search search, where: {_id: {not: current_user.id}}, fields: [:name], match: :text_middle
  end

  private

  def check_search_params(params)
    params == '*' ? nil : params
  end

end
