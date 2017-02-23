require 'test_helper'

class EventFlowTest < Capybara::Rails::TestCase
  def setup
    @one = events :one
    @two = events :two
  end

  test 'event index' do
    visit events_path
 
    assert page.has_content?(@one.title)
    assert page.has_content?(@two.title)
  end
end 
