require "ops_utils/version"

module OpsUtils
  class Error < StandardError; end

  module_function

  def get_file_mtime(files)
    # filesの最終更新日時を調べ、一番小さいものを返す。
    # filesが非存在の場合、最終更新日時を西暦1年1月1日0:00にする
    time_ar=[]
    Dir.glob(files).each do |file|
      time_ar << File.mtime(file)
    end
    if time_ar.length == 0
      Time.local(1,1,1)
    else
      time_ar.sort[0]
    end
  end
  # fileの最終更新日時とNowの差がinterval_hoursと同じか小さければtrue, 
  # そうでなければfalseを返す。
  # fileはワイルドカード指定可能。その場合は最終更新日時が一番小さいものと比較する
  def has_updated_recently?(file, interval_hours)
    interval_seconds = interval_hours * 3600
    Time.now - get_file_mtime(file) < interval_seconds ? true : false
  end
end
