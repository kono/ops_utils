require 'test_helper'


class OpsUtilsTest < Test::Unit::TestCase 
  def test_that_it_has_a_version_number
    refute_nil ::OpsUtils::VERSION
  end

  sub_test_case 'assersions for has_updated_recently? method' do
    setup do
      stub(File).mtime('testfile'){Time.local(2020,10,16,10,0,0,0)}
      stub(Time).now{Time.local(2020,10,17,0,0,0,0)}
    end

    test 'has_updated_recently? method returns true with params "testfile" and 24 hours' do
      assert_true OpsUtils.has_updated_recently?('testfile', 24)
    end

    test 'has_updated_recentry? method returns false with params "testfile" and 12 hours' do
      assert_false OpsUtils.has_updated_recently?('testfile', 12)
    end
  end
end
