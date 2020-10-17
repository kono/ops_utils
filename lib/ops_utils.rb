require "ops_utils/version"

module OpsUtils
  class Error < StandardError; end

  # fileの最終更新日時とNowの差がinterval_hoursと同じか小さければtrue, 
  # そうでなければfalseを返す
  def has_updated_recently? (file, interval_hours)
    true
  end
end
