require 'test_helper'

# テスト用にOpsUtilsモジュールのメソッドの一部をオーバーライドするためのクラス
class OpsUtils_fake 
  include OpsUtils

end

class OpsUtilsTest < Test::Unit::TestCase 
  def test_that_it_has_a_version_number
    refute_nil ::OpsUtils::VERSION
  end

  test 'has_updated_recently? method returns true with params "testfile" and 24 hours' do
    o = OpsUtils_fake.new
    stub(File).mtime('testfile'){Time.local(2020,10,16,10,0,0,0)}
    stub(Time).now{Time.local(2020,10,17,0,0,0,0)}

    assert_true o.has_updated_recently?('testfile', 24)
  end

  test 'has_updated_recentry? method returns false with params "testfile" and 12 hours' do
    o = OpsUtils_fake.new
    stub(File).mtime('testfile'){Time.local(2020,10,16,10,0,0,0)}
    stub(Time).now{Time.local(2020,10,17,0,0,0,0)}

    assert_false o.has_updated_recently?('testfile', 12)
  end
end
