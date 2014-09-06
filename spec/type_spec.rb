# encoding: utf-8
require "spec_helper"
require "type"

describe Type do
  context :BASIC_NOT_ACTION do
  	X = Struct.new(:type,:name)
    it{expect(Type.new(X[Type::BASIC,"電脳"]).to_s).to eq ""}
    it{expect(Type.new(X[Type::BASIC,"心理"]).to_s).to eq "★"}
    it{expect(Type.new(X[Type::MISTIQUE,""]).to_s).to eq "†"}
    it{expect(Type.new(X[Type::ULTIMATE,""]).to_s).to eq "※"}
  end
end