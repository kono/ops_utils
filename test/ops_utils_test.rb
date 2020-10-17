require 'test_helper'

# テスト用にOpsUtilsモジュールのメソッドの一部をオーバーライドするためのクラス
class OpsUtils_fake 
  include OpsUtils
end

class OpsUtilsTest < Test::Unit::TestCase 
  def test_that_it_has_a_version_number
    refute_nil ::OpsUtils::VERSION
  end

  test 'has_updated_recently? method' do
    
  end
end
