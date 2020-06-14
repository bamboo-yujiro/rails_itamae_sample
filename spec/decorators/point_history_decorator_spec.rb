# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PointHistoryDecorator do
  let(:point_history) { PointHistory.new.extend PointHistoryDecorator }
  subject { point_history }
  it { should be_a PointHistory }
end
