require "ops_utils/version"

module OpsUtils
  class Error < StandardError; end

  # fileの最終更新日時とNowの差がinterval_hoursと同じか小さければtrue, 
  # そうでなければfalseを返す
  def has_updated_recently?(file, interval_hours)
    interval_seconds = interval_hours * 3600
    Time.now - File.mtime(file) < interval_seconds ? true : false
  end
end
