# frozen_string_literal: true

require 'test_helper'

class EnquetesDecoratorTest < ActiveSupport::TestCase
  def setup
    @enquetes = Enquetes.new.extend EnquetesDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
